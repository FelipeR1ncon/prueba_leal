import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/presentation/login/cubit/login_cubit.dart';
import 'package:prueba_leal/presentation/movies/home/home_page.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/widgets/fille_button.dart';

import '../../di/injection.dart';

class LoginPage extends StatefulWidget {
  final LoginCubit _loginCubit;

  const LoginPage(this._loginCubit, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: widget._loginCubit,
        listener: (context, state) {
          if (state.msjErrorlogin.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.msjErrorlogin),
            ));
          }

          if (state.loginStatus == LoginStatus.success) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sl<HomePage>()),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    "assets/images/geral.jpeg",
                    fit: BoxFit.cover,
                  )),
              Visibility(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.12),
                      child: const Text(
                        "Welcome!",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    )),
              ),
              Visibility(
                visible: state.loginStatus == LoginStatus.initial,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FilledButton(text: "Sign up", onPressed: () {}),
                        const SizedBox(
                          height: 22,
                        ),
                        FilledButton(
                            text: "Log in",
                            onPressed: () {
                              widget._loginCubit.showInputs();
                            },
                            isPrimary: false),
                        const SizedBox(
                          height: 26,
                        ),
                        const Text(
                          "Forgot password?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: state.loginStatus == LoginStatus.enterData ||
                      state.loginStatus == LoginStatus.loading,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.46,
                      decoration: BoxDecoration(
                          color: const Color(0xFF191919).withOpacity(0.95),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          )),
                      padding: const EdgeInsets.all(19),
                      child: Column(
                        children: [
                          Wrap(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        widget._loginCubit.hideInputs(),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  )
                                ],
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: _controllerName,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: _controllerPassword,
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: Center(
                              child: SizedBox(
                                width: 120,
                                child: state.loginStatus == LoginStatus.loading
                                    ? const CircularProgressIndicator(
                                        color: LocalColor.amarillo,
                                      )
                                    : FilledButton(
                                        isPrimary: false,
                                        text: "Log in",
                                        onPressed: () {
                                          widget._loginCubit.login(
                                              _controllerName.text,
                                              _controllerPassword.text);
                                        }),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
