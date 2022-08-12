import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prueba_leal/di/injection.dart';
import 'package:prueba_leal/domain/model/port/in/sesion/sesion_use_case.dart';
import 'package:prueba_leal/presentation/login/login_page.dart';
import 'package:prueba_leal/presentation/movies/home/home_page.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SessionUseCasePort _sessionUseCasePort;

  SplashCubit(this._sessionUseCasePort)
      : super(const SplashState(SplashStatus.initial));

  void verifyActiveSession(BuildContext context) async {
    String user = _sessionUseCasePort.getUser();
    await Future.delayed(const Duration(seconds: 1));
    if (user.isNotEmpty) {
      emit(state.copyWith(status: SplashStatus.logged, nameUser: user));
    } else {
      emit(state.copyWith(status: SplashStatus.noLogogged));
    }
  }
}
