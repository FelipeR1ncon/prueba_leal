// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStatus { loading, success, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;

  ///Movies
  final List<Movie>? popularMovies;
  final List<Movie>? recommendedMovies;

  const HomeState({
    required this.homeStatus,
    this.popularMovies,
    this.recommendedMovies,
  });

  @override
  List<Object?> get props => [homeStatus, popularMovies, recommendedMovies];

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<Movie>? popularMovies,
    List<Movie>? recommendedMovies,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      popularMovies: popularMovies ?? this.popularMovies,
      recommendedMovies: recommendedMovies ?? this.recommendedMovies,
    );
  }
}
