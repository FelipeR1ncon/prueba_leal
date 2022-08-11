import 'package:prueba_leal/infrastructure/data/datasource/movies/rest_response/movie_item_response.dart';

class MovieResponse {
  final int page;
  final int totalPage;
  final List<MovieItemResponse> movies;

  MovieResponse(this.page, this.totalPage, this.movies);
}
