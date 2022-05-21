import 'package:flutter/material.dart';

class AppColor {
  static const primary = Color(0xFF54A258);
  static const secondary = Color(0xFF2E67D3);
  static const lightGrey = Color(0xFFF5F8FA);
  static const darkGrey = Color(0xFFD6DBE0);
  static const warning = Color(0xFFBE3537);
  static const warningLight = Color(0xFFF8CECC);
}

class AppColorDark {
  static const secondary = Color(0xFF6AA2F5);
  static const darkBlack = Color(0xFF0E1116);
  static const black = Color(0xFF171B21);
  static const lightBlack = Color(0xFF31363C);
  static const whiteGrey = Color(0xFFCAD1D8);
}

Map<int, Color> color = {
  50: const Color.fromRGBO(84, 162, 88, .1),
  100: const Color.fromRGBO(84, 162, 88, .2),
  200: const Color.fromRGBO(84, 162, 88, .3),
  300: const Color.fromRGBO(84, 162, 88, .4),
  400: const Color.fromRGBO(84, 162, 88, .5),
  500: const Color.fromRGBO(84, 162, 88, .6),
  600: const Color.fromRGBO(84, 162, 88, .7),
  700: const Color.fromRGBO(84, 162, 88, .8),
  800: const Color.fromRGBO(84, 162, 88, .9),
  900: const Color.fromRGBO(84, 162, 88, 1),
};

Map<int, Color> colorDark = {
  50: const Color.fromRGBO(106, 162, 245, .1),
  100: const Color.fromRGBO(106, 162, 245, .2),
  200: const Color.fromRGBO(106, 162, 245, .3),
  300: const Color.fromRGBO(106, 162, 245, .4),
  400: const Color.fromRGBO(106, 162, 245, .5),
  500: const Color.fromRGBO(106, 162, 245, .6),
  600: const Color.fromRGBO(106, 162, 245, .7),
  700: const Color.fromRGBO(106, 162, 245, .8),
  800: const Color.fromRGBO(106, 162, 245, .9),
  900: const Color.fromRGBO(106, 162, 245, 1),
};

MaterialColor primarySwatchColor = MaterialColor(0xFF54A258, color);
MaterialColor primarySwatchColorDark = MaterialColor(0xFF6AA2F5, color);