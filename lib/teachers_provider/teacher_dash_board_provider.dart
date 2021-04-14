import 'package:flutter/cupertino.dart';
import 'package:school_sampleproj/Screen/Gallery/gallery_screen.dart';
import 'package:school_sampleproj/Screen/MediaViewers/image_cropper.dart';
import 'package:school_sampleproj/Screen/Mentor/mentor.dart';
import 'package:school_sampleproj/Screen/MyMentors/my_mentor_list.dart';
import 'package:school_sampleproj/Screen/Notification/notification_screen.dart';
import 'package:school_sampleproj/Screen/Task/Task.dart';
import 'package:school_sampleproj/Screen/TimeTable/time_table.dart';
import 'package:school_sampleproj/Screen/profile/profile.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/dashboard_items.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherDashBoardProvider extends ChangeNotifier {
  List<DasBoardItem> items = [
    DasBoardItem(image: 'assets/notification.svg', title: 'Notification'),
    DasBoardItem(image: 'assets/checklist.svg', title: 'Home Work'),
    DasBoardItem(image: 'assets/gallery.svg', title: 'Gallery'),
    DasBoardItem(image: 'assets/online-lession.svg', title: 'Reply to Parent'),
    DasBoardItem(image: 'assets/canvas.svg', title: 'Notice Board'),
    DasBoardItem(image: 'assets/id-card2.svg', title: 'My Profile'),
    DasBoardItem(image: 'assets/bookshelf.svg', title: 'Subject List'), // subject
    DasBoardItem(image: 'assets/calendar2.svg', title: 'Time Table'),
    DasBoardItem(image: 'assets/today_calender.svg', title: 'Today Schedule'), //6

    DasBoardItem(image: 'assets/students.svg', title: 'Student Details'),
    DasBoardItem(image: 'assets/teacher.svg', title: 'Teachers Details'),
    DasBoardItem(image: 'assets/class_time_table.svg', title: 'Class Time Table'),
    DasBoardItem(image: 'assets/class_time_table.svg', title: 'Home Work'),

    DasBoardItem(image: 'assets/report1.svg', title: 'Fees Details'),
    DasBoardItem(image: 'assets/googlemeet.svg', title: 'Google \n Meet'),
    DasBoardItem(image: 'assets/zoom.svg', title: 'Zoom \n '),
    DasBoardItem(image: 'assets/microsoft.svg', title: 'MicroSoft Teams'),
  ];

  BuildContext context;

  Carrage carrage;

  getDashBoardItem() {
    return items;
  }

  loadRoute(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, NotificationScreen.classname,
            arguments: carrage);
        break;
      case 1:
        Navigator.pushNamed(context, Task.classname);
        break;
      case 2:
        Navigator.pushNamed(context, Gallery.classname);
        break;
      case 3:
        Navigator.pushNamed(context, MyMentorList.classname);
        break;
      case 4:
        Navigator.pushNamed(context, StudentTimeTablePage.classname);
        break;

      /*  case 6:
        Navigator.pushNamed(context, ImageCropperScreen.classname);
        break;*/
      case 6:
        Navigator.pushNamed(context, Profile.classname);
        break;
      case 10:
        _googleMeet();
        break;
      case 11:
        _launchZoom();
        break;
      case 12:
        _launchTeams();
        break;
    }
  }

  void _googleMeet() async {
    final url = 'https://meet.google.com/hds-krig-iyv';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchZoom() async {
    final url =
        'https://zoom.us/j/5147914379?pwd=cVNuQWlxZkFXV1N6Y2k2OStNWEphQT09';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchTeams() async {
    final url = 'https://teams.live.com/meet/95805842661305';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
