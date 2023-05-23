import 'package:flutter/material.dart';

class AppColors {
  static const lightGrey = 0xFFfbfbfb;
  static const grey = 0xFFd2d2d2;
  static const darkGrey = 0xFFb2b2b2;
  static const darkRed = 0xFFa31621;
  static const darkBlue = 0xFF031d44;
  static const MaterialColor accentMaterial =
      MaterialColor(darkRed, <int, Color>{
    50: Color(0xFFd18a90),
    100: Color(0xFFc77379),
    200: Color(0xFFbe5b63),
    300: Color(0xFFb5444d),
    400: Color(0xFFac2d37),
    500: Color(darkRed),
    600: Color(0xFF92131d),
    700: Color(0xFF82111a),
    800: Color(0xFF720f17),
    900: Color(0xFF610d13),
  });
  static const MaterialColor primaryMaterial =
      MaterialColor(darkBlue, <int, Color>{
    50: Color(0xFF818ea1),
    100: Color(0xFF67778e),
    200: Color(0xFF4e607c),
    300: Color(0xFF354a69),
    400: Color(0xFF1c3356),
    500: Color(darkBlue),
    600: Color(0xFF021a3d),
    700: Color(0xFF021736),
    800: Color(0xFF02142f),
    900: Color(0xFF011128),
  });
}
