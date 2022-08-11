import 'package:prueba_leal/domain/model/entity/movie/last_episode_air.dart';
import 'package:prueba_leal/domain/model/entity/movie/season.dart';

class Movie {
  final String name;
  final int id;
  final String backdropPath;
  final String posterPath;
  double voteAverage;
  int totalEpisodes;
  int totalSeasons;
  LastEpisodeToAir? lastEpisodeToAir;
  late Map<int, Season> seasons;

  Movie(
      {required this.name,
      required this.id,
      required this.backdropPath,
      required this.posterPath,
      this.voteAverage = 0.0,
      this.totalEpisodes = 0,
      this.totalSeasons = 0}) {
    seasons = {};
  }

  void addSeason(int numberSeason, Season season) {
    seasons[numberSeason] = season;
  }

  Season? getSeason(int numberSeason) {
    return seasons[numberSeason];
  }
}
