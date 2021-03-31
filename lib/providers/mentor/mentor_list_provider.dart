/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constants.dart';

class MentorListProvider extends ChangeNotifier{

  dynamic state=appstate.defaultstate;

  loadData() async {
    if(state!=appstate.defaultstate)return;
   Response response=await Api().getMentorList(currunt_user);


  }

}