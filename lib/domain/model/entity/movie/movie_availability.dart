// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';

class MovieAvailability {
  final int page;
  final int totalPages;
  final List<Movie> movies;

  MovieAvailability({
    required this.page,
    required this.totalPages,
    required this.movies,
  });
}
