/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/utils/database.dart';

class PreLoginProvider extends ChangeNotifier{

  List<UserData> loggedUserList;
  dynamic state=appstate.defaultstate;

  loadLoginUsers() async{
    loggedUserList=[];
   List<dynamic> ls= await DatabaseUtil().getLoggedUser();
   for(dynamic item in ls){
     String str=item["userdata"];
     print("data is here ${str}");
     loggedUserList.add(UserData.fromRawJson(str));


   }
notifyListeners();
  }

  // dependecy on otp screen
  isUserListUpdate(){
    if(state!=appstate.reload){
      return;
    }
    state=appstate.defaultstate;
    loadLoginUsers();

  }




}