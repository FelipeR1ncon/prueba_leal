import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/domain/model/entity/movie/episode.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/presentation/movies/episode/cubit/detail_episode_cubit.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/style/text_style.dart';
import 'package:prueba_leal/presentation/shared/widgets/fille_button.dart';
import 'package:prueba_leal/presentation/shared/widgets/image_blur.dart';
import 'package:prueba_leal/presentation/shared/widgets/movie_image_card.dart';

class DetailEpisodePage extends StatefulWidget {
  final DetailEpisodeCubit detailSeasonCubit;
  final Movie movie;
  const DetailEpisodePage(
      {Key? key, required this.detailSeasonCubit, required this.movie})
      : super(key: key);

  @override
  State<DetailEpisodePage> createState() => _DetailEpisodePageState();
}

class _DetailEpisodePageState extends State<DetailEpisodePage> {
  bool loadInitialInfo = true;

  @override
  void didChangeDependencies() {
    if (loadInitialInfo) {
      widget.detailSeasonCubit.getFirstSeason(widget.movie);
      loadInitialInfo = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LocalColor.negro,
      body: BlocBuilder<DetailEpisodeCubit, DetailEpisodeState>(
          bloc: widget.detailSeasonCubit,
          builder: (context, state) {
            if (state.status == DetailEpisodeStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: LocalColor.amarillo,
                ),
              );
            } else if (state.status == DetailEpisodeStatus.success) {
              return EpisodeInfoWidget(
                episode: state.currentEpisode!,
                isMovieFavorite: state.isMovieFavorite,
                isLastEpisode: state.isTheLastEpisode,
                numberSeason: state.currentNumSeason,
                cubit: widget.detailSeasonCubit,
                movie: state.movie!,
              );
            } else {
              return Center(
                child: FilledButton(
                    text: "Error try again.",
                    isPrimary: true,
                    onPressed: () {
                      widget.detailSeasonCubit.getFirstSeason(widget.movie);
                    }),
              );
            }
          }),
    );
  }
}

class EpisodeInfoWidget extends StatelessWidget {
  const EpisodeInfoWidget({
    Key? key,
    required this.episode,
    required this.isMovieFavorite,
    required this.isLastEpisode,
    required this.numberSeason,
    required this.cubit,
    required this.movie,
  }) : super(key: key);

  final Episode episode;
  final bool isMovieFavorite;
  final bool isLastEpisode;
  final int numberSeason;
  final DetailEpisodeCubit cubit;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
              child: ImageBlurWidget(
                  imageUrl:
                      "https://image.tmdb.org/t/p/w400${episode.stillPath}")),
          Positioned.fill(
            top: 32,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.chevron_left,
                              color: LocalColor.blanco,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              movie.name,
                              style: const TextStyle(
                                  color: LocalColor.blanco, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          cubit.eventClickFavorite();
                        },
                        child: Icon(
                            movie.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: LocalColor.blanco),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "${episode.episodeNumber} Episode",
                          style: const TextStyle(
                              color: LocalColor.blanco,
                              fontSize: 16,
                              fontWeight: LocalTextStyle.fontWeightBold),
                        ),
                        Expanded(child: Container()),
                        Visibility(
                          visible: !isLastEpisode,
                          child: GestureDetector(
                            onTap: () => cubit.nextEspisode(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                    color: LocalColor.blanco,
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: LocalColor.blanco,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: CardMoviewImage(
                          pathImage: "w500${episode.stillPath}",
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Expanded(
                    child: Container(
                      color: LocalColor.negro.withOpacity(0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            movie.name,
                            style: const TextStyle(
                              color: LocalColor.blanco,
                              fontWeight: LocalTextStyle.fontWeightBold,
                              fontSize: LocalTextStyle.sizeNormalTitle,
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            "IMDb ${episode.voteAverage.toStringAsPrecision(2)} | ${episode.airDate.substring(0, 4)} |  $numberSeason Season",
                            style: const TextStyle(
                              color: LocalColor.gris,
                              fontSize: 9,
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
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  episode.overview,
                                  style: const TextStyle(
                                    color: LocalColor.blanco,
                                    fontSize: LocalTextStyle.sizeNormalBody,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  "Starring:${episode.getStarring()}",
                                  style: const TextStyle(
                                    color: LocalColor.blanco,
                                    fontSize: LocalTextStyle.sizeNormalBody,
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
