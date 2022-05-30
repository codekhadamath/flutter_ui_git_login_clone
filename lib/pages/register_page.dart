import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_tutorial_2/components/my_button.dart';
import 'package:ui_tutorial_2/components/my_textfield.dart';
import 'package:ui_tutorial_2/constants/style.dart';
import 'package:ui_tutorial_2/pages/login_page.dart';
import 'package:ui_tutorial_2/pages/my_todos_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _curvedAnimation;
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _offsetFromTopAnimation;
  late final Animation<Offset> _offsetFromBottomAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _opacityAnimation =
        Tween<double>(begin: 0.1, end: 1).animate(_curvedAnimation);
    _offsetFromTopAnimation =
        Tween<Offset>(begin: const Offset(0.0, -2.0), end: Offset.zero)
            .animate(_curvedAnimation);
    _offsetFromBottomAnimation =
        Tween<Offset>(begin: const Offset(0.0, 2.0), end: Offset.zero)
            .animate(_curvedAnimation);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.secondary, AppColor.primary])),
        child: Stack(
          children: [
            if (Navigator.canPop(context))
              const Positioned(
                top: 25.0,
                left: 0.0,
                child: BackButton(color: Colors.white),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 150.0,
                ),
                SlideTransition(
                  position: _offsetFromTopAnimation,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: const Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 75.0,
                ),
                MyTextField(
                  curvedAnimation: _curvedAnimation,
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MyTextField(
                  curvedAnimation: _curvedAnimation,
                  startOffset: const Offset(-2.5, 0.0),
                  labelText: 'Username or email',
                  hintText: 'Enter username or email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MyTextField(
                  curvedAnimation: _curvedAnimation,
                  startOffset: const Offset(-3.5, 0.0),
                  labelText: 'Password',
                  hintText: 'Enter password',
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
              ],
            ),
            Positioned(
              bottom: 20.0,
              left: 0.0,
              right: 0.0,
              child: SlideTransition(
                position: _offsetFromBottomAnimation,
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyButton(
                          text: 'Register',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyTodos()));
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(fontSize: 16.0)),
                            TextSpan(
                                text: "Login",
                                style: const TextStyle(
                                    color: AppColor.tertiary, fontSize: 16.0),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const LoginPage())));
                                  }))
                          ]))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
