import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/widgets/fille_button.dart';
import 'package:prueba_leal/presentation/shared/widgets/movie_image_card.dart';

class RecommendedMoviesWidget extends StatelessWidget {
  const RecommendedMoviesWidget({Key? key, required this.recommendedMovies})
      : super(key: key);

  final List<Movie> recommendedMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Recommendations",
            style: TextStyle(color: LocalColor.blanco, fontSize: 22),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: recommendedMovies.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.22,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: CardMoviewImage(
                                pathImage:
                                    "w200${recommendedMovies[index].posterPath}"),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.10,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 2,
                                  ),
                                  Text(
                                    recommendedMovies[index].name,
                                    style: const TextStyle(
                                        color: LocalColor.blanco, fontSize: 16),
                                    textAlign: TextAlign.start,
                                  ),
                                  RatingBarIndicator(
                                    rating:
                                        recommendedMovies[index].voteAverage,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: LocalColor.gris,
                                    ),
                                    itemCount: 5,
                                    itemSize: 12.0,
                                    direction: Axis.horizontal,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Flexible(
                                      child: Text(
                                        "IMDb: ${recommendedMovies[index].voteAverage}",
                                        style: const TextStyle(
                                            color: LocalColor.gris,
                                            fontSize: 8),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FilledButton(
                                          text: "Watch Now",
                                          height: 30,
                                          onPressed: () {}),
                                      const Icon(
                                        Icons.favorite_border,
                                        color: LocalColor.gris,
                                        size: 36,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
