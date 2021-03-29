import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:school_sampleproj/Api/Api.dart';

import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  dynamic state = appstate.defaultstate;
  Carrage carrage;
  List<NotificationModel> notifications;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

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

  void loadData() async {

    if (state == appstate.loading || state == appstate.laoding_complete) {
      return;
    }
    notifications=[];
    state=appstate.loading;// prevent recalls
    Response resp = await Api().getNotifications(carrage.userData);
    print("Here1");
    String Respstring = resp.data.toString();
    print(Respstring);
    Respstring=Respstring.substring(0,Respstring.indexOf("||JasonEnd",0));
    print("Here2");
    print("Here3");
    print("Here4");
    var jsonData = json.decode(Respstring);

    int x=0;
    for(var u in jsonData){
      x=x+1;

     NotificationModel model = NotificationModel(u["HWID"].toString() , u["HWDateStr"].toString(), u["HWSubject"].toString(), u["HWRemarks"].toString(), u["PhotoLocation"].toString());
      notifications.add(model);
    }

    print(notifications.length);

    print(resp.statusCode == 200 ? resp.data : "Here");

    print("data is ${resp.data}");
    state=appstate.laoding_complete;
    notifyListeners();
  }
}
