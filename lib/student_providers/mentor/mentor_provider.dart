import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/mentor_request_model.dart';

class MentorProvider extends ChangeNotifier {
  List<MentorRequestModel> mentorRequestList;

  dynamic state = appstate.defaultstate;

  loadData() async {
  state=appstate.loading;
  notifyListeners();
    Response resp = await StudentApi().getParentRequest(currunt_user);
    String str = refineString(resp.data);
    List<dynamic> ls = jsonDecode(str);
  mentorRequestList=[];
    for (dynamic item in ls) {

      MentorRequestModel data= MentorRequestModel.fromJson(item);
      mentorRequestList.add(data);
    }  state=appstate.laoding_complete;
     notifyListeners();
  }
}
