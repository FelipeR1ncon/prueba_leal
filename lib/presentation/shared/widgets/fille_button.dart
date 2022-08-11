import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/style/text_style.dart';

///Boton principal de la app
class FilledButton extends StatelessWidget {
  const FilledButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isPrimary = true})
      : super(key: key);

  ///Texto a mostrar en el boton
  final String text;

  ///Funcion que se ejecuta cuando se presiona el boton
  final Function onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32))),
            backgroundColor: MaterialStateProperty.all(
                isPrimary ? LocalColor.amarillo : LocalColor.blanco)),
        onPressed: onPressed.call(),
        child: Center(
            child: Text(text,
                style: LocalTextStyle.buttonText,
                textAlign: TextAlign.center)));
  }
}
