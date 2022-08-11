import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_leal/domain/model/port/in/login/login_use_case_port.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCasePort _loginUseCasePort;

  LoginCubit(this._loginUseCasePort) : super(LoginInitial());
}
