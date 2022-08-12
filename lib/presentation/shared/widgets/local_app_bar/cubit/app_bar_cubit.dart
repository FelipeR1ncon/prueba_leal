import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prueba_leal/di/injection.dart';
import 'package:prueba_leal/domain/model/port/in/sesion/sesion_use_case.dart';
import 'package:prueba_leal/presentation/login/login_page.dart';

part 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  final SessionUseCasePort _sessionUseCasePort;

  AppBarCubit(this._sessionUseCasePort) : super(AppBarState.initial);

  void closeSesion(BuildContext context) {
    _sessionUseCasePort.logout();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => sl<LoginPage>()),
    );
  }
}
