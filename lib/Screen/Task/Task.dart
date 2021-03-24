import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/providers/TaskProvider.dart';
import 'package:school_sampleproj/widget/Cards/task_item.dart';
import 'package:school_sampleproj/widget/Cards/task_item_shimmer.dart';
import 'package:school_sampleproj/widget/ShimmerContainer.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar.dart';
import 'package:shimmer/shimmer.dart';

class Task extends StatefulWidget {
  static const classname = "/Task";

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBarCommon.getSize(context),
          child: AppBarCommon(title: "My Task")),
      body: Consumer<TaskProvider>(builder: (context, value, child) {
        // ignore: missing_return
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
                itemBuilder: (_, __) => TaskItem(description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",date:"Date: ${getDateStringFromDate(DateTime.now())}",
                  subject: "English Hons"),

                itemCount: 10,
              ),
            ),
          );
        }
      }),
    );
  }
}
