import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/Screen/PreLogin/pre_login.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/responses/OtpModel.dart';
import 'package:school_sampleproj/model/responses/otp_verifications.dart';
import 'package:school_sampleproj/student_providers/pre_login/pre_login_provider.dart';
import 'package:school_sampleproj/utils/database.dart';

class OtpProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> skey;

  TextEditingController otpInputController = new TextEditingController();

  BuildContext context;
  OtpResponseModel model;
  Carrage carrage;

  void submitOtp() async {
  if(carrage.usertype==userType.parent) {
    submitStudentOtp();
  }
  }

  submitStudentOtp() async {
    Response resp=await StudentApi().verificationOtp(otp_user, otpInputController.text.trim());
    String str= refineString(resp.data.toString());
    List<dynamic> ls= jsonDecode(str);
    if(OtpVerificationModel.fromJson(ls[0]).infoField1=="0" || OtpVerificationModel.fromJson(ls[0]).infoField1=="1"){
      toast(skey, "User Authenticate Successfully");

      try {
        DatabaseUtil().insertStudentData(otp_user);
      } catch(e){
        toast(skey, "User Already Register");
      }

      Provider.of<PreLoginProvider>(context,listen: false).state=appstate.reload;
      Timer(Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(context, PreLogin.classname, (route) => false);
      });


    }else{
      toast(skey, "Otp Authentication Failed");
    }
  }

}
