import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:ui_tutorial_2/constants/style.dart';

class MyTodos extends StatefulWidget {
  const MyTodos({Key? key}) : super(key: key);

  @override
  State<MyTodos> createState() => _MyTodosState();
}

class _MyTodosState extends State<MyTodos> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _curvedAnimation;
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _offsetFromTopAnimation;

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
      body: Container(
        padding: const EdgeInsets.all(25.0),
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.secondary, AppColor.primary])),
        child: Column(
          children: [
            const SizedBox(
              height: 25.0,
            ),
            const Align(
                alignment: Alignment.topLeft,
                child: BackButton(color: Colors.white)),
            SlideTransition(
              position: _offsetFromTopAnimation,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: const Text(
                  "My TODO's",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Entypo.calendar,
                        size: 14.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '12 Jan, 2022 - Thursday',
                      ),
                      SizedBox(width: 3.0),
                      Icon(
                        Entypo.down_open,
                        size: 16.0,
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
