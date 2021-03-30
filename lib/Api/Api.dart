/*
 * Copyright © 2021.This whole application is developed by Parmeet Singh,For Aphelia .Sharing and update code outside organisation is prohibted.
 */

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model.dart';

import 'DioClientInstance.dart';

class Api {
  Dio dio = ApiService().getclient();

  Future verifyLoginNew(String Uid, String Pwd) async {
    print("Log In 1");
    String tmplogsts = "";

    String ActivityDescStr = getUserActivityString(
        Uid, Uid, "Student Login Request", "Student Apk.");

    var map = {
      "title": 'StudentLogin',
      "description": ActivityDescStr,
      "ReqUserID": Uid,
      "ReqPassWord": Pwd,
      "ReqAcastart": activeAcastart,
    };

    return dio.post("/",
        options: Options(contentType: "application/x-www-form-urlencoded"),
        data: await map);
  }



  Future<Response>  getNotifications(UserData data)
  async{

    String ActivityDescStr =getUserActivityString(data.activeUserCode,data.activeUserCode ,"Class wise Notification List",  "Student Apk.");;

    return await dio.post("", data: {
      "title": 'Notification',
      "description": ActivityDescStr,
      "ReqClass":  data.activeUserClass,
      "ReqSection":  data.activeUserSection,
      "ReqYear": activeAcastart,
      "ReqPara1": '',
      "ReqAdmNo": '',
    }, options: Options(contentType: "application/x-www-form-urlencoded"),);

  }




  void handleError(DioError error) {
    print("Dio Error status message is ${error.response.statusMessage}");
    print("Dio Error Message is ${error.message}");
    print("Dio Error Response Data is ${error.response.data}");
  }

// step 1
  Future checkUserRegister(String Uid) async {

    String activityDescStr =getUserActivityString(Uid,Uid,"Students Info. Request for Profile Verification ",  "Student Apk.");

    var map = {
      "title": 'RegisterStudent',
      "description": activityDescStr,
      "ReqAcastart": activeAcastart,
      "ReqUserID":  Uid,
      "ReqPhoneCode":"13525"
    };

    return dio.post("/",
        options: Options(contentType: "application/x-www-form-urlencoded"),
        data: await map);
  }

  // step 2
  Future<Response> sentOtp(UserData data)
  async{
    return await dio.post("", data: {
      "title": 'SendVerification',
      "description": "Send Verification Code Student",
      "ReqUserID":  data.activeUserCode,
      "ReqAcastart": activeAcastart,
      "ReqPhoneCode": "123456", //firebase api code
      "ReqSMSType":appRunningMode,
    }, options: Options(contentType: "application/x-www-form-urlencoded"),);
  }

  // step 3
  Future<Response> verificationOtp(UserData data,String otp)
  async{
    return await dio.post("", data: {
      "title": 'UserVerification',
      "description": "User Verification",
      "ReqUserID":  data.activeUserCode,
      "ReqVeriCode": otp,
      "ReqAcastart": activeAcastart,
      "ReqPhoneCode": "123456", //firebase api code
      "ReqSMSType":appRunningMode,
    }, options: Options(contentType: "application/x-www-form-urlencoded"),);
  }
}
