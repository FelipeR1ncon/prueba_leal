import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/presentation/movies/home/widgets/popular_movies_widget.dart';
import 'package:prueba_leal/presentation/movies/home/widgets/recommended_movies_widget.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
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
    return Scaffold(
      backgroundColor: LocalColor.negro,
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        builder: (context, state) {
          if (state.homeStatus == HomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.homeStatus == HomeStatus.success) {
            return SafeArea(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                LocalAppBar(widget.appBarCubit),
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.42,
                    child: PopularMoviesWidget(
                      popularMovies: state.popularMovies!,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
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
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: LocalColor.gris,
                  ),
                ),
                Expanded(
                  child: RecommendedMoviesWidget(
                      recommendedMovies: state.recommendedMovies!),
                )
              ]),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
