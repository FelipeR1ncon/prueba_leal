// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../datasource_port/movies/rest_response/last_episode_air_response.dart';

class MovieDetailResponse {
  final int id;
  final int totalEpisodes;
  final int totalSeasons;
  final LastEpisodeToAirRespone lastEpisodeToAirRespone;
  MovieDetailResponse({
    required this.id,
    required this.totalEpisodes,
    required this.totalSeasons,
    required this.lastEpisodeToAirRespone,
  });

  factory MovieDetailResponse.fromMap(Map<String, dynamic> map) {
    return MovieDetailResponse(
      totalEpisodes: map['number_of_episodes'] as int,
      totalSeasons: map['number_of_seasons'] as int,
      lastEpisodeToAirRespone: LastEpisodeToAirRespone.fromMap(
          map['last_episode_to_air'] as Map<String, dynamic>),
      id: map['id'],
    );
  }

  factory MovieDetailResponse.fromJson(String source) =>
      MovieDetailResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
