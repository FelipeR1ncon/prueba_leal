import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/movie_response.dart';

import '../../datasource_port/movies/rest_response/episode_response.dart';
import '../../datasource_port/movies/rest_response/movie_detail_response.dart';
import '../../datasource_port/movies/rest_response/season_response.dart';

abstract class RestMovieDatasourcePort {
  Future<MovieResponse> getPopular(int page);

  Future<MovieResponse> getRecommendations(int page);

  Future<SeasonResponse> getSeason(int idMovie, int numSeason);

  Future<EpisodeResponse> getEpisode(
      int idMovie, int numSeason, int numEpisode);

  Future<MovieResponse> getTvAiringToday(int page);

  Future<MovieDetailResponse> getDetail(int idMovie);
}
