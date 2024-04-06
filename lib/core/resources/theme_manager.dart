import 'package:flutter/material.dart';

import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';

class Themes {
  Themes();
  ThemeData get lightTheme => ThemeData(
    colorScheme: const ColorScheme.light(
      primary: ColorManager.primaryColor,
    ),
    scaffoldBackgroundColor: ColorManager.white,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s40,
          fontWeight: FontWeightManager.regular),
      headlineMedium: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s33,
          fontWeight: FontWeightManager.regular),
      headlineSmall: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s30,
          fontWeight: FontWeightManager.regular),
      titleLarge: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s25,
          fontWeight: FontWeightManager.regular),
      titleMedium: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s22,
          fontWeight: FontWeightManager.regular),
      titleSmall: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s20,
          fontWeight: FontWeightManager.regular),
      displayLarge: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.regular),
      displayMedium: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.regular),
      displaySmall: TextStyle(
          color: ColorManager.dark,
          fontSize: FontSize.s12,
          fontWeight: FontWeightManager.regular),
    ),
  );

  ThemeData get darkTheme => ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.primaryColor,
    ),
    scaffoldBackgroundColor: ColorManager.dark,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s40,
          fontWeight: FontWeightManager.regular),
      headlineMedium: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s33,
          fontWeight: FontWeightManager.regular),
      headlineSmall: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s30,
          fontWeight: FontWeightManager.regular),
      titleLarge: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s25,
          fontWeight: FontWeightManager.regular),
      titleMedium: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s22,
          fontWeight: FontWeightManager.regular),
      titleSmall: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s20,
          fontWeight: FontWeightManager.regular),
      displayLarge: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.regular),
      displayMedium: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.regular),
      displaySmall: TextStyle(
          color: ColorManager.white,
          fontSize: FontSize.s12,
          fontWeight: FontWeightManager.regular),
    ),
  );
}
