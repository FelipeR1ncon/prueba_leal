// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:prueba_leal/domain/model/entity/movie/episode.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/entity/movie/season.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';
import 'package:prueba_leal/domain/model/port/in/sesion/user.dart';
import 'package:prueba_leal/domain/model/port/out/movies/movie_repository_port.dart';

class MovieUseCase implements MovieUseCasePort {
  final MovieRepositoryPort _movieRepositoryPort;

  // ignore: prefer_final_fields
  late Map<User, List<Movie>> _favoriteMovies;

  MovieUseCase(this._movieRepositoryPort) : _favoriteMovies = {};

  @override
  void addFavorite(User user, Movie movie) {
    if (_favoriteMovies.containsKey(user)) {
      _favoriteMovies[user]!.add(movie);
    } else {
      _favoriteMovies[user] = [movie];
    }
  }

  @override
  clearData() {
    _favoriteMovies.clear();
  }

  @override
  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode) {
    return _movieRepositoryPort.getEpisode(idMovie, numSeason, numEpisode);
  }

  @override
  List<Movie> getFavorites(User user) {
    if (_favoriteMovies.containsKey(user)) {
      return _favoriteMovies[user]!;
    } else {
      return [];
    }
  }

  @override
  Future<List<Movie>> getPopular(int page) {
    return _movieRepositoryPort.getPopular(page);
  }

  @override
  Future<List<Movie>> getRecommendations(int page) {
    return _movieRepositoryPort.getRecommendations(page);
  }

  @override
  Future<Season> getSeason(int idMovie, int numSeason) {
    return _movieRepositoryPort.getSeason(idMovie, numSeason);
  }

  @override
  Future<List<Movie>> getTvAiringToday(int page) {
    return _movieRepositoryPort.getTvAiringToday(page);
  }

  @override
  Future<Movie> getDetails(Movie movie) {
    return _movieRepositoryPort.getDetail(movie);
  }
}
