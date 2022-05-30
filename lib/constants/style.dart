import 'package:flutter/material.dart';

class AppColor {
  static const primary = Color(0xFF0904FF);
  static const secondary = Color(0xFFFF00F5);
  static const secondaryLight = Color(0xFFFF8BFA);
  static const tertiary = Color(0xFFFCF200);
  static const accent = Color(0xFF03FDFC);
  static const grey = Color(0xFFCFCFCF);
}

Map<int, Color> color = {
  50: const Color.fromRGBO(9, 4, 255, .1),
  100: const Color.fromRGBO(9, 4, 255, .2),
  200: const Color.fromRGBO(9, 4, 255, .3),
  300: const Color.fromRGBO(9, 4, 255, .4),
  400: const Color.fromRGBO(9, 4, 255, .5),
  500: const Color.fromRGBO(9, 4, 255, .6),
  600: const Color.fromRGBO(9, 4, 255, .7),
  700: const Color.fromRGBO(9, 4, 255, .8),
  800: const Color.fromRGBO(9, 4, 255, .9),
  900: const Color.fromRGBO(9, 4, 255, 1),
};

MaterialColor primarySwatchColor = MaterialColor(0xFF54A258, color);
