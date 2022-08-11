import 'dart:convert';

class MovieResponse {
  final String name;
  final int id;
  final String? backdropPath;
  final String? posterPath;
  final double voteAverage;

  MovieResponse(
      this.name, this.id, this.backdropPath, this.posterPath, this.voteAverage);

  factory MovieResponse.fromMap(Map<String, dynamic> map) {
    return MovieResponse(
      map['name'] as String,
      map['id'] as int,
      map['backdrop_path'] as String?,
      map['poster_path'] as String?,
      double.parse(map['vote_average'].toString()),
    );
  }
  factory MovieResponse.fromJson(String source) =>
      MovieResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
