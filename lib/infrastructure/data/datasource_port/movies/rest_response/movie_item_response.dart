import 'dart:convert';

class MovieItemResponse {
  final String name;
  final int id;
  final String? backdropPath;
  final String? posterPath;
  final double voteAverage;

  MovieItemResponse(
      this.name, this.id, this.backdropPath, this.posterPath, this.voteAverage);

  factory MovieItemResponse.fromMap(Map<String, dynamic> map) {
    return MovieItemResponse(
      map['name'] as String,
      map['id'] as int,
      map['backdrop_path'] as String?,
      map['poster_path'] as String?,
      double.parse(map['vote_average'].toString()),
    );
  }
  factory MovieItemResponse.fromJson(String source) =>
      MovieItemResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
