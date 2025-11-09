
import 'package:podcast_player/api/podcast/mobile_podcast_api.dart';
import 'package:podcast_player/api/podcast/podcast_api.dart';
import 'package:podcast_player/bloc/discovery/discovery_bloc.dart';
import 'package:podcast_player/bloc/podcast/audio_bloc.dart';
import 'package:podcast_player/bloc/podcast/episode_bloc.dart';
import 'package:podcast_player/bloc/podcast/opml_bloc.dart';
import 'package:podcast_player/bloc/podcast/podcast_bloc.dart';
import 'package:podcast_player/bloc/podcast/queue_bloc.dart';
import 'package:podcast_player/bloc/search/search_bloc.dart';
import 'package:podcast_player/bloc/settings/settings_bloc.dart';
import 'package:podcast_player/bloc/ui/pager_bloc.dart';
import 'package:podcast_player/l10n/L.dart';
import 'package:podcast_player/navigation/navigation_route_observer.dart';
import 'package:podcast_player/repository/repository.dart';
import 'package:podcast_player/repository/sembast/sembast_repository.dart';
import 'package:podcast_player/services/audio/audio_player_service.dart';
import 'package:podcast_player/services/audio/default_audio_player_service.dart';
import 'package:podcast_player/services/download/download_service.dart';
import 'package:podcast_player/services/download/mobile_download_manager.dart';
import 'package:podcast_player/services/download/mobile_download_service.dart';
import 'package:podcast_player/services/podcast/mobile_opml_service.dart';
import 'package:podcast_player/services/podcast/mobile_podcast_service.dart';
import 'package:podcast_player/services/podcast/opml_service.dart';
import 'package:podcast_player/services/podcast/podcast_service.dart';
import 'package:podcast_player/services/settings/mobile_settings_service.dart';
import 'package:podcast_player/ui/podmate_home_page.dart';
import 'package:podcast_player/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


var theme = Themes.lightTheme().themeData;

/// Anytime is a Podcast player. You can search and subscribe to podcasts,
/// download and stream episodes and view the latest podcast charts.
// ignore: must_be_immutable
class PodMateApp extends StatefulWidget {
  final Repository repository;
  late PodcastApi podcastApi;
  late DownloadService downloadService;
  late AudioPlayerService audioPlayerService;
  late OPMLService opmlService;
  PodcastService? podcastService;
  SettingsBloc? settingsBloc;
  MobileSettingsService mobileSettingsService;
  List<int> certificateAuthorityBytes;

  PodMateApp({
    super.key,
    required this.mobileSettingsService,
    required this.certificateAuthorityBytes,
  }) : repository = SembastRepository() {
    podcastApi = MobilePodcastApi();

    podcastService = MobilePodcastService(
      api: podcastApi,
      repository: repository,
      settingsService: mobileSettingsService,
    );

    assert(podcastService != null);

    downloadService = MobileDownloadService(
      repository: repository,
      downloadManager: MobileDownloaderManager(),
      podcastService: podcastService!,
    );

    audioPlayerService = DefaultAudioPlayerService(
      repository: repository,
      settingsService: mobileSettingsService,
      podcastService: podcastService!,
    );

    settingsBloc = SettingsBloc(mobileSettingsService);

    opmlService = MobileOPMLService(
      podcastService: podcastService!,
      repository: repository,
    );

    podcastApi.addClientAuthorityBytes(certificateAuthorityBytes);
  }

  @override
  PodMateAppState createState() => PodMateAppState();
}

class PodMateAppState extends State<PodMateApp> {
  ThemeData? theme;

  @override
  void initState() {
    super.initState();

    /// Listen to theme change events from settings.
    widget.settingsBloc!.settings.listen((event) {
      setState(() {
        var newTheme = Themes.darkTheme().themeData;

        /// As we add new themes, we will move this selection into its own theme module.
        switch (event.theme) {
          case 'system':
            var brightness =
                SchedulerBinding.instance.platformDispatcher.platformBrightness;
            newTheme = brightness == Brightness.dark
                ? Themes.darkTheme().themeData
                : Themes.lightTheme().themeData;
            break;
          case 'light':
            newTheme = Themes.lightTheme().themeData;
            break;
          case 'dark':
            newTheme = Themes.darkTheme().themeData;
            break;
        }

        /// Only update the theme if it has changed.
        if (newTheme != theme) {
          theme = newTheme;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SearchBloc>(
          create: (_) => SearchBloc(podcastService: widget.podcastService!),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<DiscoveryBloc>(
          create: (_) => DiscoveryBloc(podcastService: widget.podcastService!),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<EpisodeBloc>(
          create: (_) => EpisodeBloc(
            podcastService: widget.podcastService!,
            audioPlayerService: widget.audioPlayerService,
          ),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<PodcastBloc>(
          create: (_) => PodcastBloc(
            podcastService: widget.podcastService!,
            audioPlayerService: widget.audioPlayerService,
            downloadService: widget.downloadService,
            settingsService: widget.mobileSettingsService,
          ),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<PagerBloc>(
          create: (_) => PagerBloc(),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<AudioBloc>(
          create: (_) =>
              AudioBloc(audioPlayerService: widget.audioPlayerService),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<SettingsBloc?>(
          create: (_) => widget.settingsBloc,
          dispose: (_, value) => value!.dispose(),
        ),
        Provider<OPMLBloc>(
          create: (_) => OPMLBloc(opmlService: widget.opmlService),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<QueueBloc>(
          create: (_) => QueueBloc(
            audioPlayerService: widget.audioPlayerService,
            podcastService: widget.podcastService!,
          ),
          dispose: (_, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
        title: 'Anytime Podcast Player',
        navigatorObservers: [NavigationRouteObserver()],
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          AnytimeLocalisationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
          Locale('es', ''),
          Locale('de', ''),
          Locale('gl', ''),
          Locale('it', ''),
          Locale('nl', ''),
          Locale('ru', ''),
          Locale('vi', ''),
        ],
        theme: theme,
        // Uncomment builder below to enable accessibility checker tool.
        // builder: (context, child) => AccessibilityTools(child: child),
        home: const PodMateHomePage(title: 'PodMate'),
      ),
    );
  }
}
