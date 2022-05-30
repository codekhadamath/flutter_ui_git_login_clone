import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final CurvedAnimation curvedAnimation;
  final Offset startOffset;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextInputType? keyboardType;
  const MyTextField(
      {Key? key,
      required this.curvedAnimation,
      this.startOffset = const Offset(-1.0, 0),
      required this.labelText,
      required this.hintText,
      this.obscureText = false,
      this.autocorrect = true,
      this.enableSuggestions = true,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _opacityAnimation =
        Tween<double>(begin: 0.1, end: 1).animate(curvedAnimation);
    final Animation<Offset> _offsetAnimation =
        Tween<Offset>(begin: startOffset, end: Offset.zero)
            .animate(curvedAnimation);
    return SlideTransition(
      position: _offsetAnimation,
      child: Opacity(
        opacity: _opacityAnimation.value,
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          obscureText: obscureText,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
