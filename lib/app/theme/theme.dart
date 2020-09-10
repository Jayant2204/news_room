import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_room/app/theme/color.dart';

class AppTheme {
  const AppTheme();

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    backgroundColor: AppColor.background,
    primaryColor: AppColor.background,
    accentColor: AppColor.lightblack,
    primaryColorDark: AppColor.dark,
    primaryColorLight: AppColor.bright,
    cardTheme: CardTheme(color: AppColor.background),
    textTheme: TextTheme(bodyText2: TextStyle(color: AppColor.titleTextColor)),
    iconTheme: IconThemeData(color: AppColor.blue),
    bottomAppBarColor: AppColor.lightblack,
    appBarTheme: AppBarTheme(color: AppColor.background, elevation: 0),
    colorScheme: ColorScheme(
        primary: AppColor.background,
        primaryVariant: AppColor.background,
        secondary: AppColor.blue,
        secondaryVariant: AppColor.darkBlue,
        surface: AppColor.background,
        background: AppColor.background,
        error: Colors.red,
        onPrimary: AppColor.bright,
        onSecondary: AppColor.dark,
        onSurface: AppColor.white,
        onBackground: AppColor.titleTextColor,
        onError: AppColor.titleTextColor,
        brightness: Brightness.dark),
  );

  static TextStyle titleStyle =
      const TextStyle(color: AppColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: AppColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}
