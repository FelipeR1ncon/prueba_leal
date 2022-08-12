import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/presentation/movies/home/widgets/popular_movies_widget.dart';
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
                Expanded(
                  child: PopularMoviesWidget(
                    popularMovies: state.popularMovies!,
                  ),
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
