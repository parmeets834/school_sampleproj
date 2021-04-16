/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/model/teacher_details_model.dart';
import 'package:school_sampleproj/utils/database.dart';

class PreLoginProvider extends ChangeNotifier{

  List<dynamic> loggedUserList;
  dynamic state=appstate.defaultstate;

  loadLoginUsers() async{
    loggedUserList=[];
   List<dynamic> ls= await DatabaseUtil().getLoggedUser();
   for(dynamic item in ls){
     String str=item["userdata"];
     print("data is here ${str}");
     String usertype_str=item["usertype"];

     if(usertype_str=="${userType.parent}")
     loggedUserList.add(StudentDataModel.fromRawJson(str));
     else if(usertype_str=="${userType.teacher}")
     loggedUserList.add(TeacherDetailModel.fromRawJson(str));
   }
notifyListeners();
  }

updateUserList(){
loggedUserList=null;
loadLoginUsers();
}

removeAllUserFromDataBase() async {
  await DatabaseUtil().deleteUserData();
  loggedUserList=null;
  loadLoginUsers();
}



}