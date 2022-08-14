// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_final_fields
import 'dart:async';

import 'package:prueba_leal/domain/model/entity/movie/episode.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/entity/movie/season.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';
import 'package:prueba_leal/domain/model/port/out/movies/movie_repository_port.dart';
import 'package:rxdart/subjects.dart';

import '../../model/entity/movie/movie_availability.dart';

///Caso de uso encargo de realizar las operaciones con el dominiio de peliculas.
class MovieUseCase implements MovieUseCasePort {
  final _controller = BehaviorSubject<List<Movie>>();

  final MovieRepositoryPort _movieRepositoryPort;

  ///List para guardar las peliculas favoritas que elija al usuario
  ///ya que este caso de uso singleton y no requerir que se persistan
  ///la almacenamos en esta variable pera que se guarde durante la ejecucion de la app
  late List<Movie> _favoriteMovies;

  MovieUseCase(this._movieRepositoryPort) : _favoriteMovies = [];

  ///Este metodo utiliza cuando se cierra sesion para limpiar cualquier dato que
  ///este asociado con la sesion del usuario
  @override
  clearData() {
    _favoriteMovies.clear();
  }

  ///Metodo que le permite al usuario seleccionar una pelicula como favorita
  @override
  void addFavorite(Movie movie) {
    bool isNew = true;
    for (Movie currentMovie in _favoriteMovies) {
      if (currentMovie.id == movie.id) {
        isNew = false;
      }
    }
    if (isNew) {
      _favoriteMovies.add(movie);
    }
    addToStream(_favoriteMovies);
  }

  @override
  void deleteFavorite(Movie movie) {
    _favoriteMovies.remove(movie);
    addToStream(_favoriteMovies);
  }

  /// @return los favoritos asociados durante la sesion.
  @override
  List<Movie> getFavorites() {
    addToStream(_favoriteMovies);
    return _favoriteMovies;
  }

  ///Metodo que obtiene la informacion de un episodeo en especifico
  @override
  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode) {
    return _movieRepositoryPort.getEpisode(idMovie, numSeason, numEpisode);
  }

  ///@List<Movie> correspondientes a la [page] con las mas series mas populares del momento.
  @override
  Future<MovieAvailability> getPopular(int page) {
    return _movieRepositoryPort.getPopular(page);
  }

  ///@List<Movie> correspondientes a la [page] con las series mas recomendadas del momento.
  @override
  Future<MovieAvailability> getRecommendations(int page) {
    return _movieRepositoryPort.getRecommendations(page);
  }

  ///Permite obtener la informacion de una season especifica.
  @override
  Future<Season> getSeason(int idMovie, int numSeason) {
    return _movieRepositoryPort.getSeason(idMovie, numSeason);
  }

  ///@List<Movie> correspondientes a la [page] que se encuantra al aire en el momento.
  @override
  Future<MovieAvailability> getTvAiringToday(int page) {
    return _movieRepositoryPort.getTvAiringToday(page);
  }

  ///Permite optener informacion adicional de una [movie] especifica
  ///esta info adiccional es la cantidad total de capitulos y de temporadas
  ///ademas de cual fue el ultimo capitulo que salio al aire.
  @override
  Future<Movie> getDetails(Movie movie) {
    return _movieRepositoryPort.getDetail(movie);
  }

  @override
  void addToStream(List<Movie> items) => _controller.sink.add(items);

  @override
  Stream<List<Movie>> get items => _controller.stream.asBroadcastStream();
}
