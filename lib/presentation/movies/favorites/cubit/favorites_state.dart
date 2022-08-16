// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_cubit.dart';

enum FavoritesStatus { loading, success,empty }

class FavoritesState extends Equatable {
  final List<Movie>? favoriteMovie;
  final FavoritesStatus status;
  const FavoritesState({this.favoriteMovie, required this.status});

  @override
  List<Object?> get props => [favoriteMovie, status];

  FavoritesState copyWith({
    List<Movie>? favoriteMovie,
    FavoritesStatus? status,
  }) {
    return FavoritesState(
      favoriteMovie: favoriteMovie ?? this.favoriteMovie,
      status: status ?? this.status,
    );
  }
}
