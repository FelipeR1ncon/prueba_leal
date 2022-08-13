// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  bool isFavorite;

  Movie(
      {required this.name,
      required this.id,
      required this.backdropPath,
      required this.posterPath,
      this.voteAverage = 0.0,
      this.totalEpisodes = 0,
      this.totalSeasons = 0,
      this.isFavorite = false}) {
    seasons = {};
  }

  void addSeason(int numberSeason, Season season) {
    seasons[numberSeason] = season;
  }

  Season? getSeason(int numberSeason) {
    return seasons[numberSeason];
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.backdropPath == backdropPath &&
        other.posterPath == posterPath &&
        other.voteAverage == voteAverage &&
        other.totalEpisodes == totalEpisodes &&
        other.totalSeasons == totalSeasons &&
        other.lastEpisodeToAir == lastEpisodeToAir &&
        other.seasons == seasons &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        backdropPath.hashCode ^
        posterPath.hashCode ^
        voteAverage.hashCode ^
        totalEpisodes.hashCode ^
        totalSeasons.hashCode ^
        lastEpisodeToAir.hashCode ^
        seasons.hashCode ^
        isFavorite.hashCode;
  }
}
