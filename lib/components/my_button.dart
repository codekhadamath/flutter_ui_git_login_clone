import 'package:flutter/material.dart';
import 'package:ui_tutorial_2/constants/style.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const MyButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.white),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColor.secondary, AppColor.primary])),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
          elevation: 0.0,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ));
  }
}
