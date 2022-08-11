import '../../../entity/movie/episode.dart';
import '../../../entity/movie/movie.dart';
import '../../../entity/movie/movie_availability.dart';
import '../../../entity/movie/season.dart';
import '../../../entity/user.dart';

abstract class MovieUseCasePort {
  Future<MovieAvailability> getPopular(int page);

  Future<MovieAvailability> getRecommendations(int page);

  Future<Season> getSeason(int idMovie, int numSeason);

  Future<Movie> getDetails(Movie movie);

  clearData();

  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode);

  Future<MovieAvailability> getTvAiringToday(int page);

  List<Movie> getFavorites(User user);

  void addFavorite(User user, Movie movie);
}
