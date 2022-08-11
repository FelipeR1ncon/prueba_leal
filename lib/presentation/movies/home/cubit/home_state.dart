// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStatus { loading, success, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;

  ///Movies
  final List<Movie>? popularMovies;
  final List<Movie>? recommendedMovies;

  ///CurrentPages
  final int currentPagePopular;
  final int currentPageRecommended;

  ///LimitPages
  final int limitPagePopular;
  final int limitPageRecomended;

  const HomeState({
    required this.homeStatus,
    this.currentPagePopular = 1,
    this.currentPageRecommended = 1,
    this.limitPagePopular = 1,
    this.limitPageRecomended = 1,
    this.popularMovies,
    this.recommendedMovies,
  });

  @override
  List<Object?> get props => [
        homeStatus,
        popularMovies,
        recommendedMovies,
        currentPagePopular,
        currentPageRecommended,
        limitPagePopular,
        limitPageRecomended
      ];

  HomeState copyWith(
      {HomeStatus? homeStatus,
      List<Movie>? popularMovies,
      List<Movie>? recommendedMovies,
      int? currentPagePopular,
      int? currentPageRecommended,
      int? limitPagePopular,
      int? limitPageRecomended}) {
    return HomeState(
        homeStatus: homeStatus ?? this.homeStatus,
        popularMovies: popularMovies ?? this.popularMovies,
        recommendedMovies: recommendedMovies ?? this.recommendedMovies,
        currentPagePopular: currentPagePopular ?? this.currentPagePopular,
        currentPageRecommended:
            currentPageRecommended ?? this.currentPageRecommended,
        limitPagePopular: limitPagePopular ?? this.limitPagePopular,
        limitPageRecomended: limitPageRecomended ?? this.limitPageRecomended);
  }
}
