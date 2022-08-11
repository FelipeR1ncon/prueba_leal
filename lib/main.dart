import 'package:flutter/material.dart';
import 'di/injection.dart';
import 'presentation/movies/home/home_page.dart';

void main() {
  setupInjectionDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: sl<HomePage>(),
    );
  }
}
