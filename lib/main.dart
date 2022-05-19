import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ui_tutorial_2/constants/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: primarySwatchColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
              subtitle1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          )),
          inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(10.0),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.darkGrey),
                  borderRadius: BorderRadius.circular(8.0)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.darkGrey),
                  borderRadius: BorderRadius.circular(8.0)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.darkGrey),
                  borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColor.secondary, width: 2.5),
                  borderRadius: BorderRadius.circular(8.0)))),
      home: const GitHubLogin(),
    );
  }
}

class GitHubLogin extends StatefulWidget {
  const GitHubLogin({Key? key}) : super(key: key);

  @override
  State<GitHubLogin> createState() => _GitHubLoginState();
}

class _GitHubLoginState extends State<GitHubLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _showError = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),

                    // GitHub Icon

                    const Icon(
                      FontAwesome.github_circled,
                      size: 60.0,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      'Sign in to GitHub',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26.0,
                          letterSpacing: -1.5),
                    ),

                    // Github error message

                    if (_showError)
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: AppColor.warningLight.withOpacity(.5),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                color: AppColor.warningLight, width: 2.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Incorrect username or password',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _showError = false;
                                });
                              },
                              child: const Icon(
                                Entypo.cancel,
                                color: AppColor.warning,
                              ),
                            )
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    // Github user detail for login

                    Container(
                      width: _size.width,
                      decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: AppColor.darkGrey)),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 22.0, 16.0, 16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Username or email address',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: _usernameController,
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Password',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: 'Forgot assword?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                color: AppColor.secondary,
                                              ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {})),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _showError =
                                        _usernameController.text.isEmpty ||
                                            _passwordController.text.isEmpty;
                                  });
                                },
                                child: const Text('Sign in',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0)),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    elevation: 0.0,
                                    shadowColor: Colors.transparent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    // Github actions

                    Container(
                      width: _size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: AppColor.darkGrey)),
                      padding: const EdgeInsets.all(22.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'New to GitHub? ',
                              style: Theme.of(context).textTheme.subtitle1),
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: 'Create an account',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: AppColor.secondary))
                        ]),
                      ),
                    )
                  ],
                ),
              ),

              // Other links
              
              Positioned(
                  bottom: 30.0,
                  left: 0.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Terms',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColor.secondary),
                      ),
                      Text(
                        'Privacy',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColor.secondary),
                      ),
                      Text(
                        'Security',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColor.secondary),
                      ),
                      Text(
                        'Contact GitHub',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
