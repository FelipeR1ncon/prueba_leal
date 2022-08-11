// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GuestStartResponse {
  final String name;
  final int order;

  GuestStartResponse({
    required this.name,
    required this.order,
  });

  factory GuestStartResponse.fromMap(Map<String, dynamic> map) {
    return GuestStartResponse(
      name: map['name'] as String,
      order: map['order'] as int,
    );
  }

  factory GuestStartResponse.fromJson(String source) =>
      GuestStartResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
