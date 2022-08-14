import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie_availability.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._movieUseCasePort)
      : super(const HomeState(homeStatus: HomeStatus.loading)) {
    _subscribeToFavoriteStream();
    getInitialMovies();
  }

  final MovieUseCasePort _movieUseCasePort;
  late final StreamSubscription _subscription;

  ////Se actualizan los favoritos de la lista de recomendados
  void _subscribeToFavoriteStream() {
    _subscription = _movieUseCasePort.items.listen((items) {
      emit(state.copyWith(homeStatus: HomeStatus.loading));
      List<Movie> recomendation = state.recommendedMovies!;

      for (var elementRecomendation in recomendation) {
        bool isFavorite = false;
        for (var elementFavorite in items) {
          if (elementFavorite.id == elementRecomendation.id) {
            isFavorite = true;
            break;
          }
        }
        elementRecomendation.isFavorite = isFavorite;
      }

      emit(state.copyWith(
          homeStatus: HomeStatus.success, recommendedMovies: recomendation));
    });
  }

  ///Trae la primara pagina de las peliculas recomendadas y populares
  void getInitialMovies() async {
    try {
      emit(state.copyWith(homeStatus: HomeStatus.loading));
      late MovieAvailability popularMovies;
      late MovieAvailability recommendedMovies;
      await Future.wait([
        _movieUseCasePort.getPopular(1),
        _movieUseCasePort.getRecommendations(1)
      ]).then((value) {
        popularMovies = value[0];
        recommendedMovies = value[1];
      });

      emit(state.copyWith(
          homeStatus: HomeStatus.success,
          popularMovies: popularMovies.movies,
          currentPagePopular: popularMovies.page,
          limitPagePopular: popularMovies.totalPages,
          recommendedMovies: recommendedMovies.movies,
          currentPageRecommended: recommendedMovies.page,
          limitPageRecomended: recommendedMovies.totalPages));
    } catch (e) {
      state.copyWith(
          homeStatus: HomeStatus.error,
          popularMovies: [],
          recommendedMovies: []);
    }
  }

  void addFavorite(Movie movie) {
    _movieUseCasePort.addFavorite(movie);
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
