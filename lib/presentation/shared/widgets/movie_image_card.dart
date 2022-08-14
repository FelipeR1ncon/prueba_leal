import 'package:flutter/material.dart';

class CardMoviewImage extends StatelessWidget {
  const CardMoviewImage({Key? key, required this.pathImage}) : super(key: key);
  final String baseUrl = "https://image.tmdb.org/t/p/";
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(baseUrl + pathImage, fit: BoxFit.cover));
  }
}
