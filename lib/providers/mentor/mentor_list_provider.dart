/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/teacher_detail_model.dart';

class MentorListProvider extends ChangeNotifier{

  dynamic state=appstate.defaultstate;
  List<TeacherDetailModel> teacherList;


  loadData() async {
    if(state!=appstate.defaultstate)return;

    teacherList=[];
   Response response=await Api().getMentorList(currunt_user);

 String str=  refineString(response.data.toString());

      List<dynamic> ls=   jsonDecode(str);
          for(dynamic item in ls){
            teacherList.add(TeacherDetailModel.fromJson(item));
          }
  state=appstate.laoding_complete;
  notifyListeners();
  }

}