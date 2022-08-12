import 'package:equatable/equatable.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie_availability.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MovieUseCasePort _movieUseCasePort;

  HomeCubit(this._movieUseCasePort)
      : super(const HomeState(homeStatus: HomeStatus.loading)) {
    getInitialMovies();
  }

  ///Trae la primara pagina de las peliculas recomendadas y populares
  void getInitialMovies() async {
    try {
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
}
