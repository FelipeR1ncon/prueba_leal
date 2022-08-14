import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/widgets/local_app_bar/cubit/app_bar_cubit.dart';

class LocalAppBar extends StatelessWidget {
  const LocalAppBar(this._appBarCubit, this.title, {Key? key})
      : super(key: key);

  final AppBarCubit _appBarCubit;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: SizedBox(
        height: 28,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 22,
            ),
            Text(
              title,
              style: const TextStyle(color: LocalColor.blanco, fontSize: 16),
            ),
            GestureDetector(
                onTap: () => _appBarCubit.closeSesion(context),
                child: const Icon(
                  Icons.settings,
                  color: LocalColor.gris,
                  size: 22,
                ))
          ],
        ),
      ),
    );
  }
}
