import 'package:flutter/material.dart';
import 'package:prueba_leal/di/injection.dart';
import 'package:prueba_leal/presentation/movies/favorites/cubit/favorites_cubit.dart';
import 'package:prueba_leal/presentation/movies/favorites/favorites_page.dart';
import 'package:prueba_leal/presentation/movies/home/home_page.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int indexNavigation = 0;

  final List<Widget> _widgetOptions = <Widget>[
    sl<HomePage>(),
    sl<FavoritesPage>(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LocalColor.negro,
      body: _widgetOptions[indexNavigation],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              indexNavigation = index;
            });
          },
          elevation: 12,
          enableFeedback: true,
          backgroundColor: LocalColor.negro,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: LocalColor.amarillo,
          unselectedItemColor: LocalColor.blanco,
          currentIndex: indexNavigation,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: LocalColor.blanco),
                activeIcon:
                    Icon(Icons.home_outlined, color: LocalColor.amarillo),
                label: "Home"),
            BottomNavigationBarItem(
                label: "Favorites",
                icon: Icon(Icons.favorite_border, color: LocalColor.blanco),
                activeIcon:
                    Icon(Icons.favorite_border, color: LocalColor.amarillo)),
            BottomNavigationBarItem(
                label: "Recent",
                icon: Icon(Icons.reset_tv_rounded, color: LocalColor.blanco),
                activeIcon:
                    Icon(Icons.reset_tv_rounded, color: LocalColor.amarillo)),
            BottomNavigationBarItem(
                label: "Search",
                icon: Icon(Icons.search, color: LocalColor.blanco),
                activeIcon: Icon(Icons.search, color: LocalColor.amarillo)),
          ]),
    );
  }
}
