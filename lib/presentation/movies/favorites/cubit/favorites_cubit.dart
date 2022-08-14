import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._movieUseCasePort)
      : super(const FavoritesState(status: FavoritesStatus.success)) {
    getFavorites();
  }
  final MovieUseCasePort _movieUseCasePort;
  late final StreamSubscription _subscription;

  ///Actualiza los favoritos cuando se cambian en el home o en la pagina de episodeos
  void _subscribe() {
    _subscription = _movieUseCasePort.items.listen((items) {
      emit(state.copyWith(
          status: FavoritesStatus.success, favoriteMovie: items));
    });
  }

  ///Carga las peliculas favoritas del usuario
  void getFavorites() {
    emit(state.copyWith(status: FavoritesStatus.loading));
    _movieUseCasePort.getFavorites();
    _subscribe();
  }

  ///Elimina una pelicula de las favoritas
  void deleteFavorite(Movie movie) {
    emit(state.copyWith(status: FavoritesStatus.loading));

    _movieUseCasePort.deleteFavorite(movie);
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
