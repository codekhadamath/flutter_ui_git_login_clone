import 'package:flutter/material.dart';
import 'package:ui_tutorial_2/constants/style.dart';

class ThemeProvider {
  // =========================
  //      Light Theme Data
  // =========================
  static final lightThemeData = ThemeData(
      primarySwatch: primarySwatchColor,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: AppColor.lightGrey,
      textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.black),
          headline4: TextStyle(
              color: AppColorDark.darkBlack,
              letterSpacing: -1.5,
              fontSize: 30.0)),
      inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.darkGrey,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.darkGrey,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.darkGrey,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColor.secondary, width: 2.5),
              borderRadius: BorderRadius.circular(8.0))));

  static final lightTheme = lightThemeData.copyWith(
      colorScheme: lightThemeData.colorScheme
          .copyWith(secondary: AppColor.secondary, tertiary: AppColor.darkGrey));

  // =========================
  //      Dark Theme Data
  // =========================

  static final darkColorData = ThemeData(
      primarySwatch: primarySwatchColor,
      scaffoldBackgroundColor: AppColorDark.darkBlack,
      brightness: Brightness.dark,
      backgroundColor: AppColorDark.black,
      textTheme: const TextTheme(
          subtitle1: TextStyle(color: AppColorDark.whiteGrey),
          headline4: TextStyle(
              color: AppColorDark.whiteGrey,
              letterSpacing: -1.5,
              fontSize: 32.0)),
      inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: AppColorDark.darkBlack,
          contentPadding: const EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColorDark.lightBlack,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColorDark.lightBlack,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColorDark.lightBlack,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColorDark.secondary, width: 2.5),
              borderRadius: BorderRadius.circular(8.0))));

  static final darkTheme = darkColorData.copyWith(
      colorScheme: darkColorData.colorScheme
          .copyWith(secondary: AppColorDark.secondary, tertiary: AppColorDark.lightBlack));
}
