import 'dart:collection';

class Episode {
  final int id;
  final int episodeNumber;
  final String name;
  final double voteAverage;
  final String overview;
  final SplayTreeMap<int, String> guestStart;
  final String airDate;
  final String stillPath;

  getStarring() {
    if (guestStart.isEmpty) {
      return "";
    }
    return "${guestStart.values.reduce((value, element) => "$value,$element")}.";
  }

  Episode(
      {required this.id,
      required this.episodeNumber,
      required this.name,
      required this.voteAverage,
      required this.overview,
      required this.guestStart,
      required this.airDate,
      required this.stillPath});
}
