import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_leal/di/injection.dart';
import 'package:prueba_leal/domain/model/entity/movie/movie.dart';
import 'package:prueba_leal/presentation/movies/episode/cubit/detail_episode_cubit.dart';
import 'package:prueba_leal/presentation/movies/episode/detail_episode_page.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/style/text_style.dart';
import 'package:prueba_leal/presentation/shared/widgets/fille_button.dart';
import 'package:prueba_leal/presentation/shared/widgets/image_blur.dart';
import 'package:prueba_leal/presentation/shared/widgets/movie_image_card.dart';

///Pantalla que muesta con mas detalle la imagen de la serie
///permite visualizar mejor los datos que salen en la lista.
class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage(
      {Key? key,
      required this.movies,
      required this.intialIndex,
      required this.tittle})
      : super(key: key);

  final List<Movie> movies;
  final int intialIndex;
  final String tittle;

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  int currentIndex = 0;

  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      carouselController.jumpToPage(widget.intialIndex);
      currentIndex = widget.intialIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LocalColor.negro,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                child: ImageBlurWidget(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500${widget.movies[currentIndex].posterPath}")),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.chevron_left,
                            color: LocalColor.blanco,
                            size: 32,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(widget.tittle,
                              style: const TextStyle(
                                  color: LocalColor.blanco,
                                  fontFamily: LocalTextStyle.fontFamilyGilroy,
                                  fontWeight: LocalTextStyle.fontWeightRegular,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider.builder(
                            carouselController: carouselController,
                            itemCount: widget.movies.length,
                            options: CarouselOptions(
                              onPageChanged: ((index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              }),
                              height: MediaQuery.of(context).size.height * 0.40,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.67,
                              initialPage: 0,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                            itemBuilder: (ctx, index, real) {
                              return CardMoviewImage(
                                  pathImage:
                                      "w400${widget.movies[index].posterPath}");
                            },
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: AutoSizeText(
                              widget.movies[currentIndex].name,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: const TextStyle(
                                  color: LocalColor.blanco,
                                  fontFamily: LocalTextStyle.fontFamilyGilroy,
                                  fontWeight: LocalTextStyle.fontWeightBold,
                                  fontSize: 24),
                            ),
                          ),
                          const SizedBox(height: 24),
                          RatingBarIndicator(
                            rating:
                                (widget.movies[currentIndex].voteAverage / 2) -
                                    0.45,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: LocalColor.gris,
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: AutoSizeText(
                              "IMDb: ${widget.movies[currentIndex].voteAverage}",
                              maxLines: 1,
                              style: const TextStyle(
                                  color: LocalColor.gris,
                                  fontSize: 12,
                                  fontFamily: LocalTextStyle.fontFamilyGilroy),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.43,
                              child: FilledButton(
                                  text: "Wacth now",
                                  onPressed: () {
                                    goToEpisodes(widget.movies[currentIndex]);
                                  }))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToEpisodes(Movie movi) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailEpisodePage(
            movie: widget.movies[currentIndex],
            detailSeasonCubit: sl<DetailEpisodeCubit>()),
      ),
    );
  }
}
