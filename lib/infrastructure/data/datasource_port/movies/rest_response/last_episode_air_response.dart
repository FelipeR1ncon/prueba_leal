// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LastEpisodeToAirRespone {
  final int numberEpisode;
  final int seasonNumber;

  LastEpisodeToAirRespone(this.numberEpisode, this.seasonNumber);

  factory LastEpisodeToAirRespone.fromMap(Map<String, dynamic> map) {
    return LastEpisodeToAirRespone(
      map['episode_number'] as int,
      map['season_number'] as int,
    );
  }

  factory LastEpisodeToAirRespone.fromJson(String source) =>
      LastEpisodeToAirRespone.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
