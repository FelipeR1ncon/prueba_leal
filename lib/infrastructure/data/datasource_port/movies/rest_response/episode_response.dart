// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:prueba_leal/infrastructure/data/datasource_port/movies/rest_response/guest_start.dart';

class EpisodeResponse {
  final int episodeNumber;
  final String name;
  final double voteAverage;
  final String overview;
  final List<GuestStartResponse> guestStart;
  final String airDate;
  final String stillPath;

  EpisodeResponse(
      {required this.episodeNumber,
      required this.name,
      required this.voteAverage,
      required this.overview,
      required this.guestStart,
      required this.airDate,
      required this.stillPath});

  factory EpisodeResponse.fromMap(Map<String, dynamic> map) {
    return EpisodeResponse(
      episodeNumber: map['episode_number'] as int,
      name: map['name'] as String,
      voteAverage: map['vote_average'] as double,
      overview: map['overview'] as String,
      guestStart: List<GuestStartResponse>.from(
        (map['guest_stars'] as Iterable).map<GuestStartResponse>(
          (x) => GuestStartResponse.fromMap(x as Map<String, dynamic>),
        ),
      ),
      airDate: map['air_date'] as String,
      stillPath: map['still_path'] as String,
    );
  }

  factory EpisodeResponse.fromJson(String source) =>
      EpisodeResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
