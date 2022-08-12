import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';

class LocalTextStyle {
  static const double sizeNormalTitle = 24;
  static const double sizeEmphasis = 16;
  static const double sizeNormalBody = 14;
  static const double sizeSmallBody = 12;

  static const FontWeight fontWeightRegular = FontWeight.w300;
  static const FontWeight fontWeightBold = FontWeight.w600;

  static const String fontFamilyGilroy = 'Gilroy';

  static const TextStyle buttonText = TextStyle(
      fontFamily: fontFamilyGilroy,
      height: 1.5,
      fontSize: sizeEmphasis,
      fontWeight: FontWeight.w300,
      color: LocalColor.negro);
}
