

import 'package:flutter/cupertino.dart';
import 'package:school_sampleproj/Screen/Mentor/mentor.dart';
import 'package:school_sampleproj/Screen/Notification/notification_screen.dart';
import 'package:school_sampleproj/Screen/Task/Task.dart';
import 'package:school_sampleproj/Screen/VideoPlayer/video_player.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/dashboard_items.dart';

class DashBoardProvider extends ChangeNotifier{

List<DasBoardItem> items=[
  DasBoardItem(image: 'assets/notification.svg',title: 'Notification'),
  DasBoardItem(image: 'assets/checklist.svg',title: 'My Task'),
  DasBoardItem(image: 'assets/gallery.svg',title: 'Gallery'),
  DasBoardItem(image: 'assets/online-lession.svg',title: 'My Mentors'),
  DasBoardItem(image: 'assets/calender.svg',title: 'Time Table'),
  DasBoardItem(image: 'assets/chat.svg',title: 'Ask My Mentor'), //6
  DasBoardItem(image: 'assets/id-card2.svg',title: 'This is Me'),
  DasBoardItem(image: 'assets/graph.svg',title: 'My performance'),
  DasBoardItem(image: 'assets/canvas.svg',title: 'Notice Board'),
  DasBoardItem(image: 'assets/report1.svg',title: 'Fees Details'),
  DasBoardItem(image: 'assets/googlemeet.svg',title: 'Google \n Meet'),
  DasBoardItem(image: 'assets/zoom.svg',title: 'Zoom \n '),
  DasBoardItem(image: 'assets/microsoft.svg',title: 'MicroSoft Teams'),
];

  BuildContext context;

  Carrage carrage;

  getDashBoardItem() {
    return items;
  }

  loadRoute(int index) {
    switch(index){
      case 0: Navigator.pushNamed(context, NotificationScreen.classname,arguments: carrage);
      break;
      case 1: Navigator.pushNamed(context, Task.classname);
      break;
      case 2: Navigator.pushNamed(context, VideoPlayer.classname);
      break;

      case 5: Navigator.pushNamed(context, Mentor.classname);
      break;

    }

  }



}