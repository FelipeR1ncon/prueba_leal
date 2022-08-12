import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_leal/di/injection.dart';
import 'package:prueba_leal/presentation/login/login_page.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/widgets/local_app_bar/cubit/app_bar_cubit.dart';

class LocalAppBar extends StatelessWidget {
  const LocalAppBar(this._appBarCubit, {Key? key}) : super(key: key);

  final AppBarCubit _appBarCubit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBarCubit, AppBarState>(
      bloc: _appBarCubit,
      listener: (context, state) {
        if (state == AppBarState.closeSession) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => sl<LoginPage>()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: SizedBox(
          height: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 22,
              ),
              const Text(
                "Home",
                style: TextStyle(color: LocalColor.gris, fontSize: 18),
              ),
              GestureDetector(
                  onTap: () => _appBarCubit.closeSesion(),
                  child: const Icon(
                    Icons.settings,
                    color: LocalColor.gris,
                    size: 22,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
