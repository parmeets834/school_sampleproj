/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/teacher_detail_model.dart';
import 'dart:math';

class MentorListProvider extends ChangeNotifier {
  dynamic state = appstate.defaultstate;
  List<TeacherDetailModel> teacherList;
  int lastpos = -1;
  Random random = new Random();
  List<Color> colors;

  loadData() async {
    if (state != appstate.defaultstate) return;

    teacherList = [];
    colors = [];
    Response response = await Api().getMentorList(currunt_user);

    String str = refineString(response.data.toString());

    List<dynamic> ls = jsonDecode(str);

    for (dynamic item in ls) {
      colors.add(getContentColor());
      teacherList.add(TeacherDetailModel.fromJson(item));
    }
    state = appstate.laoding_complete;
    notifyListeners();
  }

  Color getContentColor() {
    // Blue
    // Green
    // RED
    // Brown,
    //orange
    //khakhi
    int pos = random.nextInt(10); // from 0 upto 99 included
    if (lastpos == pos) {
      print("Color Pos Repeat " + pos.toString());
      pos = random.nextInt(10);
    }
    lastpos = pos;
    print("Color Pos" + pos.toString());

    if (pos < 1) {
      return Colors.blue;
    } else if (pos == 1) {
      return Colors.red;
    } else if (pos == 2) {
      return Colors.blueGrey;
    } else if (pos == 3) {
      return Colors.green;
    } else if (pos == 4) {
      return Colors.pink;
    } else if (pos == 5) {
      return Colors.orange;
    } else if (pos == 6) {
      return Colors.indigo;
    } else if (pos == 7) {
      return Colors.deepOrange;
    } else if (pos == 8) {
      return Colors.deepPurple;
    } else if (pos == 9) {
      return Colors.brown;
    } else {
      return Colors.teal;
    }
  }
}
