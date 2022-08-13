import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/domain/model/entity/movie/episode.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/domain/model/entity/movie/season.dart';
import 'package:prueba_leal/domain/model/port/in/movies/movie_use_case_port.dart';

part 'detail_episode_state.dart';

class DetailEpisodeCubit extends Cubit<DetailEpisodeState> {
  final MovieUseCasePort _movieUseCasePort;

  DetailEpisodeCubit(this._movieUseCasePort)
      : super(const DetailEpisodeState(status: DetailEpisodeStatus.loading));

  ///Carga los episodeos de la primera temporada
  void getFirstSeason(Movie movie) async {
    try {
      ///Traemos la informacion adicional para saber cuantas temporadas tiene
      ///la pelicula y cual fue el ultimo episodeo en emision.
      late Movie movieWithDetails;

      ///Cargamos la informacion de la primera temporada.
      late Season season;

      await Future.wait([
        _movieUseCasePort.getDetails(movie),
        _movieUseCasePort.getSeason(movie.id, 1)
      ]).then((result) {
        movieWithDetails = result[0] as Movie;
        season = result[1] as Season;
      });

      emit(state.copyWith(
        movie: movieWithDetails,
        isMovieFavorite: movieWithDetails.isFavorite,
        status: DetailEpisodeStatus.success,
        currentEpisode: season.episodes[1],
        currentNumSeason: 1,
        maxSeason: movieWithDetails.totalSeasons,
        isTheLastEpisode:
            movieWithDetails.lastEpisodeToAir!.id == season.episodes[1]!.id,
        currentSeason: season,
      ));
    } catch (e) {
      emit(state.copyWith(status: DetailEpisodeStatus.error));
    }
  }

  ///Carga el proximo episodeo o temporada segun corresponda, ademas cambia la bandera
  ///[isTheLastEpisode] si es el ultimo episodeo de la serie
  void nextEspisode() async {
    try {
      int currentNumSeason = state.currentNumSeason;
      Season season = state.currentSeason!;

      int newNumEpisode = (state.currentEpisode!.episodeNumber) + 1;
      bool isTheLastEpisode = season.episodes.values.length ==
              state.currentEpisode!.episodeNumber + 1 &&
          currentNumSeason == state.movie!.totalSeasons;

      if (!isTheLastEpisode && newNumEpisode > season.episodes.values.length) {
        //Cargamos la informacion de siguiente temporada
        emit(state.copyWith(status: DetailEpisodeStatus.loading));
        season = await _movieUseCasePort.getSeason(
            state.movie!.id, currentNumSeason + 1);
        newNumEpisode = 1;
        currentNumSeason++;
      }

      emit(state.copyWith(
        status: DetailEpisodeStatus.success,
        currentEpisode: state.currentSeason!.episodes[newNumEpisode],
        currentNumSeason: currentNumSeason,
        isTheLastEpisode: isTheLastEpisode,
        currentSeason: season,
      ));
    } catch (e) {
      emit(state.copyWith(status: DetailEpisodeStatus.error));
    }
  }

  void eventClickFavorite() {
    emit(state.copyWith(status: DetailEpisodeStatus.loading));
    Movie movie = state.movie!;

    if (!movie.isFavorite) {
      _movieUseCasePort.addFavorite(movie);
    } else {
      _movieUseCasePort.deleteFavorite(movie);
    }

    movie.isFavorite = !movie.isFavorite;

    emit(state.copyWith(status: DetailEpisodeStatus.success, movie: movie));
  }
}
