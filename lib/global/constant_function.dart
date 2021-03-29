import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_sampleproj/model.dart';
import 'package:uuid/uuid.dart';

import 'constants.dart';

bool shouldButtonEnabled = true;

getDateStringFromDate(DateTime dateTime) {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  return dateFormat.format(dateTime);
}

getScreenSize(BuildContext context) {
  return Size(
      MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
}

getUuid() {
  return Uuid().v4();
}

showMessage(GlobalKey<ScaffoldState> key, String msg) {
  key.currentState.showSnackBar(SnackBar(content: Text("" + msg)));
}

disableButton() {
  //step 2
  shouldButtonEnabled = false;
  Timer(Duration(seconds: 5), () => shouldButtonEnabled = true);
}

checkButtonEnable() {
  // step 1
  return shouldButtonEnabled;
}


// set User
void setConfigurationAsPerUser( UserData userdata){
  activeClientCode=userdata.activeClientCode;

}

void seturls() {
  if (activeClientCode == "SMPSD2003") {
    webServiceURL =
        "http://stms.newgentechnology.net/WebDataProcessingServer.aspx";
    webResourceURL = "http://stms.newgentechnology.net";

    paymentPageURL = "http://stmarys.newgentechnology.in/Payment/Login.aspx";

    homePageURL = "https://www.smpsnebsarai.in/senior/index.php";

    schoolPrinciMsgURL = "https://www.smpsnebsarai.in/principals-message.php";
    schoolContactUs = "https://www.smpsnebsarai.in/contact-us.php";
    schoolAchiveURL = "https://www.smpsnebsarai.in/achievements.php";
    schoolFacility = "https://www.smpsnebsarai.in/facilities.php";
    schoolGenCirc = "https://www.smpsnebsarai.in/notice-board.php";

    schoolAboutUS = "https://www.smpsnebsarai.in/about-school.php";
  }
  if (activeClientCode == "SMPSD2002") {
    webServiceURL =
        "http://stmd.newgentechnology.net/WebDataProcessingServer.aspx";
    webResourceURL = "http://stmd.newgentechnology.net";

    paymentPageURL = "http://stmaryd.newgentechnology.in/Payment/Login.aspx";

    homePageURL = "https://www.smpsnebsarai.in/devli/index.php";

    schoolPrinciMsgURL = "https://www.smpsnebsarai.in/principals-message.php";
    schoolContactUs = "https://www.smpsnebsarai.in/contact-us.php";
    schoolAchiveURL = "https://www.smpsnebsarai.in/achievements.php";
    schoolFacility = "https://www.smpsnebsarai.in/facilities.php";
    schoolGenCirc = "https://www.smpsnebsarai.in/notice-board.php";

    schoolAboutUS = "https://www.smpsnebsarai.in/about-school.php";
  }
  if (activeClientCode == "SMPSD2001") {
    webServiceURL =
        "http://stmn.newgentechnology.net/WebDataProcessingServer.aspx";
    webResourceURL = "http://stmn.newgentechnology.net";
    paymentPageURL = "http://stmaryn.newgentechnology.in/Payment/Login.aspx";

    homePageURL = "https://www.smpsnebsarai.in/";
    schoolPrinciMsgURL = "https://www.smpsnebsarai.in/principals-message.php";
    schoolContactUs = "https://www.smpsnebsarai.in/contact-us.php";
    schoolAchiveURL = "https://www.smpsnebsarai.in/achievements.php";
    schoolFacility = "https://www.smpsnebsarai.in/facilities.php";
    schoolGenCirc = "https://www.smpsnebsarai.in/notice-board.php";
    schoolAboutUS = "https://www.smpsnebsarai.in/about-school.php";
  }
}





int getIntValue(String intstr) {
  int TmpNum = 0;
  try {
    TmpNum = int.parse(intstr);
  } catch (e) {
    print('error caught: $e');
  }
  return TmpNum;
}

String getAcaYear(String AcaStart) {
  String Tmpstr = "";
  int TmpNum = getIntValue(AcaStart) + 1;
  Tmpstr = AcaStart + "-" + TmpNum.toString().substring(2);
  return Tmpstr;
}

String getUserActivityString(String LogInUserCode, String LogInUserName,
    String LoginActivityRequest, String LogInModule) {
  String tmpstr = LogInUserCode +
      "|" +
      LogInUserName +
      "|" +
      LoginActivityRequest +
      "|" +
      LogInModule;
  return tmpstr;
}

toast(GlobalKey<ScaffoldState> key,String msg){
  key.currentState.showSnackBar(SnackBar(content: Text(msg)));
}


refineString(String str){
  var list_arr = new List();
  String Respstring =str;
  Respstring = Respstring.substring(0, Respstring.indexOf("||JasonEnd", 0));
  var jsonResponse = jsonDecode(Respstring);
  list_arr = jsonResponse;
  return Respstring;
}


