import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/presentation/movies/detail/detail_movie.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/style/text_style.dart';
import 'package:prueba_leal/presentation/shared/widgets/movie_image_card.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({Key? key, required this.popularMovies})
      : super(key: key);

  final List<Movie> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Popular",
            style: TextStyle(
                color: LocalColor.blanco,
                fontSize: 22,
                fontWeight: LocalTextStyle.fontWeightBold),
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
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailMoviePage(
                                          movies: popularMovies,
                                          intialIndex: index,
                                          tittle: "Popular",
                                        )),
                              );
                            },
                            child: CardMoviewImage(
                                pathImage:
                                    "w200${popularMovies[index].posterPath}"),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Expanded(
                            child: Text(
                              popularMovies[index].name,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Flexible(
                          child: RatingBarIndicator(
                            rating:
                                (popularMovies[index].voteAverage / 2) - 0.45,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: LocalColor.gris,
                            ),
                            itemCount: 5,
                            itemSize: 12.0,
                            direction: Axis.horizontal,
                          ),
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
