import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/style/text_style.dart';
import 'package:prueba_leal/presentation/shared/widgets/image_blur.dart';
import 'package:prueba_leal/presentation/shared/widgets/movie_image_card.dart';

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
          Positioned.fill(
            top: 32,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.chevron_left,
                        color: LocalColor.blanco,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        "The witcher",
                        style:
                            TextStyle(color: LocalColor.blanco, fontSize: 16),
                      ),
                      Expanded(child: Container()),
                      const Icon(Icons.favorite_border,
                          color: LocalColor.blanco)
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        const Text(
                          "1 Episode",
                          style: TextStyle(
                              color: LocalColor.blanco,
                              fontSize: 16,
                              fontWeight: LocalTextStyle.fontWeightBold),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "Next",
                          style: TextStyle(
                            color: LocalColor.blanco,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: LocalColor.blanco,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: Image.network(
                          "https://p4.wallpaperbetter.com/wallpaper/553/564/19/cyberpunk-amoled-dark-vertical-hd-wallpaper-preview.jpg",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  const Text(
                    "The Witcher",
                    style: TextStyle(
                      color: LocalColor.blanco,
                      fontWeight: LocalTextStyle.fontWeightBold,
                      fontSize: LocalTextStyle.sizeNormalTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    "IMDb 3.6 | 2019 | Season 1",
                    style: TextStyle(
                      color: LocalColor.gris,
                      fontSize: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Divider(
                    color: LocalColor.gris,
                    height: 2,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "Loresms ksdodmi mmoekde moedoem momdeomoed emdoemodm sjc snvsifjis cac arfiajfimdima a afnanla  fdkfk  momdeomoed emdoemodm sjc snvsifjis cac arfiajfimdima.",
                    style: TextStyle(
                      color: LocalColor.blanco,
                      fontSize: LocalTextStyle.sizeNormalBody,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "Starring ksdodmi mmoekde moedoem momdeomoed emdoemodm sjc snvsifjis cac arfiajfimdima a afnanla  fdkfk",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: LocalColor.blanco,
                      fontSize: LocalTextStyle.sizeNormalBody,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
