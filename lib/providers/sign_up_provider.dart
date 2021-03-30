import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/Screen/OtpScreen/otp_screen.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/check_dio_error.dart';
import 'package:school_sampleproj/utils/app_logger.dart';
import 'package:school_sampleproj/utils/database.dart';
import 'package:school_sampleproj/utils/validation.dart';
import 'package:sqflite/sqflite.dart';

import 'package:uuid/uuid.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController userIdcontroller = new TextEditingController();
  TextEditingController schooldController = new TextEditingController();
  TextEditingController activeTypeUser = new TextEditingController();
  GlobalKey<ScaffoldState> skey;
  BuildContext context;
  var list_arr = new List();

  List<String> user_type = ['Parent', 'Teacher', 'Admin'];

  performRegister() async {
    activeClientCode=schooldController.text; // this is due to request taken
    seturls();

    // Response resp=    await Api().registerUser(userIdcontroller.text,schooldController.text );

    Response resp;
    try {
      resp = await Api().checkUserRegister(userIdcontroller.text);
    } on DioError catch (e) {
      CheckDioError obj = CheckDioError.check(e);
      if (obj != null) {
        if (obj.errorCode == 0) {
        } else {
          performRegister();
        }
      }
    }

// adding aji code below

    String Respstring = resp.data.toString();
    Respstring = Respstring.substring(0, Respstring.indexOf("||JasonEnd", 0));
    var jsonResponse = jsonDecode(Respstring);
    list_arr = jsonResponse;
    print(resp.statusCode == 200 ? resp.data : "Here");

    String loginStatus = "N/A";
    String loginMsg = "N/A";
    UserData userData = new UserData();
    userData.activeClientCode = activeClientCode;

    if (list_arr != null) {
      for (int j = 0; j < list_arr.length; j++) {
        if (list_arr[j]["ItemKeyName"] == "StudentsInfo") {
          userData.loginStatus = list_arr[j]["InfoField1"];
          userData.loginMsg = list_arr[j]["InfoField"];
          if (userData.loginStatus == null) {
            // todo action user not found
            return;
          }
        }
        if (list_arr[j]["ItemKeyName"] == "ADMNO") {
          userData.activeUserCode = list_arr[j]["InfoField"];

          userData.activeUserMstid = list_arr[j]["InfoField1"];
          userData.activeUserYrid = list_arr[j]["InfoField2"];
        }
        if (list_arr[j]["ItemKeyName"] == "SNAME") {
          userData.activeUserName = list_arr[j]["InfoField"];
        }

        if (list_arr[j]["ItemKeyName"] == "FATHERNAME") {
          userData.activeUserFName = list_arr[j]["InfoField"];
        }

        if (list_arr[j]["ItemKeyName"] == "MNAME") {
          userData.activeUserMName = list_arr[j]["InfoField"];
        }

        if (list_arr[j]["ItemKeyName"] == "MNAME") {
          userData.activeUserGender = list_arr[j]["InfoField"];
        }

        if (list_arr[j]["ItemKeyName"] == "TCSTS") {
          userData.activeUserTcSts = list_arr[j]["InfoField"];
        }
        if (list_arr[j]["ItemKeyName"] == "SMSPHONE") {
          userData.activeUserPhone = list_arr[j]["InfoField"];
        }
        if (list_arr[j]["ItemKeyName"] == "CLNAME") {
          userData.activeUserClass = list_arr[j]["InfoField"];
          userData.activeNotificationNos = list_arr[j]["InfoField3"];
        }
        if (list_arr[j]["ItemKeyName"] == "SECNAME") {
          userData.activeUserSection = list_arr[j]["InfoField"];
          userData.examTerm1Classes = list_arr[j]["InfoField2"];
          userData.examTerm2Classes = list_arr[j]["InfoField3"];
        }

        if (list_arr[j]["ItemKeyName"] == "CLID") {
          userData.activeUserClid = list_arr[j]["InfoField"];
        }
        if (list_arr[j]["ItemKeyName"] == "GENDER") {
          userData.activeUserGender = list_arr[j]["InfoField"];
        }
        if (list_arr[j]["ItemKeyName"] == "PHOTOFILE") {
          userData.activeUserImage = list_arr[j]["InfoField"];
          print("photo file " + activeUserImage);
        }
      }
    }
    print("ExamTerm1Classes : " + examTerm1Classes);
    print("ExamTerm2Classes : " + examTerm2Classes);

    print("Log In STatus " + loginStatus);

    print("Log In Mstid " + activeUserMstid);
    print("Log In Yrid " + activeUserYrid);
    print("Log In Name " + activeUserName);
    print("Log In Class " + activeUserClass);
    print("Log In Section " + activeUserSection);
    if (userData.loginStatus == "0" || userData.loginStatus == "1") {
      AppLogger.print("Login Successful");
      try{
        if(userData.activeUserCode!=null ){
         // await DatabaseUtil().insertData(userData);
          AppLogger.print( userData.toRawJson());
        }
      }catch(e){
    toast(skey, "User Already Login");
        return;
      }
      otp_user=userData;
      Navigator.pushNamed(context, OtpScreen.classname);

    } else {
      toast(skey, "User not found");
    }


  }
}
