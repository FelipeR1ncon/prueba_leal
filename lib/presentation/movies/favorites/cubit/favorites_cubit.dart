import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final MovieUseCasePort _movieUseCasePort;
  FavoritesCubit(this._movieUseCasePort)
      : super(const FavoritesState(status: FavoritesStatus.success)) {
    getFavorites();
  }

  ///Carga las peliculas favoritas del usuario
  void getFavorites() {
    emit(state.copyWith(status: FavoritesStatus.loading));

    List<Movie> movies = _movieUseCasePort.getFavorites();

    emit(
        state.copyWith(status: FavoritesStatus.success, favoriteMovie: movies));
  }

  ///Elimina una pelicula de las favoritas
  void deleteFavorite(Movie movie) {
    emit(state.copyWith(status: FavoritesStatus.loading));

    _movieUseCasePort.deleteFavorite(movie);

    emit(state.copyWith(
        status: FavoritesStatus.success,
        favoriteMovie: _movieUseCasePort.getFavorites()));
  }
}
