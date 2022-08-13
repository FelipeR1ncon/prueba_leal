import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/widgets/image_blur.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LocalColor.negro,
      body: Stack(
        children: [
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.35,
              child: const ImageBlurWidget(
                  imageUrl:
                      "https://p4.wallpaperbetter.com/wallpaper/553/564/19/cyberpunk-amoled-dark-vertical-hd-wallpaper-preview.jpg")),
        ],
      ),
    );
  }
}
