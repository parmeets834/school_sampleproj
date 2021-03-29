/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

class OtpResponseModel {
  OtpResponseModel({
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

  factory OtpResponseModel.fromRawJson(String str) => OtpResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) => OtpResponseModel(
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

