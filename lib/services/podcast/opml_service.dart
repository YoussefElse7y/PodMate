import 'package:podcast_player/state/opml_state.dart';

/// This service handles the import and export of Podcasts via
/// the OPML format.
abstract class OPMLService {
  Stream<OPMLState> loadOPMLFile(String file);

  Stream<OPMLState> saveOPMLFile();

  void cancel();
}
