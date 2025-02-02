import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/styles/text.styles.dart';
import 'package:flutter/material.dart';

class MovieMaterialTheme {
  static ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    primaryColor: ColorStyles.darkColor,
    primaryColorDark: ColorStyles.darkColor,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorStyles.darkColor),
    // fontFamily: GoogleFonts.roboto().fontFamily,
    cardTheme: CardTheme(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: TextStyles.titleSize),
        bodyLarge: TextStyle(fontSize: TextStyles.titleSize),
        labelLarge: TextStyle(fontSize: TextStyles.subtitle2Size),
        labelMedium: TextStyle(fontSize: TextStyles.normalSize),
        labelSmall: TextStyle(fontSize: TextStyles.minimalSize)),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(fontSize: TextStyles.minimalSize),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
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
