import 'dart:async';

import 'package:podcast_player/entities/downloadable.dart';

class DownloadProgress {
  final String id;
  final int percentage;
  final DownloadState status;

  DownloadProgress(this.id, this.percentage, this.status);
}

abstract class DownloadManager {
  Future<String?> enqueueTask(String url, String downloadPath, String fileName);

  Stream<DownloadProgress> get downloadProgress;

  void dispose();
}
