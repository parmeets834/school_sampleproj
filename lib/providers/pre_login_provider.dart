

import 'package:flutter/cupertino.dart';
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
  DasBoardItem(image: 'assets/coupon.svg',title: 'Coupon'),

  DasBoardItem(image: 'assets/googlemeet.svg',title: 'Video \n  Conf - 1'),
  DasBoardItem(image: 'assets/quiz.svg',title: 'Quiz'),
  DasBoardItem(image: 'assets/zoom.svg',title: 'Video \n  Conf - 2'),
];

  getDashBoardItem() {
    return items;
  }



}