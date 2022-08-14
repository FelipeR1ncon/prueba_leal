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
    getInitialMovies();
  }

  final MovieUseCasePort _movieUseCasePort;
  late final StreamSubscription _subscription;

  ////Se actualizan los favoritos de la lista de recomendados
  void _subscribeToFavoriteStream() {
    _subscription = _movieUseCasePort.items.listen((items) {
      if (state.recommendedMovies != null && state.popularMovies != null) {
        emit(state.copyWith(homeStatus: HomeStatus.loading));
        List<Movie> recomendation = state.recommendedMovies!;
        List<Movie> popularMovies = state.popularMovies!;

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

        for (var elementPopular in popularMovies) {
          bool isFavorite = false;
          for (var elementFavorite in items) {
            if (elementPopular.id == elementFavorite.id) {
              isFavorite = true;
              break;
            }
          }
          elementPopular.isFavorite = isFavorite;
        }

        emit(state.copyWith(
            homeStatus: HomeStatus.success,
            recommendedMovies: recomendation,
            popularMovies: popularMovies));
      }
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
      _subscribeToFavoriteStream();
    } catch (e) {
      state.copyWith(
          homeStatus: HomeStatus.error,
          popularMovies: [],
          recommendedMovies: []);
    }
  }

  void eventFavorite(Movie movie) {
    if (movie.isFavorite) {
      _movieUseCasePort.deleteFavorite(movie);
    } else {
      _movieUseCasePort.addFavorite(movie);
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
