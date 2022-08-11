import 'package:flutter/material.dart';
import 'package:prueba_leal/presentation/shared/style/color.dart';

class LocalTextStyle {
  static const double _sizeNormalTitle = 24;
  static const double _sizeEmphasis = 16;
  static const double _sizeNormalBody = 14;
  static const double _sizeSmallBody = 12;

  static const FontWeight fontWeightRegular = FontWeight.w300;
  static const FontWeight fontWeightBold = FontWeight.w600;

  static const String fontFamilyGilroy = 'Gilroy';

  static const TextStyle buttonText = TextStyle(
      fontFamily: fontFamilyGilroy,
      height: 1.5,
      fontSize: _sizeEmphasis,
      fontWeight: FontWeight.w300,
      color: LocalColor.negro);
}
