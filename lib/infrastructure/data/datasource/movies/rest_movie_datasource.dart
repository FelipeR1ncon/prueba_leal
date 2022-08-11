import 'package:dio/dio.dart';
import 'package:prueba_leal/infrastructure/data/datasource/const_rest.dart';
import 'package:prueba_leal/infrastructure/data/datasource/http_client.dart';
import 'package:prueba_leal/infrastructure/data/datasource/movies/rest_response/episode_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource/movies/rest_response/movie_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource/movies/rest_response/season_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_movie_datasource_port.dart';

import '../../datasource/movies/rest_response/movie_detail_response.dart';
import '../../datasource/movies/rest_response/movie_item_response.dart';

///Clase encargada de trae los datos de la api https://developers.themoviedb.org/3/tv/
///a traves del protocolo REST.
class RestMovieDatasource implements RestMovieDatasourcePort {
  final HttpClient _htppClient;

  RestMovieDatasource(this._htppClient);

  @override
  Future<MovieDetailResponse> getDetail(int idMovie) async {
    try {
      Response response = await _htppClient.get(urlRequest: idMovie.toString());

      return MovieDetailResponse.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EpisodeResponse> getEpisode(
      int idMovie, int numSeason, int numEpisode) async {
    try {
      Response response = await _htppClient.get(
          urlRequest:
              "$idMovie${ConstRest.getSeason}/$numSeason${ConstRest.getEpisode}$numEpisode");

      return EpisodeResponse.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResponse> getPopular(int page) async {
    try {
      Response response = await _htppClient
          .get(urlRequest: ConstRest.getPopularMovies, params: {"page": page});

      Iterable moviesResponse = response.data["results"];

      List<MovieItemResponse> movies = List<MovieItemResponse>.from(
          moviesResponse.map((data) => MovieItemResponse.fromMap(data)));

      return MovieResponse(response.data["page"] as int,
          response.data["total_pages"] as int, movies);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResponse> getRecommendations(int page) async {
    Response response = await _htppClient.get(
        urlRequest: ConstRest.getRecomentationsMovies, params: {"page": page});

    try {
      Iterable moviesResponse = response.data["results"];

      List<MovieItemResponse> movies = List<MovieItemResponse>.from(
          moviesResponse.map((data) => MovieItemResponse.fromMap(data)));

      return MovieResponse(response.data["page"] as int,
          response.data["total_pages"] as int, movies);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SeasonResponse> getSeason(int idMovie, int numSeason) async {
    try {
      Response response = await _htppClient.get(
          urlRequest: "$idMovie${ConstRest.getSeason}$numSeason");

      return SeasonResponse.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResponse> getTvAiringToday(int page) async {
    try {
      Response response = await _htppClient.get(
          urlRequest: ConstRest.getTvAiringTodayMovies, params: {"page": page});

      Iterable moviesResponse = response.data["results"];

      List<MovieItemResponse> movies = List<MovieItemResponse>.from(
          moviesResponse.map((data) => MovieItemResponse.fromMap(data)));

      return MovieResponse(response.data["page"] as int,
          response.data["total_pages"] as int, movies);
    } catch (e) {
      rethrow;
    }
  }
}
