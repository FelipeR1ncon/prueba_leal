import 'package:equatable/equatable.dart';
import 'package:prueba_leal/domain/model/entity/movie/episode.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/entity/movie/season.dart';
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
      late List<Movie> popularMovies;
      late List<Movie> recommendedMovies;
      late List<Movie> tvAiRToday;
      late Season season;
      late Episode episode;

      // await Future.wait([
      popularMovies = await _movieUseCasePort.getPopular(1);
      recommendedMovies = await _movieUseCasePort.getRecommendations(1);
      tvAiRToday = await _movieUseCasePort.getTvAiringToday(1);
      season = await _movieUseCasePort.getSeason(71912, 2);
      episode = await _movieUseCasePort.getEpisode(71912, 1, 1);
      // //  ]).then((value) {
      //     popularMovies = value[0] as List<Movie>;
      //     recommendedMovies = value[1] as List<Movie>;
      //     tvAiRToday = value[2] as List<Movie>;
      //     season = value[3] as Season;
      //     episode = value[4] as Episode;
      //   });

      Movie movieDetails = await _movieUseCasePort.getDetails(popularMovies[0]);

      emit(state.copyWith(
          homeStatus: HomeStatus.loading,
          popularMovies: popularMovies,
          recommendedMovies: recommendedMovies));
    } catch (e) {
      state.copyWith(
          homeStatus: HomeStatus.error,
          popularMovies: [],
          recommendedMovies: []);
    }
  }
}
