/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/Screen/MediaViewers/image_cropper.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/student_detail_model.dart';
import 'package:school_sampleproj/utils/file_manager.dart';

class ProfileProvider extends ChangeNotifier {
  String name;

  var student_name;
  BuildContext context;
  var admission_number = "";

  var dob = "";

  var motherName = "";

  var fatherName;

  var phoneNumber = "";

  var address;

  var join_class;

  var rollNumber;

  var place;

  var district;

  var state;

  var country;

  var boodGroup;

  var religion;

  var community;

  var category;

  var father_occupation;

  var motherOccupation;

  var section;

  var classNumber;

  var gender;

  var dateOfAdmission;

  File userImage;

  static const userImageName = "user_image";

  void loadData() async {
    Response resp = await StudentApi().getUserProfile(currunt_user);
    String rstr = refineString(resp.data);
    List<dynamic> ls = jsonDecode(rstr);
    for (dynamic item in ls) {
      StudentDetailModel model = StudentDetailModel.fromJson(item);

      switch (model.itemKeyName) {
        case "StudentsInfo":
          admission_number = model.infoField2;
          break;
        case "CLNAME":
          classNumber = model.infoField;
          break;
        case "SECNAME":
          section = model.infoField;
          break;
        case "ADMNO":
          admission_number = model.infoField;
          break;
        case "SNAME":
          student_name = model.infoField;
          break;
        case "GENDER":
          gender = model.infoField;
          break;
        case "PHONE":
          phoneNumber = model.infoField;
          break;
        case "DOB":
          dob = model.infoField;
          break;
        case "DOA":
          dateOfAdmission = model.infoField;
          break;
        case "JOC":
          join_class = model.infoField;
          break;
        case "RNO":
          rollNumber = model.infoField;
          break;
        case "FATHERNAME":
          fatherName = model.infoField;
          break;
        case "MNAME":
          motherName = model.infoField;
          break;
        case "ADDRESS":
          address = model.infoField;
          break;
        case "PLACE":
          place = model.infoField;
          break;
        case "DISTRICT":
          district = model.infoField;
          break;
        case "STATE":
          state = model.infoField;
          break;
        case "BG":
          boodGroup = model.infoField;
          break;
        case "RELIGION":
          religion = model.infoField;
          break;
        case "COMMUNITY":
          community = model.infoField;
          break;
        case "CATEGORY":
          category = model.infoField;
          break;
        case "RNO":
          rollNumber = model.infoField;
          break;
        case "FOCC":
          father_occupation = model.infoField;
          break;
        case "MOCC":
          motherOccupation = model.infoField;
          break;
      }
    }



    notifyListeners();
  }

  writeFileDisk(File file) async {
    try {
      delete(userImageName);
    } catch (e) {}

    try {
      userImage = await FileManager().writeImage(file, userImageName);
    } catch (e) {
      print("file error is $e");

    }
    notifyListeners();
  }

  delete(String name) async {
    try {
      await FileManager().deleteByName(name);
    } catch (e) {}
    notifyListeners();
  }

  void takePicture() {
    Navigator.pushNamed(context, ImageCropperScreen.classname);
  }
}
