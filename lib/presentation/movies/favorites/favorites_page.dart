import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_leal/di/injection.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/presentation/movies/detail/detail_movie.dart';
import 'package:prueba_leal/presentation/movies/episode/cubit/detail_episode_cubit.dart';
import 'package:prueba_leal/presentation/movies/episode/detail_episode_page.dart';
import 'package:prueba_leal/presentation/movies/favorites/cubit/favorites_cubit.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/style/text_style.dart';
import 'package:prueba_leal/presentation/shared/widgets/fille_button.dart';
import 'package:prueba_leal/presentation/shared/widgets/local_app_bar/app_bar.dart';
import 'package:prueba_leal/presentation/shared/widgets/local_app_bar/cubit/app_bar_cubit.dart';
import 'package:prueba_leal/presentation/shared/widgets/movie_image_card.dart';

class FavoritesPage extends StatelessWidget {
  final AppBarCubit _appBarCubit;
  final FavoritesCubit _favoritesCubit;

  const FavoritesPage(
    this._appBarCubit,
    this._favoritesCubit, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      bloc: _favoritesCubit,
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              LocalAppBar(_appBarCubit, "Favorites"),
              if (state.status == FavoritesStatus.success) ...[
                Expanded(
                    child: ListView.builder(
                        itemCount: state.favoriteMovie!.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  key: UniqueKey(),
                                  padding: const EdgeInsets.only(bottom: 24),
                                  child: SizedBox(
                                    key: UniqueKey(),
                                    height: MediaQuery.of(context).size.height *
                                        0.28,
                                    child: Row(
                                      key: UniqueKey(),
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.28,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailMoviePage(
                                                          movies: state
                                                              .favoriteMovie!,
                                                          intialIndex: index,
                                                          tittle: "Recommended",
                                                        )),
                                              );
                                            },
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned.fill(
                                                  child: CardMoviewImage(
                                                      pathImage:
                                                          "w300${state.favoriteMovie![index].posterPath}"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.08,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16, top: 24, bottom: 24),
                                            child: Column(
                                              key: UniqueKey(),
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  height: 2,
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 24),
                                                    child: AutoSizeText(
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      state
                                                          .favoriteMovie![index]
                                                          .name,
                                                      style: const TextStyle(
                                                          color:
                                                              LocalColor.blanco,
                                                          fontSize: 16),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: RatingBarIndicator(
                                                    rating: (state
                                                                .favoriteMovie![
                                                                    index]
                                                                .voteAverage /
                                                            2) -
                                                        0.45,
                                                    itemBuilder:
                                                        (context, index) =>
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: Text(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    "IMDb: ${state.favoriteMovie![index].voteAverage}",
                                                    style: const TextStyle(
                                                        color: LocalColor.gris,
                                                        fontSize: 8),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                Row(
                                                  key: UniqueKey(),
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: SizedBox(
                                                        width: 120,
                                                        child: FilledButton(
                                                            text: "Watch Now",
                                                            height: 30,
                                                            onPressed: () {
                                                              goToEpisodes(
                                                                  state.favoriteMovie![
                                                                      index],
                                                                  context);
                                                            }),
                                                      ),
                                                    ),
                                                    Container(
                                                      key: UniqueKey(),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          _favoritesCubit
                                                              .deleteFavorite(
                                                                  state.favoriteMovie![
                                                                      index]);
                                                        },
                                                        child: Icon(
                                                          key: UniqueKey(),
                                                          Icons.favorite,
                                                          color:
                                                              LocalColor.gris,
                                                          size: 36,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: LocalColor.gris,
                                  height: 1,
                                )
                              ],
                            ),
                          );
                        }))
              ],
              if (state.status == FavoritesStatus.loading) ...[
                const Center(
                  child: CircularProgressIndicator(),
                )
              ],
              if (state.status == FavoritesStatus.empty) ...[
                const Center(
                  child: Text(
                    "Favorites list is empty",
                    style: TextStyle(color: LocalColor.blanco),
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }

  void goToEpisodes(Movie movie, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailEpisodePage(
            movie: movie, detailSeasonCubit: sl<DetailEpisodeCubit>()),
      ),
    );
  }
}
