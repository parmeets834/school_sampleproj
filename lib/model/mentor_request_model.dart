/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

// To parse this JSON data, do
//
//     final mentorRequestModel = mentorRequestModelFromJson(jsonString);

import 'dart:convert';

class MentorRequestModel {
  MentorRequestModel({
    this.actionType,
    this.addedBy,
    this.addedDate,
    this.addedDateStr,
    this.clid,
    this.clSerStr,
    this.hwAcedmicYear,
    this.hwAdmno,
    this.hwClass,
    this.hwDate,
    this.hwDateStr,
    this.hwid,
    this.hwRemarks,
    this.hwSection,
    this.hwSname,
    this.hwSubject,
    this.isActive,
    this.mediaType,
    this.ordstr,
    this.photoLocation,
    this.qrystr,
    this.slNo,
    this.tchReply,
  });

  int actionType;
  String addedBy;
  String addedDate;
  String addedDateStr;
  int clid;
  dynamic clSerStr;
  int hwAcedmicYear;
  String hwAdmno;
  String hwClass;
  String hwDate;
  String hwDateStr;
  int hwid;
  String hwRemarks;
  String hwSection;
  String hwSname;
  String hwSubject;
  bool isActive;
  dynamic mediaType;
  dynamic ordstr;
  String photoLocation;
  dynamic qrystr;
  int slNo;
  String tchReply;

  factory MentorRequestModel.fromRawJson(String str) => MentorRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MentorRequestModel.fromJson(Map<String, dynamic> json) => MentorRequestModel(
    actionType: json["ActionType"],
    addedBy: json["AddedBy"],
    addedDate: json["AddedDate"],
    addedDateStr: json["AddedDateStr"],
    clid: json["CLID"],
    clSerStr: json["CLSerStr"],
    hwAcedmicYear: json["HWAcedmicYear"],
    hwAdmno: json["HWAdmno"],
    hwClass: json["HWClass"],
    hwDate: json["HWDate"],
    hwDateStr: json["HWDateStr"],
    hwid: json["HWID"],
    hwRemarks: json["HWRemarks"],
    hwSection: json["HWSection"],
    hwSname: json["HWSname"],
    hwSubject: json["HWSubject"],
    isActive: json["IsActive"],
    mediaType: json["MediaType"],
    ordstr: json["ORDSTR"],
    photoLocation: json["PhotoLocation"],
    qrystr: json["QRYSTR"],
    slNo: json["SLNo"],
    tchReply: json["TchReply"],
  );

  Map<String, dynamic> toJson() => {
    "ActionType": actionType,
    "AddedBy": addedBy,
    "AddedDate": addedDate,
    "AddedDateStr": addedDateStr,
    "CLID": clid,
    "CLSerStr": clSerStr,
    "HWAcedmicYear": hwAcedmicYear,
    "HWAdmno": hwAdmno,
    "HWClass": hwClass,
    "HWDate": hwDate,
    "HWDateStr": hwDateStr,
    "HWID": hwid,
    "HWRemarks": hwRemarks,
    "HWSection": hwSection,
    "HWSname": hwSname,
    "HWSubject": hwSubject,
    "IsActive": isActive,
    "MediaType": mediaType,
    "ORDSTR": ordstr,
    "PhotoLocation": photoLocation,
    "QRYSTR": qrystr,
    "SLNo": slNo,
    "TchReply": tchReply,
  };
}
