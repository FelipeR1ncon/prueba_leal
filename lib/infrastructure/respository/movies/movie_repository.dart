// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:prueba_leal/domain/model/entity/movie/episode.dart';
import 'package:prueba_leal/domain/model/entity/movie/last_episode_air.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/entity/movie/season.dart';
import 'package:prueba_leal/domain/model/port/out/movies/movie_repository_port.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_movie_datasource_port.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/episode_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/movie_detail_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/movie_response.dart';
import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/season_response.dart';

class MovieRepository implements MovieRepositoryPort {
  final RestMovieDatasourcePort _restMovieDatasourcePort;

  MovieRepository(
    this._restMovieDatasourcePort,
  );

  @override
  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode) async {
    EpisodeResponse episodeData = await _restMovieDatasourcePort.getEpisode(
        idMovie, numSeason, numEpisode);

    return _createEpisodeDomainFromData(episodeData);
  }

  Episode _createEpisodeDomainFromData(EpisodeResponse episodeData) {
    SplayTreeMap<int, String> guestStart = SplayTreeMap();

    for (var guestStartResponse in episodeData.guestStart) {
      guestStart[guestStartResponse.order] = guestStartResponse.name;
    }

    return Episode(
        airDate: episodeData.airDate,
        name: episodeData.name,
        episodeNumber: episodeData.episodeNumber,
        guestStart: guestStart,
        overview: episodeData.overview,
        stillPath: episodeData.stillPath,
        voteAverage: episodeData.voteAverage);
  }

  @override
  Future<List<Movie>> getPopular(int page) async {
    return _createListMovieFromListData(
        await _restMovieDatasourcePort.getPopular(page));
  }

  Movie _createMovieDomainFromData(MovieResponse data) {
    return Movie(
        id: data.id,
        originalName: data.originalName,
        backdropPath: data.backdropPath,
        posterPath: data.posterPath,
        voteAverage: data.voteAverage);
  }

  List<Movie> _createListMovieFromListData(List<MovieResponse> data) {
    List<Movie> movieList = [];

    for (var dataMovie in data) {
      movieList.add(_createMovieDomainFromData(dataMovie));
    }
    return movieList;
  }

  @override
  Future<List<Movie>> getRecommendations(int page) async {
    return _createListMovieFromListData(
        await _restMovieDatasourcePort.getRecommendations(page));
  }

  @override
  Future<Season> getSeason(int idMovie, int numSeason) async {
    SeasonResponse seasonResponse =
        await _restMovieDatasourcePort.getSeason(idMovie, numSeason);

    HashMap<int, Episode> domainEpisodes = HashMap();

    for (var episodeResponse in seasonResponse.episodesResponse) {
      domainEpisodes[episodeResponse.episodeNumber] =
          _createEpisodeDomainFromData(episodeResponse);
    }

    return Season(
        seasonResponse.overview, seasonResponse.seasonNumber, domainEpisodes);
  }

  @override
  Future<List<Movie>> getTvAiringToday(int page) async {
    return _createListMovieFromListData(
        await _restMovieDatasourcePort.getRecommendations(page));
  }

  @override
  Future<Movie> getDetail(Movie movie) async {
    MovieDetailResponse detailResponse =
        await _restMovieDatasourcePort.getDetail(movie.id);

    movie.totalEpisodes = detailResponse.totalEpisodes;
    movie.totalSeasons = detailResponse.totalSeasons;
    movie.lastEpisodeToAir = LastEpisodeToAir(
        detailResponse.lastEpisodeToAirRespone.numberEpisode,
        detailResponse.lastEpisodeToAirRespone.seasonNumber);

    return movie;
  }
}
