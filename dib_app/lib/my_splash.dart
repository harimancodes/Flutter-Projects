import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dib_app/widget/reg_log.dart';
import 'package:flutter/material.dart';

class MySplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  final colorizeColors = [
    Colors.white,
    Colors.white10,
    Colors.white30,
    Colors.white60,
    Colors.white54,
    Colors.black12,
    Colors.black,

    // Colors.blue,
    // Colors.yellow,
    // Colors.red,
  ];
  final textStyle = TextStyle(
    fontSize: 100.0,
    fontFamily: 'Horizon',
    color: Colors.white,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationLogin(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorizeAnimatedTextKit(
                    text: ['DIB'],
                    textStyle: textStyle,
                    colors: colorizeColors,
                    isRepeatingAnimation: false,
                    speed: Duration(seconds: 1),
                  ),
                  FadeAnimatedTextKit(
                    text: ['The best place to buy and sell stuffs.'],
                    textStyle: TextStyle(color: Colors.white),
                  duration: Duration(seconds:3),),
                ],
              ),
            ),
          )),
    );
  }
}
