import 'episode.dart';

class Season {
  final String overview;
  final int seasonNumber;
  final Map<int, Episode> episodes;

  Season(this.overview, this.seasonNumber, this.episodes);
}
