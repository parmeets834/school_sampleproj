import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constant_function.dart';

import 'package:school_sampleproj/global/constants.dart';

import 'package:school_sampleproj/model/task_model.dart';
import 'package:school_sampleproj/utils/check_dio_error.dart';

class TaskDataProvider extends ChangeNotifier {
  dynamic state = appstate.loading;
  GlobalKey<ScaffoldState> s_task_key;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<TaskModel> taskList;

  beforeLoad() {}

  reset() {
    state = appstate.loading;
  }

  void onRefresh() async {
    state = appstate.loading;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 5000));
    refreshController.refreshCompleted();
    state = appstate.laoding_complete;
    notifyListeners();
  }

  void onloading() {
    print("loading begins");
  }

  loadData() async {
    state = appstate.loading;
    notifyListeners();
    taskList = [];
    Response resp;
    try {
      resp = await StudentApi().getTaskList(currunt_user);
    } on DioError catch (e) {
      CheckDioError checkDioError = CheckDioError.check(e);
      toast(s_task_key, checkDioError.message);
    }
    String refinestr = refineString(resp.data.toString());
    List<dynamic> ls = jsonDecode(refinestr);
    for (dynamic item in ls) {
      addTaskItemWithMediaType(item);
    }
    state = appstate.laoding_complete;
    notifyListeners();
  }

  addTaskItemWithMediaType(dynamic item) {
   String resourceUrl= webResourceURL+"/Homework/";
    TaskModel model = TaskModel.fromJson(item);
    if (model.mediaType.toLowerCase() == "image") {

      model.photoLocation =resourceUrl+ model.photoLocation + ".jpg";
    } else if (model.mediaType.toLowerCase() == "video") {
      model.photoLocation =resourceUrl+ model.photoLocation + ".mp4";
    }
    taskList.add(model);
  }
}
