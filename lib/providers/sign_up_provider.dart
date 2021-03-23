
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Screen/OtpScreen/otp_screen.dart';
import 'package:school_sampleproj/global/const_funcitons.dart';
import 'package:school_sampleproj/utils/validation.dart';

import 'package:uuid/uuid.dart';

class SignUpProvider extends ChangeNotifier {

  TextEditingController userIdcontroller = new TextEditingController();
  TextEditingController schooldController = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  GlobalKey<ScaffoldState> skey;
  BuildContext context;

  TextEditingController activeTypeUser=new TextEditingController();

   List<String> user_type=['Parent', 'Teacher', 'Admin'];

/*  bool performBasicValidation() {
    bool iserror = false;
    if (userIdcontroller.text.isEmpty) {
      skey.currentState
          .showSnackBar(new SnackBar(content: Text("FirstName is Undefined")));
      iserror = true;
    }

    if (emailcontroller.text.isEmpty) {
      skey.currentState
          .showSnackBar(new SnackBar(content: Text("Email is Undefined")));
      iserror = true;
    }
    if (phonecontroller.text.isEmpty) {
      skey.currentState.showSnackBar(
          new SnackBar(content: Text("Phone Number is Undefined")));
      iserror = true;
    }
    if (passwordcontroller.text.isEmpty) {
      skey.currentState
          .showSnackBar(new SnackBar(content: Text("Password is Undefined")));
      iserror = true;
    }

    if (Validation().isEmailValid(emailcontroller.text) == false) {
      skey.currentState
          .showSnackBar(new SnackBar(content: Text("Email Format Incorrect")));
    }
    if (Validation().isPhoneNumberValid(phonecontroller.text) == false) {
      skey.currentState.showSnackBar(
          new SnackBar(content: Text("Phone Number must be 10 digits")));
    }

    return iserror;
  }*/

  createUser() async {

    Navigator.pushNamed(context, OtpScreen.classname);

  }


}
