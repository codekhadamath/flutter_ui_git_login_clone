import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_tutorial_2/constants/style.dart';
import 'package:ui_tutorial_2/pages/login_page.dart';
import 'package:ui_tutorial_2/pages/my_todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );
    return MaterialApp(
      title: 'GitHub Login Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primarySwatchColor,
          textTheme: newTextTheme,
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: AppColor.accent),
              hintStyle: TextStyle(color: AppColor.grey),
              alignLabelWithHint: false,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.accent)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.grey)))),
      home: const LoginPage(),
    );
  }
}
