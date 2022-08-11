import 'dart:convert';

import 'package:prueba_leal/infrastructure/data/datasource/const_rest.dart';
import 'package:prueba_leal/infrastructure/data/datasource/http_client.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_movie_datasource_port.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/season_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/movie_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/movie_detail_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/episode_response.dart';

class RestMovieDatasource implements RestMovieDatasourcePort {
  final HttpClient _htppClient;

  RestMovieDatasource(this._htppClient);

  @override
  Future<MovieDetailResponse> getDetail(int idMovie) async {
    var response = await _htppClient.get(urlRequest: idMovie);

    return MovieDetailResponse.fromJson(json.decode(response.body));
  }

  @override
  Future<EpisodeResponse> getEpisode(
      int idMovie, int numSeason, int numEpisode) async {
    var response = await _htppClient.get(
        urlRequest:
            "idMovie${ConstRest.getSeason}/$numSeason${ConstRest.getEpisode}$numEpisode");

    return EpisodeResponse.fromJson(json.decode(response.body));
  }

  @override
  Future<List<MovieResponse>> getPopular(int page) async {
    List<MovieResponse> movies;
    var response = await _htppClient
        .get(urlRequest: ConstRest.getPopularMovies, params: {"page": page});

    movies = (json.decode(response.body) as List)
        .map((i) => MovieResponse.fromJson(i))
        .toList();

    return movies;
  }

  @override
  Future<List<MovieResponse>> getRecommendations(int page) async {
    List<MovieResponse> movies;
    var response = await _htppClient.get(
        urlRequest: ConstRest.getRecomentationsMovies, params: {"page": page});

    movies = (json.decode(response.body) as List)
        .map((i) => MovieResponse.fromJson(i))
        .toList();

    return movies;
  }

  @override
  Future<SeasonResponse> getSeason(int idMovie, int numSeason) async {
    var response = await _htppClient.get(
        urlRequest: "idMovie${ConstRest.getSeason}numSeason");

    return SeasonResponse.fromJson(json.decode(response.body));
  }

  @override
  Future<List<MovieResponse>> getTvAiringToday(int page) async {
    List<MovieResponse> movies;
    var response = await _htppClient.get(
        urlRequest: ConstRest.getTvAiringTodayMovies, params: {"page": page});

    movies = (json.decode(response.body) as List)
        .map((i) => MovieResponse.fromJson(i))
        .toList();

    return movies;
  }
}
