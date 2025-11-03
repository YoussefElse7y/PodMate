import 'package:podcast_player/entities/episode.dart';

abstract class EpisodeState {
  final Episode episode;

  EpisodeState(this.episode);
}

class EpisodeUpdateState extends EpisodeState {
  EpisodeUpdateState(super.episode);
}

class EpisodeDeleteState extends EpisodeState {
  EpisodeDeleteState(super.episode);
}
