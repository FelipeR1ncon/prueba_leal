// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

enum LoginStatus { initial, enterData, loading, success }

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String nombre;
  final String password;
  final String msjErrorlogin;

  const LoginState(
      {this.msjErrorlogin = "",
      required this.loginStatus,
      this.nombre = "",
      this.password = ""});

  @override
  List<Object?> get props => [loginStatus, nombre, password];

  LoginState copyWith(
      {LoginStatus? loginStatus,
      String? nombre,
      String? password,
      String? msjError}) {
    return LoginState(
        loginStatus: loginStatus ?? this.loginStatus,
        nombre: nombre ?? this.nombre,
        password: password ?? this.password,
        msjErrorlogin: msjError ?? "");
  }
}
