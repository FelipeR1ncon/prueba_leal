// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_episode_cubit.dart';

enum DetailEpisodeStatus { loading, success, error }

class DetailEpisodeState extends Equatable {
  final Season? currentSeason;
  final int maxSeason;
  final int currentNumSeason;
  final Episode? currentEpisode;
  final bool isTheLastEpisode;
  final bool isMovieFavorite;
  final DetailEpisodeStatus status;
  final Movie? movie;

  const DetailEpisodeState({
    this.movie,
    this.currentSeason,
    this.currentEpisode,
    this.maxSeason = 0,
    this.currentNumSeason = 0,
    this.isMovieFavorite = false,
    this.isTheLastEpisode = false,
    required this.status,
  });

  @override
  List<Object?> get props => [
        currentSeason,
        maxSeason,
        currentNumSeason,
        currentEpisode,
        isTheLastEpisode,
        status,
        isMovieFavorite,
        movie
      ];

  DetailEpisodeState copyWith({
    Season? currentSeason,
    int? maxSeason,
    int? currentNumSeason,
    Episode? currentEpisode,
    bool? isTheLastEpisode,
    bool? isMovieFavorite,
    DetailEpisodeStatus? status,
    Movie? movie,
  }) {
    return DetailEpisodeState(
      currentSeason: currentSeason ?? this.currentSeason,
      maxSeason: maxSeason ?? this.maxSeason,
      currentNumSeason: currentNumSeason ?? this.currentNumSeason,
      currentEpisode: currentEpisode ?? this.currentEpisode,
      isTheLastEpisode: isTheLastEpisode ?? this.isTheLastEpisode,
      isMovieFavorite: isMovieFavorite ?? this.isMovieFavorite,
      status: status ?? this.status,
      movie: movie ?? this.movie,
    );
  }
}
