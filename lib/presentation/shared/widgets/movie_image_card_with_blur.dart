import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';

///Componente encargado
class MovieImageCard extends StatefulWidget {
  final String pathImage;
  final double height;
  final double width;

  const MovieImageCard(
      {Key? key,
      required this.pathImage,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  _MovieImageCardState createState() => _MovieImageCardState();
}

class _MovieImageCardState extends State<MovieImageCard> {
  final String baseUrl = "https://image.tmdb.org/t/p/";

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(children: [
        Positioned.fill(
            child: Image.network(
          baseUrl + widget.pathImage,
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: LocalColor.gris.withOpacity(0.5)))),
        Positioned.fill(
          top: 4,
          bottom: 4,
          left: 4,
          right: 4,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child:
                  Image.network(baseUrl + widget.pathImage, fit: BoxFit.cover)),
        ),
      ]),
    );
  }
}
