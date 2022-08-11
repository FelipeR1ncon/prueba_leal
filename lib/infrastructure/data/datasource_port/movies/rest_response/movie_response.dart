import 'dart:convert';

class MovieResponse {
  final String originalName;
  final int id;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;

  MovieResponse(this.originalName, this.id, this.backdropPath, this.posterPath,
      this.voteAverage);

  factory MovieResponse.fromMap(Map<String, dynamic> map) {
    return MovieResponse(
      map['original_title'] as String,
      map['id'] as int,
      map['backdrop_path'] as String,
      map['poster_path'] as String,
      map['vote_average'] as double,
    );
  }
  factory MovieResponse.fromJson(String source) =>
      MovieResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
