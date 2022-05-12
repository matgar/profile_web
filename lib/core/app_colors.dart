import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const primaryColor = Color(0xffc8e6c9);
  static const primaryLightColor = Color(0xfffbfffc);
  static const primaryDarkColor = Color(0xff97b498);
  static const secondaryColor = Color(0xff212121);
  static const secondaryLightColor = Color(0xff484848);
  static const secondaryDarkColor = Color(0xff000000);
  static const onPrimaryColor = Color(0xff000000);
  static const onSecondaryColor = Color(0xffffffff);
  static const errorColor = Color(0xffb3261e);
  static const onErrorColor = Color(0xffFFFFFF);
  static const backgroundColor = Color(0xfffbfdf8);
  static const onBackgroundColor = Color(0xff191c1a);
  static const surfaceColor = Color(0xfffbfdf8);
  static const onSurfaceColor = Color(0xff191c1a);

  static const darkThemePrimaryColor = Color(0xff424242);
  static const darkThemePrimaryLightColor = Color(0xff6d6d6d);
  static const darkThemePrimaryDarkColor = Color(0xff1b1b1b);
  static const darkThemeSecondaryColor = Color(0xff69f0ae);
  static const darkThemeSecondaryLightColor = Color(0xff9fffe0);
  static const darkThemeSecondaryDarkColor = Color(0xff2bbd7e);
  static const darkThemeOnPrimaryColor = Color(0xffffffff);
  static const darkThemeOnSecondaryColor = Color(0xff000000);
  static const darkThemeErrorColor = Color(0xfff2b8b5);
  static const darkThemeOnErrorColor = Color(0xff601410);
  static const darkThemeBackgroundColor = Color(0xff191c1a);
  static const darkThemeOnBackgroundColor = Color(0xffe1e3de);
  static const darkThemeSurfaceColor = Color(0xff191c1a);
  static const darkThemeOnSurfaceColor = Color(0xffe1e3de);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: secondaryColor,
    onSecondary: onSecondaryColor,
    error: errorColor,
    onError: onErrorColor,
    background: backgroundColor,
    onBackground: onBackgroundColor,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: darkThemePrimaryColor,
    onPrimary: darkThemeOnPrimaryColor,
    secondary: darkThemeSecondaryColor,
    onSecondary: darkThemeOnSecondaryColor,
    error: darkThemeErrorColor,
    onError: darkThemeOnErrorColor,
    background: darkThemeBackgroundColor,
    onBackground: darkThemeOnBackgroundColor,
    surface: darkThemeSurfaceColor,
    onSurface: darkThemeOnSurfaceColor,
  );
}
