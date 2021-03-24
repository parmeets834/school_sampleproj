

import 'package:flutter/cupertino.dart';
import 'package:school_sampleproj/Screen/Task/Task.dart';
import 'package:school_sampleproj/model/dashboard_items.dart';

class PreLoginProvider extends ChangeNotifier{

List<DasBoardItem> items=[
  DasBoardItem(image: 'assets/notification.svg',title: 'Notification'),
  DasBoardItem(image: 'assets/checklist.svg',title: 'My Task'),
  DasBoardItem(image: 'assets/gallery.svg',title: 'Gallery'),
  DasBoardItem(image: 'assets/online-lession.svg',title: 'My Mentors'),
  DasBoardItem(image: 'assets/calender.svg',title: 'Time Table'),
  DasBoardItem(image: 'assets/chat.svg',title: 'Ask My Mentor'), //6
  DasBoardItem(image: 'assets/id-card.svg',title: 'This is Me'),
  DasBoardItem(image: 'assets/graph.svg',title: 'My performance'),
  DasBoardItem(image: 'assets/canvas.svg',title: 'Notice Board'),
  DasBoardItem(image: 'assets/report1.svg',title: 'Fees Details'),
  DasBoardItem(image: 'assets/googlemeet.svg',title: 'Video \n  Conf - 1'),
  DasBoardItem(image: 'assets/zoom.svg',title: 'Video \n  Conf - 2'),
  DasBoardItem(image: 'assets/microsoft.svg',title: 'MicroSoft Teams'),
];

  BuildContext context;

  getDashBoardItem() {
    return items;
  }

  loadRoute(int index) {
    switch(index){
      case 1: Navigator.pushNamed(context, Task.classname);
      break;
    }

  }



}