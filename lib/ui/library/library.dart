import 'package:podcast_player/bloc/podcast/podcast_bloc.dart';
import 'package:podcast_player/bloc/podcast/episode_bloc.dart';
import 'package:podcast_player/entities/podcast.dart';
import 'package:podcast_player/entities/episode.dart';
import 'package:podcast_player/l10n/L.dart';
import 'package:podcast_player/state/bloc_state.dart';
import 'package:podcast_player/ui/widgets/platform_progress_indicator.dart';
import 'package:podcast_player/ui/widgets/tile_image.dart';
import 'package:podcast_player/ui/podcast/podcast_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

/// Modern library page with tabs for different content sections
class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _currentTabIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController == null) {
      return const SliverFillRemaining(
        child: Center(child: PlatformProgressIndicator()),
      );
    }

    return SliverFillRemaining(
      hasScrollBody: true,
      child: Column(
        children: [
          // Header with search
          _buildHeader(context),

          // Tab bar
          _buildTabBar(context),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                _ForYouTab(),
                _RecentlyListenTab(),
                _LikedTab(),
                _FollowedTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your library',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to search
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).primaryColor,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        tabs: [
          _buildTab('For you', 0),
          _buildTab('Recently listen', 1),
          _buildTab('Liked', 2),
          _buildTab('Followed', 3),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final isSelected = _currentTabIndex == index;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isSelected ? null : Colors.transparent,
      ),
      child: Text(text),
    );
  }
}

// For You Tab - Shows recommended content and highlights
class _ForYouTab extends StatefulWidget {
  const _ForYouTab();

  @override
  State<_ForYouTab> createState() => _ForYouTabState();
}

class _ForYouTabState extends State<_ForYouTab> {
  @override
  void initState() {
    super.initState();
    final episodeBloc = Provider.of<EpisodeBloc>(context, listen: false);
    episodeBloc.fetchEpisodes(false);
  }

  @override
  Widget build(BuildContext context) {
    final episodeBloc = Provider.of<EpisodeBloc>(context);
    final podcastBloc = Provider.of<PodcastBloc>(context);

    return ListView(
      children: [
        // Highlight channels section
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Highlight channels',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        StreamBuilder<List<Podcast>>(
          stream: podcastBloc.subscriptions,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: PlatformProgressIndicator());
            }

            if (snapshot.data!.isEmpty) {
              return const SizedBox();
            }

            final podcasts = snapshot.data!.take(3).toList();
            return SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: podcasts.length,
                itemBuilder: (context, index) {
                  return _HighlightChannelCard(podcast: podcasts[index]);
                },
              ),
            );
          },
        ),

        // Highlight episodes section
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Text(
            'Highlight episodes',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        StreamBuilder<BlocState>(
          stream: episodeBloc.episodes,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: PlatformProgressIndicator());
            }

            if (snapshot.data is BlocPopulatedState) {
              final episodes =
                  (snapshot.data as BlocPopulatedState).results
                      as List<Episode>?;

              if (episodes == null || episodes.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(L.of(context)!.no_downloads_message),
                  ),
                );
              }

              return Column(
                children: episodes.take(10).map((episode) {
                  return _EpisodeListItem(episode: episode);
                }).toList(),
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}

// Recently Listen Tab
class _RecentlyListenTab extends StatefulWidget {
  const _RecentlyListenTab();

  @override
  State<_RecentlyListenTab> createState() => _RecentlyListenTabState();
}

class _RecentlyListenTabState extends State<_RecentlyListenTab> {
  @override
  void initState() {
    super.initState();
    final episodeBloc = Provider.of<EpisodeBloc>(context, listen: false);
    episodeBloc.fetchEpisodes(false);
  }

  @override
  Widget build(BuildContext context) {
    final episodeBloc = Provider.of<EpisodeBloc>(context);

    return StreamBuilder<BlocState>(
      stream: episodeBloc.episodes,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: PlatformProgressIndicator());
        }

        if (snapshot.data is BlocPopulatedState) {
          final episodes =
              (snapshot.data as BlocPopulatedState).results as List<Episode>?;

          if (episodes == null || episodes.isEmpty) {
            return _buildEmptyState(context);
          }

          // Filter to only show episodes with progress
          final recentEpisodes = episodes.where((e) => e.position > 0).toList();

          if (recentEpisodes.isEmpty) {
            return _buildEmptyState(context);
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: recentEpisodes.length,
            itemBuilder: (context, index) {
              return _RecentEpisodeCard(episode: recentEpisodes[index]);
            },
          );
        }

        return _buildEmptyState(context);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.headset,
              size: 64,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              'No recently played episodes',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// Liked Tab
class _LikedTab extends StatefulWidget {
  const _LikedTab();

