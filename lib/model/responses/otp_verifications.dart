/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

// To parse this JSON data, do
//
//     final otpVerificationModel = otpVerificationModelFromJson(jsonString);

import 'dart:convert';

class OtpVerificationModel {
  OtpVerificationModel({
    this.actionType,
    this.infoField,
    this.infoField1,
    this.infoField2,
    this.infoField3,
    this.itemKeyName,
    this.itemName,
    this.rcdId,
    this.sLno,
  });

  int actionType;
  String infoField;
  String infoField1;
  String infoField2;
  String infoField3;
  String itemKeyName;
  String itemName;
  int rcdId;
  int sLno;

  factory OtpVerificationModel.fromRawJson(String str) => OtpVerificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) => OtpVerificationModel(
    actionType: json["ActionType"],
    infoField: json["InfoField"],
    infoField1: json["InfoField1"],
    infoField2: json["InfoField2"],
    infoField3: json["InfoField3"],
    itemKeyName: json["ItemKeyName"],
    itemName: json["ItemName"],
    rcdId: json["RcdID"],
    sLno: json["SLno"],
  );

  Map<String, dynamic> toJson() => {
    "ActionType": actionType,
    "InfoField": infoField,
    "InfoField1": infoField1,
    "InfoField2": infoField2,
    "InfoField3": infoField3,
    "ItemKeyName": itemKeyName,
    "ItemName": itemName,
    "RcdID": rcdId,
    "SLno": sLno,
  };
}
