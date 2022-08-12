import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/widgets/fille_button.dart';

import '../../shared/widgets/movie_image_card_with_blur.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  final HomeCubit homeCubit;

  const HomePage(this.homeCubit, {Key? key}) : super(key: key);

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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(text: "Sign up", onPressed: () {}, isPrimary: true),
              const SizedBox(
                height: 8,
              ),
              FilledButton(text: "Log in", onPressed: () {}, isPrimary: false),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                width: 130,
                height: 200,
                child: MovieImageCard(
                  width: 100,
                  height: 200,
                  pathImage: "w200/8lIzd4bSU1xoWwcFihI3BzeWsz3.jpg",
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
