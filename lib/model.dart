// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';
// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

class UserData {
  UserData({
    this.activeClientCode,
    this.loginStatus,
    this.loginMsg,
    this.activeUserCode,
    this.activeUserMstid,
    this.activeUserYrid,
    this.activeUserName,
    this.activeUserFName,
    this.activeUserMName,
    this.activeUserGender,
    this.activeUserTcSts,
    this.activeUserPhone,
    this.activeUserClass,
    this.activeNotificationNos,
    this.activeUserSection,
    this.examTerm1Classes,
    this.examTerm2Classes,
    this.activeUserClid,
    this.activeUserImage,
  });

  String activeClientCode;
  String loginStatus;
  String loginMsg;
  String activeUserCode;
  String activeUserMstid;
  String activeUserYrid;
  String activeUserName;
  String activeUserFName;
  String activeUserMName;
  String activeUserGender;
  String activeUserTcSts;
  String activeUserPhone;
  String activeUserClass;
  String activeNotificationNos;
  String activeUserSection;
  String examTerm1Classes;
  String examTerm2Classes;
  String activeUserClid;
  String activeUserImage;

  factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    activeClientCode: json["activeClientCode"],
    loginStatus: json["loginStatus"],
    loginMsg: json["loginMsg"],
    activeUserCode: json["activeUserCode"],
    activeUserMstid: json["activeUserMstid"],
    activeUserYrid: json["activeUserYrid"],
    activeUserName: json["activeUserName"],
    activeUserFName: json["activeUserFName"],
    activeUserMName: json["activeUserMName"],
    activeUserGender: json["activeUserGender"],
    activeUserTcSts: json["activeUserTCSts"],
    activeUserPhone: json["activeUserPhone"],
    activeUserClass: json["activeUserClass"],
    activeNotificationNos: json["activeNotificationNos"],
    activeUserSection: json["activeUserSection"],
    examTerm1Classes: json["examTerm1Classes"],
    examTerm2Classes: json["examTerm2Classes"],
    activeUserClid: json["activeUserClid"],
    activeUserImage: json["activeUserImage"],
  );

  Map<String, dynamic> toJson() => {
    "activeClientCode": activeClientCode,
    "loginStatus": loginStatus,
    "loginMsg": loginMsg,
    "activeUserCode": activeUserCode,
    "activeUserMstid": activeUserMstid,
    "activeUserYrid": activeUserYrid,
    "activeUserName": activeUserName,
    "activeUserFName": activeUserFName,
    "activeUserMName": activeUserMName,
    "activeUserGender": activeUserGender,
    "activeUserTCSts": activeUserTcSts,
    "activeUserPhone": activeUserPhone,
    "activeUserClass": activeUserClass,
    "activeNotificationNos": activeNotificationNos,
    "activeUserSection": activeUserSection,
    "examTerm1Classes": examTerm1Classes,
    "examTerm2Classes": examTerm2Classes,
    "activeUserClid": activeUserClid,
    "activeUserImage": activeUserImage,
  };
}
