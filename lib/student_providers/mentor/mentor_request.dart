import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/utils/check_dio_error.dart';
import 'package:school_sampleproj/utils/dialog.dart';

class MentorRequestProvider extends ChangeNotifier {
  Carrage carrage;
  dynamic state = appstate.defaultstate;
TextEditingController message=new TextEditingController();

  BuildContext context;


  void sendData() async{
    try{
      await StudentApi().sentMentorRequest(currunt_user, carrage,message.text);
      DialogUtil(context: context,message: "Successful uploaded",title: "Request Added").showSuccessDialog();


    }on DioError catch(e){
    String str= CheckDioError.check(e);
    DialogUtil(context:context,message:str);
    } on SocketException catch(e){
      DialogUtil(context:context,message:"No Internet");
    }
  }

  void reset(){
    message.text="";

  }

}
