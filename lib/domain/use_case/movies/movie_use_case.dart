// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_final_fields
import 'package:prueba_leal/domain/model/entity/movie/episode.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/entity/movie/season.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';
import 'package:prueba_leal/domain/model/port/out/movies/movie_repository_port.dart';

import '../../model/entity/movie/movie_availability.dart';

///Caso de uso encargo de realizar las operaciones con el dominiio de peliculas.
class MovieUseCase implements MovieUseCasePort {
  final MovieRepositoryPort _movieRepositoryPort;

  // ignore: prefer_final_fields
  ///List para guardar las peliculaas favoritas que elija al usuario
  ///ya que este caso de uso singleton y no requerir que se persistan
  ///la almacenamos en esta variable pera que se guarde durante la ejecucion de la app
  late List<Movie> _favoriteMovies;

  MovieUseCase(this._movieRepositoryPort) : _favoriteMovies = [];

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
  }

  ///Este metodo utiliza cuando se cierra sesion para limpiar cualquier dato que
  ///este asociado con la sesion del usuario
  @override
  clearData() {
    _favoriteMovies.clear();
  }

  ///Metodo que obtiene la informacion de episodeo especifico
  @override
  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode) {
    return _movieRepositoryPort.getEpisode(idMovie, numSeason, numEpisode);
  }

  /// @return los favoritos asociados durante la sesion.
  @override
  List<Movie> getFavorites() {
    return _favoriteMovies;
  }

  ///@List<Movie> correspondientes a la [page] con las mas populares del momento.
  @override
  Future<MovieAvailability> getPopular(int page) {
    return _movieRepositoryPort.getPopular(page);
  }

  ///@List<Movie> correspondientes a la [page] recomendadas del momento.
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
  ///esta info adiccional es la cantidad totla de capitulos y de temporadas
  ///ademas de cual fue el ultimo capito que salio al aire hasta ahora.
  @override
  Future<Movie> getDetails(Movie movie) {
    return _movieRepositoryPort.getDetail(movie);
  }
}
