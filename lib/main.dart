import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_leal/presentation/login/login_page.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await setupInjectionDependency();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          hintColor: LocalColor.gris,
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: LocalColor.gris,
            //<-- SEE HERE
          ),
          indicatorColor: LocalColor.gris),
      title: 'Flutter Demo',
      home: sl<LoginPage>(),
    );
  }
}
