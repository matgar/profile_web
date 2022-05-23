import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_web/core/app_colors.dart';

class Styles {
  const Styles._();

  static const _light = FontWeight.w300;
  static const _normal = FontWeight.w400;
  static const _medium = FontWeight.w500;

  static final _textTheme = TextTheme(
    headline1: GoogleFonts.workSans(fontWeight: _light, fontSize: 102, letterSpacing: -1.5),
    headline2: GoogleFonts.workSans(fontWeight: _light, fontSize: 64, letterSpacing: -0.5),
    headline3: GoogleFonts.workSans(fontWeight: _normal, fontSize: 51, letterSpacing: 0),
    headline4: GoogleFonts.workSans(fontWeight: _normal, fontSize: 36, letterSpacing: 0.25),
    headline5: GoogleFonts.workSans(fontWeight: _normal, fontSize: 25, letterSpacing: 0),
    headline6: GoogleFonts.workSans(fontWeight: _medium, fontSize: 21, letterSpacing: 0.15),
    subtitle1: GoogleFonts.workSans(fontWeight: _normal, fontSize: 17, letterSpacing: 0.15),
    subtitle2: GoogleFonts.workSans(fontWeight: _medium, fontSize: 15, letterSpacing: 0.1),
    bodyText1: GoogleFonts.workSans(fontWeight: _medium, fontSize: 17, letterSpacing: 0.5),
    bodyText2: GoogleFonts.workSans(fontWeight: _normal, fontSize: 15, letterSpacing: 0.25),
    button: GoogleFonts.workSans(fontWeight: _medium, fontSize: 15, letterSpacing: 1.25),
    caption: GoogleFonts.workSans(fontWeight: _normal, fontSize: 13, letterSpacing: 0.4),
    overline: GoogleFonts.workSans(fontWeight: _normal, fontSize: 11, letterSpacing: 1.5),

  );

  static ThemeData _themeData({required ColorScheme scheme}) => ThemeData(
        colorScheme: scheme,
        primaryColor: scheme.secondary,
        textTheme: _textTheme,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: scheme.primary,
        ),
        scaffoldBackgroundColor: scheme.background,
      );

  static final lightTheme = _themeData(
    scheme: AppColors.lightColorScheme,
  );

  static final darkTheme = _themeData(
    scheme: AppColors.darkColorScheme,
  );
}
