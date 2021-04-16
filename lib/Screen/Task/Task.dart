import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:school_sampleproj/Screen/HomeWorkDisplayScreen/home_work_screen.dart';
import 'package:school_sampleproj/Screen/PostScreen/PostScren.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/post_model.dart';
import 'package:school_sampleproj/student_providers/task/task_provider.dart';

import 'package:school_sampleproj/widget/Cards/task_item.dart';
import 'package:school_sampleproj/widget/Cards/task_item_shimmer.dart';
import 'package:school_sampleproj/widget/ShimmerContainer.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar_student.dart';
import 'package:shimmer/shimmer.dart';

class Task extends StatefulWidget {
  static const classname = "/Task";

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {



  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TaskDataProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBarCommonStudent.getSize(context),
          child: AppBarCommonStudent(title: "My Task")),
      body: Consumer<TaskDataProvider>(
          builder: (context, value, child) {
        if (provider.state == appstate.loading) {
          return Container(
            padding: EdgeInsets.all(10),
            child: SimmerContainer(
              child: ListView.builder(
                  itemBuilder: (_, __) => TaskItemShimmer(),)
            ),
          );
        } else if (provider.state == appstate.laoding_complete) {
          return Container(
            padding: EdgeInsets.all(10),
            child: SmartRefresher(
              controller: provider.refreshController,
              onRefresh: provider.onRefresh,
              onLoading: provider.onloading,
              enablePullDown: true,
              child: ListView.builder(
                itemBuilder: (_, index) => InkWell(
                  child: InkWell(
                    onTap:()=> Navigator.pushNamed(context, HomeWorkScreen.classname,
                        arguments: Carrage(postModel: PostModel(
                            mediaUrl:value.taskList[index].photoLocation ,
                            date:value.taskList[index].hwDateStr,
                            mediaType:value.taskList[index].mediaType,
                            content: value.taskList[index].hwRemarks,title: value.taskList[index].hwRemarks))),
                    child: TaskItem(description: "${value.taskList[index].hwRemarks} ",date:"Date:${value.taskList[index].hwDateStr}",
                      subject: "${value.taskList[index].hwSubject}"),
                  ),
                ),

                itemCount: value.taskList.length,
              ),
            ),
          );
        }
      }),
    );
  }

  @override
  void initState() {
  final provider=  Provider.of<TaskDataProvider>(context,listen: false);
  provider.loadData();
  }
}
