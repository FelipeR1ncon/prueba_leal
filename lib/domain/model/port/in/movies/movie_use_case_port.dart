import 'dart:async';

import '../../../entity/movie/episode.dart';
import '../../../entity/movie/movie.dart';
import '../../../entity/movie/movie_availability.dart';
import '../../../entity/movie/season.dart';

abstract class MovieUseCasePort {
  Stream<List<Movie>> get items;
  void addToStream(List<Movie> items);

  List<Movie> getFavorites();
  void addFavorite(Movie movie);
  void deleteFavorite(Movie movie);

  Future<MovieAvailability> getPopular(int page);
  Future<MovieAvailability> getRecommendations(int page);
  Future<Season> getSeason(int idMovie, int numSeason);
  Future<Movie> getDetails(Movie movie);
  clearData();
  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode);
  Future<MovieAvailability> getTvAiringToday(int page);
}
