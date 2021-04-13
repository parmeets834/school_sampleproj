import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/Screen/PreLogin/pre_login.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/student_providers/splash/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  static const classname = "/SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashProvider>(context, listen: false)
        .setInitalConfiguration(); // used to inital setup application using carefully
 //   getdata();

    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PreLogin())));
  }

  var list_arr = new List();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/a/a6/Georgia_School_logo_round.png'),
      ),
    );
  }
}
