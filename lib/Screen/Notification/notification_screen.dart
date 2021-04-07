import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:school_sampleproj/Screen/PostScreen/PostScren.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/post_model.dart';
import 'package:school_sampleproj/providers/notification/notification_provider.dart';
import 'package:school_sampleproj/widget/Cards/task_item.dart';
import 'package:school_sampleproj/widget/Cards/task_item_shimmer.dart';
import 'package:school_sampleproj/widget/ShimmerContainer.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatefulWidget {
  static const classname = "/NotificationScreen";

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);
    provider.carrage=ModalRoute.of(context).settings.arguments;
    provider.loadData();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBarCommon.getSize(context),
          child: AppBarCommon(title: "Notifications")),
      body: Consumer<NotificationProvider>(builder: (context, value, child) {
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
                itemBuilder: (_, index) => InkWell(
                  child: InkWell(
                    onTap:()=> Navigator.pushNamed(context, PostScreen.classname,
                        arguments: Carrage(
                            postModel: PostModel(title:value.notifications[index].hWDateStr2,content:value.notifications[index].hWRemarks,
                            mediaUrl: value.notifications[index].photoLocation,date: value.notifications[index].hWDateStr
                            ))),
                    child: TaskItem(description: "${value.notifications[index].hWRemarks}",date:"Date: ${"${value.notifications[index].hWDateStr}"}",
                      subject: "${"${value.notifications[index].hWDateStr2}"}",imageurl:"${value.notifications[index].photoLocation}" ,),
                  ),
                ),

                itemCount: value.notifications.length,
              ),
            ),
          );
        }
      }),
    );
  }

  @override
  void initState() {
final provider=Provider.of<NotificationProvider>(context,listen: false);
  provider.state=appstate.defaultstate;
  }
}
