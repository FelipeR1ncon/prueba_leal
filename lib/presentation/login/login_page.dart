import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/login/cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  final LoginCubit _loginCubit;

  const LoginPage(this._loginCubit, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
