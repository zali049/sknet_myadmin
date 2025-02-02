import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();
  static const int _primaryColor = 0xFF0032A5;
  static const int _secondaryColor = 0xFF8271EE;

  static const MaterialColor colorPrimary = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xffe6ebf6),
      100: Color(0xffccd6ed),
      200: Color(0xffb3c2e4),
      300: Color(0xff99addb),
      400: Color(0xff8099d2),
      500: Color(0xff6684c9),
      600: Color(0xff4d70c0),
      700: Color(0xff335bb7),
      800: Color(0xff1a47ae),
      900: Color(0xff0032a5),
    },
  );

  static const MaterialColor secondaryColor = MaterialColor(
    _secondaryColor,
    <int, Color>{
      50: Color(0xFFF3F1FD),
      100: Color(0xFFE6E3FC),
      200: Color(0xFFDAD4FA),
      300: Color(0xFFCDC6F8),
      400: Color(0xFFC1B8F7),
      500: Color(0xFFB4AAF5),
      600: Color(0xFFA89CF3),
      700: Color(0xFF9B8DF1),
      800: Color(0xFF8F7FF0),
      900: Color(0xFF8271EE),
    },
  );
}

extension AlertColors on Colors {
  static const Color info = Color(0xFF0B7BEA);
  static const Color error = Color(0xFFF44649);
  static const Color warning = Color(0xFFFFAB00);
  static const Color success = Color(0xFF09C26F);
}

extension TypoColors on Color {
  static const Color textPrimary = Color(0xFF141414);
  static const Color textSecondary = Color(0xFF727272);
  static const Color textTertiary = Color(0xFFA1A1A1);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);
  static const Color textHighlight = Color(0xFF0032A5);
}