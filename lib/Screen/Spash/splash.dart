import 'dart:async';

import 'package:flutter/material.dart';
import 'package:school_sampleproj/Screen/PreLogin/pre_login.dart';


class SplashScreen extends StatefulWidget {
  static const classname="/SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PreLogin())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/a/a6/Georgia_School_logo_round.png'),
      ),
    );
  }
}