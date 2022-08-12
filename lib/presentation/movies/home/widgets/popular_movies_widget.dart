import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/widgets/movie_image_card.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({Key? key, required this.popularMovies})
      : super(key: key);

  final List<Movie> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Popular",
            style: TextStyle(color: LocalColor.blanco, fontSize: 22),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularMovies.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: CardMoviewImage(
                              pathImage:
                                  "w200${popularMovies[index].posterPath}"),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Flexible(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              popularMovies[index].name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        RatingBarIndicator(
                          rating: popularMovies[index].voteAverage,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: LocalColor.gris,
                          ),
                          itemCount: 5,
                          itemSize: 12.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
