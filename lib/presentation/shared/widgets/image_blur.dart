import 'dart:ui';

import 'package:flutter/material.dart';

class ImageBlurWidget extends StatelessWidget {
  const ImageBlurWidget({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(imageUrl),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ],
    );
  }
}
