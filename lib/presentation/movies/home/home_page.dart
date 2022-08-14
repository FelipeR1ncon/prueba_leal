import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/presentation/movies/home/widgets/popular_movies_widget.dart';
import 'package:prueba_leal/presentation/movies/home/widgets/recommended_movies_widget.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/widgets/fille_button.dart';
import 'package:prueba_leal/presentation/shared/widgets/local_app_bar/app_bar.dart';
import 'package:prueba_leal/presentation/shared/widgets/local_app_bar/cubit/app_bar_cubit.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  final HomeCubit homeCubit;
  final AppBarCubit appBarCubit;

  const HomePage(this.homeCubit, {Key? key, required this.appBarCubit})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      builder: (context, state) {
        if (state.homeStatus == HomeStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: LocalColor.amarillo,
            ),
          );
        } else if (state.homeStatus == HomeStatus.success) {
          return SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              LocalAppBar(widget.appBarCubit, "Home"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: PopularMoviesWidget(
                  popularMovies: state.popularMovies!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "See All",
                      style:
                          TextStyle(color: LocalColor.amarillo, fontSize: 16),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: LocalColor.amarillo,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Divider(
                  color: LocalColor.gris,
                ),
              ),
              Flexible(
                child: RecommendedMoviesWidget(
                  recommendedMovies: state.recommendedMovies!,
                  homeCubit: widget.homeCubit,
                ),
              )
            ]),
          );
        } else {
          return FilledButton(
              text: "Error try again",
              onPressed: () {
                widget.homeCubit.getInitialMovies();
              });
        }
      },
    );
  }
}
