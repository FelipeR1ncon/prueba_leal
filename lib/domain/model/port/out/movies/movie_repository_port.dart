import '../../../entity/movie/episode.dart';
import '../../../entity/movie/movie.dart';
import '../../../entity/movie/season.dart';

abstract class MovieRepositoryPort {
  Future<List<Movie>> getPopular(int page);

  Future<List<Movie>> getRecommendations(int page);

  Future<Season> getSeason(int idMovie, int numSeason);

  Future<Episode> getEpisode(int idMovie, int numSeason, int numEpisode);

  Future<List<Movie>> getTvAiringToday(int page);

  Future<Movie> getDetail(Movie movie);
}
