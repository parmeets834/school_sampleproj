/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'dart:convert';

class TeacherDetailModel {
  TeacherDetailModel({
    this.loginSatus,
    this.loginmsg,
    this.activeUserCode,
    this.activeUserMstid,
    this.activeUserYrid,
    this.activeUserName,
    this.activeUserFName,
    this.activeUserEmployeeCategory,
    this.activeUserGender,
    this.activeUserTcSts,
    this.activeUserPhone,
    this.activeUserClass,
    this.activeNotificationNos,
    this.activeUserSection,
    this.examTerm1Classes,
    this.examTerm2Classes,
    this.activeUserEmployeeTyp,
    this.activeUserDesignation,
    this.activeUserSalutation,
    this.activeUserImage,
  });

  String loginSatus;
  String loginmsg;
  String activeUserCode;
  String activeUserMstid;
  String activeUserYrid;
  String activeUserName;
  String activeUserFName;
  String activeUserEmployeeCategory;
  String activeUserGender;
  String activeUserTcSts;
  String activeUserPhone;
  String activeUserClass;
  String activeNotificationNos;
  String activeUserSection;
  String examTerm1Classes;
  String examTerm2Classes;
  String activeUserEmployeeTyp;
  String activeUserDesignation;
  String activeUserSalutation;
  String activeUserImage;

  factory TeacherDetailModel.fromRawJson(String str) => TeacherDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeacherDetailModel.fromJson(Map<String, dynamic> json) => TeacherDetailModel(
    loginSatus: json["loginSatus"],
    loginmsg: json["loginmsg"],
    activeUserCode: json["ActiveUserCode"],
    activeUserMstid: json["ActiveUserMstid"],
    activeUserYrid: json["ActiveUserYrid"],
    activeUserName: json["ActiveUserName"],
    activeUserFName: json["ActiveUserFName"],
    activeUserEmployeeCategory: json["ActiveUserEmployeeCategory"],
    activeUserGender: json["ActiveUserGender"],
    activeUserTcSts: json["ActiveUserTCSts"],
    activeUserPhone: json["ActiveUserPhone"],
    activeUserClass: json["ActiveUserClass"],
    activeNotificationNos: json["ActiveNotificationNos"],
    activeUserSection: json["ActiveUserSection"],
    examTerm1Classes: json["ExamTerm1Classes"],
    examTerm2Classes: json["ExamTerm2Classes"],
    activeUserEmployeeTyp: json["ActiveUserEmployeeTyp"],
    activeUserDesignation: json["ActiveUserDesignation"],
    activeUserSalutation: json["ActiveUserSalutation"],
    activeUserImage: json["ActiveUserImage"],
  );

  Map<String, dynamic> toJson() => {
    "loginSatus": loginSatus,
    "loginmsg": loginmsg,
    "ActiveUserCode": activeUserCode,
    "ActiveUserMstid": activeUserMstid,
    "ActiveUserYrid": activeUserYrid,
    "ActiveUserName": activeUserName,
    "ActiveUserFName": activeUserFName,
    "ActiveUserEmployeeCategory": activeUserEmployeeCategory,
    "ActiveUserGender": activeUserGender,
    "ActiveUserTCSts": activeUserTcSts,
    "ActiveUserPhone": activeUserPhone,
    "ActiveUserClass": activeUserClass,
    "ActiveNotificationNos": activeNotificationNos,
    "ActiveUserSection": activeUserSection,
    "ExamTerm1Classes": examTerm1Classes,
    "ExamTerm2Classes": examTerm2Classes,
    "ActiveUserEmployeeTyp": activeUserEmployeeTyp,
    "ActiveUserDesignation": activeUserDesignation,
    "ActiveUserSalutation": activeUserSalutation,
    "ActiveUserImage": activeUserImage,
  };
}
