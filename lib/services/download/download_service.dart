import 'package:podcast_player/entities/episode.dart';

abstract class DownloadService {
  Future<bool> downloadEpisode(Episode episode);

  Future<Episode?> findEpisodeByTaskId(String taskId);

  void dispose();
}
