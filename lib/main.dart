import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Screen/DashBoard/dashboard_screen.dart';
import 'package:school_sampleproj/providers/otp_provider.dart';

import 'Screen/OtpScreen/otp_screen.dart';
import 'Screen/SignIn/signup_screen.dart';
import 'providers/pre_login_provider.dart';
import 'providers/sign_up_provider.dart';
import 'Screen/Spash/splash.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (ctx) => SignUpProvider()),
    ChangeNotifierProvider(create: (ctx)=>OtpProvider()),
      ChangeNotifierProvider(create: (ctx)=>PreLoginProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.classname,
      routes: {
        '/': (context) => SplashScreen(),
        SignUpScreen.classname:(context)=>SignUpScreen(),
        OtpScreen.classname:(context)=>OtpScreen(),
        DashBoard.classname:(context)=>DashBoard()
      },
    );
  }
}
