import 'package:flutter/material.dart';
import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/model/Student.dart';
import 'package:school_sampleproj/model/teacher_details_model.dart';

//string

const login_credentials = "login_credentials";
const demo_image_url="https://bitsofco.de/content/images/2018/12/broken-1.png";
enum userType{parent,teacher,admin}


// colors
const main_color = Color(0xFF66dbfd);
const color_grid = [Color(0xFF66dbfd), Color(0xFF058aed)];
const color_dark_theme=Color(0xFF1f9ef1);
// state management

 enum appstate {
  defaultstate,
  loading,
  laoding_complete,
  crash,
  reload
}


// objects
 StudentDataModel currunt_user;
 StudentDataModel otp_user;
 TeacherDetailModel otp_teacher;


//-----------------------------------outside parameter given by client----------------------------------------------------------------
// urls
String appRunningMode="Testing";  //Testing /Live
String activeClientCode="SMPSD2001"; // school name changes

bool isLoggedIn = false;
String activeOrgNamelogin="St. Mary's Public School Sainik Farm";
String activeOrgName="St. Mary's Public School";
String activeUserCode="A023310xx";
String activeUserClientId="";
String activeUserName="WASHIUR RAHMAN";
String activeUserFName="ABDUL KHALIQUE KHAN";
String activeUserMName="NEEKHAT SABA";
String activeUserGender="Male";
String activeUserTCSts="A";
String activeUserPhone="7381078620";
String activeUserImage="noPhoto.jpg";
String activeUserClass="X";
String activeUserSection="D";
String activeUserMstid="3963";
String activeUserYrid="19932";
String activeUserClid="10";
String activeAcastart="2020";
String paymentPageURL="http://payment.newgentechnology.in/Payment/Login.aspx";
String homePageURL="http://starnoldschool.in/index.html";
String schoolAchiveURL ="http://www.starnoldschool.in/Events_Awards.html";
String schoolPrinciMsgURL ="http://starnoldschool.in/Principal-Message.html";
String schoolFacility ="http://www.starnoldschool.in/News-Main.html";
String schoolContactUs ="http://starnoldschool.in/contact.html";
String schoolGenCirc ="http://www.starnoldschool.in/exam-schedule.html";
String schoolAboutUS ="https://www.smpsnebsarai.in/about-school.php";

String activeNotificationNos="";
String examTerm1Classes="";
String examTerm2Classes="";
String webServiceURL="http://test.newgentechnology.net/WebDataProcessingServer.aspx";
String webResourceURL="http://test.newgentechnology.net";
String activeSelectedVideoSubjHead="Class -V-D "+ " Subject :Hindi";




//Fix

String activeSelectedVideoSeleSubjMode="";
String ativeSelectedVideoSeleSubj="";
String activeSelectedVideoSeleClass="";
String activeSelectedVideoSeleSec="";
//Changeable
String activeSelectedVideo=""; //"""/StudyMaterials/butterfly.mp4";
String activeSelectedVideoRemarks="";
String activeSelectedNewVideoEditMode="";
String activeSelectedNewVideoHWID="";
String activeSelectedNewVideoDate="";
bool activeSelectedNewVideodataloaded=false;


