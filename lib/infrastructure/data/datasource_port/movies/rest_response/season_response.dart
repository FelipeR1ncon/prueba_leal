// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'episode_response.dart';

class SeasonResponse {
  final int seasonNumber;
  final String overview;
  final List<EpisodeResponse> episodesResponse;

  SeasonResponse({
    required this.seasonNumber,
    required this.overview,
    required this.episodesResponse,
  });

  factory SeasonResponse.fromMap(Map<String, dynamic> map) {
    return SeasonResponse(
      seasonNumber: map['season_number'] as int,
      overview: map['overview'] as String,
      episodesResponse: List<EpisodeResponse>.from((map['episodes'] as Iterable).map<EpisodeResponse>(
          (data) => EpisodeResponse.fromMap(data),
        ),
      ),
    );
  }

  factory SeasonResponse.fromJson(String source) =>
      SeasonResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
