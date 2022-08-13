import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_leal/di/injection.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/presentation/movies/detail/detail_movie.dart';
import 'package:prueba_leal/presentation/movies/episode/cubit/detail_episode_cubit.dart';
import 'package:prueba_leal/presentation/movies/episode/detail_episode_page.dart';
import 'package:prueba_leal/presentation/movies/home/cubit/home_cubit.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/style/text_style.dart';
import 'package:prueba_leal/presentation/shared/widgets/fille_button.dart';
import 'package:prueba_leal/presentation/shared/widgets/movie_image_card.dart';

class RecommendedMoviesWidget extends StatelessWidget {
  const RecommendedMoviesWidget(
      {Key? key, required this.recommendedMovies, required this.homeCubit})
      : super(key: key);

  final List<Movie> recommendedMovies;
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        key: UniqueKey(),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 6, maxHeight: 26),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ),
          const AutoSizeText(
            "Recommendations",
            style: TextStyle(
                color: LocalColor.blanco,
                fontSize: 22,
                fontWeight: LocalTextStyle.fontWeightBold),
            textAlign: TextAlign.start,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 6, maxHeight: 26),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: recommendedMovies.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    key: UniqueKey(),
                    padding: const EdgeInsets.only(bottom: 24),
                    child: SizedBox(
                      key: UniqueKey(),
                      height: MediaQuery.of(context).size.height * 0.16,
                      child: Row(
                        key: UniqueKey(),
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.16,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailMoviePage(
                                            movies: recommendedMovies,
                                            intialIndex: index,
                                            tittle: "Recommended",
                                          )),
                                );
                              },
                              child: CardMoviewImage(
                                  pathImage:
                                      "w300${recommendedMovies[index].posterPath}"),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                key: UniqueKey(),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 2,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: AutoSizeText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        recommendedMovies[index].name,
                                        style: const TextStyle(
                                            color: LocalColor.blanco,
                                            fontSize: 16),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: RatingBarIndicator(
                                      rating: (recommendedMovies[index]
                                                  .voteAverage /
                                              2) -
                                          0.45,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: LocalColor.gris,
                                      ),
                                      itemCount: 5,
                                      itemSize: 12.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      "IMDb: ${recommendedMovies[index].voteAverage}",
                                      style: const TextStyle(
                                          color: LocalColor.gris, fontSize: 8),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Row(
                                    key: UniqueKey(),
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: SizedBox(
                                          width: 120,
                                          child: FilledButton(
                                              text: "Watch Now",
                                              height: 30,
                                              onPressed: () {
                                                goToEpisodes(
                                                    recommendedMovies[index],
                                                    context);
                                              }),
                                        ),
                                      ),
                                      Container(
                                        key: UniqueKey(),
                                        child: recommendedMovies[index]
                                                .isFavorite
                                            ? Icon(
                                                key: UniqueKey(),
                                                Icons.favorite,
                                                color: LocalColor.gris,
                                                size: 38,
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  homeCubit.addFavorite(
                                                      recommendedMovies[index]);
                                                },
                                                child: Icon(
                                                  key: UniqueKey(),
                                                  Icons.favorite_border,
                                                  color: LocalColor.gris,
                                                  size: 36,
                                                ),
                                              ),
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

  void goToEpisodes(Movie recommendedMovi, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailEpisodePage(
            movie: recommendedMovi,
            detailSeasonCubit: sl<DetailEpisodeCubit>()),
      ),
    );
  }
}
