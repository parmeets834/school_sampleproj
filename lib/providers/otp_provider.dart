import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/Screen/PreLogin/pre_login.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/responses/OtpModel.dart';
import 'package:school_sampleproj/model/responses/otp_verifications.dart';
import 'package:school_sampleproj/providers/pre_login/pre_login_provider.dart';
import 'package:school_sampleproj/utils/database.dart';

class OtpProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> skey;

  TextEditingController otpInputController = new TextEditingController();

  BuildContext context;
  OtpResponseModel model;
  void submitOtp() async {
    if(model==null){
      toast(skey, "Loading..");
      toast(skey,"Otp not Found");
      return;
    }
    if(model.infoField2==otpInputController.text.trim()){
      Response resp=await Api().verificationOtp(otp_user, otpInputController.text.trim());
     String str= refineString(resp.data.toString());
   List<dynamic> ls= jsonDecode(str);
      if(OtpVerificationModel.fromJson(ls[0]).infoField1=="0" || OtpVerificationModel.fromJson(ls[0]).infoField1=="1"){
        toast(skey, "User Authenticate Successfully");
        DatabaseUtil().insertData(otp_user);
        Provider.of<PreLoginProvider>(context,listen: false).state=appstate.reload;
        Navigator.pushNamedAndRemoveUntil(context, PreLogin.classname, (route) => false);
      }else{
        toast(skey, "Otp Authentication Failed");
      }



    }else{
      toast(skey, "Otp Authentication Failed");
    }


  }

  void sentOtp() async {
    Response resp = await Api().sentOtp(otp_user);
    String data = refineString(resp.data.toString());
   List<dynamic> ls= jsonDecode(data);
     model= OtpResponseModel.fromJson(ls[0]);
    print("otp data is : ${model.infoField2}");
  }
}
