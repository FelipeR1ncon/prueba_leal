import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/movies/home/features/Home/presentation/movies/pages/home/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  final HomeCubit homeCubit;

  const HomePage(this.homeCubit, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
