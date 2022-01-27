import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorLight {
  static const primary = Color(0xFFDFF1FF);
  static const primaryVariant = Color(0xFF87CBFF);
  static const secondary = Color(0xFFB7E0FF);
  static const onPrimary = Color(0xFF4D4D4D);
  static const black = Color(0xFF000000);
  static const blackSecond = Color(0xFF7D7D7D);
  static const grey = Color(0xFFC4C4C4);
  static const white = Color(0xFFFFFFFF);
}

ThemeData lightTheme() => ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: ColorLight.primary,
          primaryVariant: ColorLight.primaryVariant,
          onPrimary: ColorLight.onPrimary),
    );

const lightGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: <Color>[
    ColorLight.primaryVariant,
    ColorLight.secondary,
    ColorLight.primary,
  ],
);
