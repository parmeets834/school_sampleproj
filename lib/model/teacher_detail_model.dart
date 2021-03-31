/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */
// To parse this JSON data, do
//
//     final teacherDetailModel = teacherDetailModelFromJson(jsonString);

import 'dart:convert';

class TeacherDetailModel {
  TeacherDetailModel({
    this.actionType,
    this.cnd,
    this.empName,
    this.empcode,
    this.fathName,
    this.ordstr,
    this.photofile,
    this.phone,
    this.qrystr,
    this.subj,
    this.sex,
    this.tchAutoId,
    this.tClass,
    this.tSection,
    this.prfx,
  });

  int actionType;
  int cnd;
  String empName;
  String empcode;
  String fathName;
  dynamic ordstr;
  String photofile;
  String phone;
  dynamic qrystr;
  String subj;
  String sex;
  int tchAutoId;
  String tClass;
  String tSection;
  String prfx;

  factory TeacherDetailModel.fromRawJson(String str) => TeacherDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeacherDetailModel.fromJson(Map<String, dynamic> json) => TeacherDetailModel(
    actionType: json["ActionType"],
    cnd: json["Cnd"],
    empName: json["EmpName"],
    empcode: json["Empcode"],
    fathName: json["FathName"],
    ordstr: json["ORDSTR"],
    photofile: json["PHOTOFILE"],
    phone: json["Phone"],
    qrystr: json["QRYSTR"],
    subj: json["SUBJ"],
    sex: json["Sex"],
    tchAutoId: json["TCHAutoID"],
    tClass: json["TClass"],
    tSection: json["TSection"],
    prfx: json["prfx"],
  );

  Map<String, dynamic> toJson() => {
    "ActionType": actionType,
    "Cnd": cnd,
    "EmpName": empName,
    "Empcode": empcode,
    "FathName": fathName,
    "ORDSTR": ordstr,
    "PHOTOFILE": photofile,
    "Phone": phone,
    "QRYSTR": qrystr,
    "SUBJ": subj,
    "Sex": sex,
    "TCHAutoID": tchAutoId,
    "TClass": tClass,
    "TSection": tSection,
    "prfx": prfx,
  };
}

