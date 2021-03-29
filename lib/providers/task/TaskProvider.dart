import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:school_sampleproj/global/constants.dart';



class TaskProvider extends ChangeNotifier {
  dynamic state = appstate.laoding_complete;

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  beforeLoad() {}

  reset(){
    state=appstate.loading;
  }

  void onRefresh() async {
    state=appstate.loading;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 5000));
    refreshController.refreshCompleted();
    state=appstate.laoding_complete;
    notifyListeners();
  }

  void onloading() {
    print("loading begins");

  }
}
