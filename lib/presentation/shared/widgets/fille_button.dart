import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';
import 'package:prueba_leal/presentation/shared/style/text_style.dart';

///Boton principal de la app
class FilledButton extends StatelessWidget {
  const FilledButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isPrimary = true,
      this.height = 42,
      this.textStyle = LocalTextStyle.buttonText})
      : super(key: key);

  ///Texto a mostrar en el boton
  final String text;

  ///Funcion que se ejecuta cuando se presiona el boton
  final Function onPressed;

  ///Si es true toma el estilo del boton primario con el fondo amarillo, en el caso
  ///contrario el fonto sera blanco
  final bool isPrimary;
  final double height;

  ///Estilo del trexto que se muestra en el botton
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 4)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32))),
            backgroundColor: MaterialStateProperty.all(
                isPrimary ? LocalColor.amarillo : LocalColor.blanco)),
        onPressed: () => onPressed.call(),
        child: SizedBox(
          height: height,
          child: Center(
              child: Text(text, style: textStyle, textAlign: TextAlign.center)),
        ));
  }
}
