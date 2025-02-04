import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/styles/text.styles.dart';
import 'package:flutter/material.dart';

class MovieMaterialTheme {
  static ThemeData dark = ThemeData(
    primaryColor: ColorStyles.principal500,
    primaryColorDark: ColorStyles.dark500,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorStyles.principal500),
    scaffoldBackgroundColor: ColorStyles.dark500,
    textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: TextStyles.titleSize,
          color: ColorStyles.secondary500,
        ),
        titleMedium: TextStyle(
          fontSize: TextStyles.subtitle1Size,
          color: ColorStyles.secondary500,
        ),
        titleSmall: TextStyle(
          fontSize: TextStyles.subtitle2Size,
          color: ColorStyles.secondary500,
        ),
        bodyMedium: TextStyle(
          fontSize: TextStyles.normalSize,
          color: ColorStyles.secondary500,
        ),
        bodySmall: TextStyle(
          fontSize: TextStyles.minimalSize,
          color: ColorStyles.secondary500,
        )),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(fontSize: TextStyles.minimalSize),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorStyles.dark500,
      iconTheme: IconThemeData(color: ColorStyles.secondary500),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      labelStyle: TextStyle(
          fontSize: TextStyles.subtitle2Size, fontWeight: FontWeight.w500),
      unselectedLabelColor: Colors.black26,
      unselectedLabelStyle: TextStyle(
          fontSize: TextStyles.subtitle2Size, fontWeight: FontWeight.w500),
      indicatorColor: Colors.white,
    ),
  );
}