  @override
  State<_LikedTab> createState() => _LikedTabState();
}

class _LikedTabState extends State<_LikedTab> {
  @override
  void initState() {
    super.initState();
    final episodeBloc = Provider.of<EpisodeBloc>(context, listen: false);
    episodeBloc.fetchEpisodes(false);
  }

  @override
  Widget build(BuildContext context) {
    final episodeBloc = Provider.of<EpisodeBloc>(context);

    return StreamBuilder<BlocState>(
      stream: episodeBloc.episodes,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data is! BlocPopulatedState) {
          return const Center(child: PlatformProgressIndicator());
        }

        final episodes =
            (snapshot.data as BlocPopulatedState).results as List<Episode>?;
        if (episodes == null || episodes.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text('No liked episodes'),
            ),
          );
        }

        return ListView(
          children: [
            _buildMonthSection(context, 'Aug 2025', episodes.take(8).toList()),
            _buildMonthSection(
              context,
              'Jun 2025',
              episodes.skip(8).take(8).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMonthSection(
    BuildContext context,
    String month,
    List<Episode> episodes,
  ) {
    if (episodes.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            month,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ...episodes.map((episode) => _LikedEpisodeItem(episode: episode)),
      ],
    );
  }
}

// Followed Tab - Shows followed podcasts
class _FollowedTab extends StatelessWidget {
  const _FollowedTab();

  @override
  Widget build(BuildContext context) {
    final podcastBloc = Provider.of<PodcastBloc>(context);

    return StreamBuilder<List<Podcast>>(
      stream: podcastBloc.subscriptions,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: PlatformProgressIndicator());
        }

        if (snapshot.data!.isEmpty) {
          return _buildEmptyState(context);
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return _FollowedPodcastCard(podcast: snapshot.data![index]);
          },
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.podcasts,
              size: 64,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              L.of(context)!.no_subscriptions_message,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Components

class _HighlightChannelCard extends StatelessWidget {
  final Podcast podcast;

  const _HighlightChannelCard({required this.podcast});

  @override
  Widget build(BuildContext context) {
    final podcastBloc = Provider.of<PodcastBloc>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PodcastDetails(podcast, podcastBloc),
          ),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: TileImage(url: podcast.imageUrl!, size: 180),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5 May • 1 hr 30 min',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    podcast.title,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EpisodeListItem extends StatelessWidget {
  final Episode episode;

  const _EpisodeListItem({required this.episode});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TileImage(
              url: episode.imageUrl ?? episode.thumbImageUrl ?? '',
              size: 56,
            ),
          ),
          if (episode.position > 0)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                width: 56 * (episode.percentagePlayed / 100),
              ),
            ),
        ],
      ),
      title: Text(
        episode.title ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${_formatDate(episode.publicationDate)} • ${_formatDuration(episode.duration)}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.favorite_border, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('d MMM').format(date);
  }

  String _formatDuration(int seconds) {
    if (seconds == 0) return '';
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0) {
      return '$hours hr ${minutes > 0 ? "$minutes min" : ""}';
    }
    return '$minutes min';
  }
}

class _RecentEpisodeCard extends StatelessWidget {
  final Episode episode;

  const _RecentEpisodeCard({required this.episode});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TileImage(
                url: episode.imageUrl ?? episode.thumbImageUrl ?? '',
                size: 60,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                child: LinearProgressIndicator(
                  value: episode.percentagePlayed / 100,
                ),
              ),
            ),
          ],
        ),
        title: Text(episode.title ?? '', maxLines: 2),
        subtitle: Text('${episode.percentagePlayed.toInt()}% complete'),
        trailing: const Icon(Icons.play_circle_outline, size: 32),
      ),
    );
  }
}

class _LikedEpisodeItem extends StatelessWidget {
  final Episode episode;

  const _LikedEpisodeItem({required this.episode});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: TileImage(
          url: episode.imageUrl ?? episode.thumbImageUrl ?? '',
          size: 56,
        ),
      ),
      title: Text(episode.title ?? '', maxLines: 2),
      subtitle: Text(_formatDate(episode.publicationDate)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.favorite, size: 18, color: Colors.red),
          const SizedBox(width: 8),
          Text('${(episode.duration ~/ 60)} min'),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('d MMM').format(date);
  }
}

class _FollowedPodcastCard extends StatelessWidget {
  final Podcast podcast;

  const _FollowedPodcastCard({required this.podcast});

  @override
  Widget build(BuildContext context) {
    final podcastBloc = Provider.of<PodcastBloc>(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PodcastDetails(podcast, podcastBloc),
            ),
          );
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TileImage(url: podcast.imageUrl!, size: 56),
        ),
        title: Text(podcast.title, maxLines: 1),
        subtitle: Text(
          podcast.copyright ?? 'Podcast',
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 1,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.person_add_outlined),
          onPressed: () {},
        ),
      ),
    );
  }
}
