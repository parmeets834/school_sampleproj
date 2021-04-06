// To parse this JSON data, do
//
//     final gallaryItemModel = gallaryItemModelFromJson(jsonString);

import 'dart:convert';

class GallaryItemModel {
  GallaryItemModel({
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
  dynamic addedBy;
  String addedDate;
  dynamic addedDateStr;
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
  String mediaType;
  dynamic ordstr;
  String photoLocation;
  dynamic qrystr;
  int slNo;
  dynamic tchReply;

  factory GallaryItemModel.fromRawJson(String str) => GallaryItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GallaryItemModel.fromJson(Map<String, dynamic> json) => GallaryItemModel(
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
