import '../../../entity/movie/episode.dart';
import '../../../entity/movie/movie.dart';
import '../../../entity/movie/movie_availability.dart';
import '../../../entity/movie/season.dart';

abstract class MovieRepositoryPort {
  Future<MovieAvailability> getPopular(int page);

  Future<MovieAvailability> getRecommendations(int page);

  Future<Season> getSeason(int idMovie, int numSeason);

  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode);

  Future<MovieAvailability> getTvAiringToday(int page);

  Future<Movie> getDetail(Movie movie);
}
