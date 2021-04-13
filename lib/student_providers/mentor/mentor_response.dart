import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/utils/check_dio_error.dart';
import 'package:school_sampleproj/utils/dialog.dart';

class MentorResponseProvider extends ChangeNotifier {
  Carrage carrage;
  dynamic state = appstate.defaultstate;
TextEditingController message=new TextEditingController();

  BuildContext context;


  void reset(){
    message.text="";

  }

  void loadData() {
    if(carrage.mentorRequestModel.tchReply.isEmpty){
      message.text="No Reply";
    }else{
      message.text=carrage.mentorRequestModel.tchReply;
    }



  }

}
