import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/di/injection.dart';
import 'package:prueba_leal/presentation/login/login_page.dart';
import 'package:prueba_leal/presentation/movies/home/home_page.dart';
import 'package:prueba_leal/presentation/navigation/navigation.dart';
import 'package:prueba_leal/presentation/splash/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  final SplashCubit _splashCubit;
  const SplashPage(this._splashCubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _splashCubit.verifyActiveSession(context);

    return BlocListener<SplashCubit, SplashState>(
      bloc: _splashCubit,
      listener: (context, state) {
        if (state.status == SplashStatus.logged) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Welcome ${state.nameUser}"),
          ));

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Navigation()),
              (Route<dynamic> route) => false);
        }

        if (state.status == SplashStatus.noLogogged) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => sl<LoginPage>()),
              (Route<dynamic> route) => false);
        }
      },
      child: Scaffold(
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/geral.jpeg",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
