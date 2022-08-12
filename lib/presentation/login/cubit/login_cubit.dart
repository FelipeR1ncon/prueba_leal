import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_leal/domain/model/entity/user.dart';
import 'package:prueba_leal/domain/model/port/in/login/login_use_case_port.dart';
import 'package:prueba_leal/domain/model/port/in/sesion/sesion_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCasePort _loginUseCasePort;
  final SessionUseCasePort _sessionUseCase;

  LoginCubit(this._loginUseCasePort, this._sessionUseCase)
      : super(const LoginState(loginStatus: LoginStatus.initial));

  void login(String nameUser, String password) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    User? user = await _loginUseCasePort.login(nameUser, password);

    if (user == null) {
      emit(state.copyWith(
          loginStatus: LoginStatus.enterData,
          msjError: "Email o contraseña inconrrecta."));
    } else {
      _sessionUseCase.setUser(user.name);
      emit(state.copyWith(loginStatus: LoginStatus.success));
    }
  }

  ///Metodo para mostrar los input para el ingreso de los datos
  void showInputs() {
    emit(state.copyWith(loginStatus: LoginStatus.enterData));
  }

  ///Metodo para mostrar la pantalla de las opciones.
  void hideInputs() {
    emit(state.copyWith(loginStatus: LoginStatus.initial));
  }
}
