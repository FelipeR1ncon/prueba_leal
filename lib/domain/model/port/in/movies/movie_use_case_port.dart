import '../../../entity/movie/episode.dart';
import '../../../entity/movie/movie.dart';
import '../../../entity/movie/season.dart';
import '../sesion/user.dart';

abstract class MovieUseCasePort {
  Future<List<Movie>> getPopular(int page);

  Future<List<Movie>> getRecommendations(int page);

  Future<Season> getSeason(int idMovie, int numSeason);

  Future<Movie> getDetails(Movie movie);

  clearData();

  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode);

  Future<List<Movie>> getTvAiringToday(int page);

  List<Movie> getFavorites(User user);



  void addFavorite(User user, Movie movie);
}
