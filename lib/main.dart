import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Screen/DashBoard/dashboard_screen.dart';
import 'package:school_sampleproj/Screen/MediaViewers/ImageViewer.dart';
import 'package:school_sampleproj/Screen/MediaViewers/pdf_view.dart';
import 'package:school_sampleproj/Screen/MediaViewers/youtube.dart';
import 'package:school_sampleproj/Screen/Notification/notification_screen.dart';
import 'package:school_sampleproj/Screen/PreLogin/pre_login.dart';
import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/providers/gallery/gallery_providder.dart';
import 'package:school_sampleproj/providers/mediaViewers/video_provider.dart';
import 'package:school_sampleproj/providers/mediaViewers/youtube_provider.dart';
import 'Screen/Gallery/gallery_screen.dart';
import 'Screen/MediaViewers/video_player.dart';
import 'Screen/MyMentors/my_mentor_list.dart';
import 'Screen/TimeTable/time_table.dart';
import 'file:///D:/Practice%20folder/school_sampleproj/lib/providers/video_player.dart';
import 'package:school_sampleproj/providers/dash_board_provider.dart';
import 'package:school_sampleproj/providers/mentor/mentor_list_provider.dart';
import 'package:school_sampleproj/providers/mentor/mentor_provider.dart';
import 'package:school_sampleproj/providers/mentor/mentor_response.dart';
import 'package:school_sampleproj/providers/notification/notification_provider.dart';
import 'package:school_sampleproj/providers/pre_login/pre_login_provider.dart';
import 'package:school_sampleproj/providers/registration.dart';
import 'package:school_sampleproj/providers/splash/splash_provider.dart';
import 'package:school_sampleproj/utils/database.dart';
import 'Screen/Mentor/mentor.dart';
import 'Screen/Mentor/mentor_list.dart';
import 'Screen/Mentor/mentor_request.dart';
import 'Screen/Mentor/mentor_response.dart';
import 'Screen/PostScreen/ImageDisplay.dart';
import 'Screen/SignIn/registration.dart';

import 'package:school_sampleproj/providers/otp_provider.dart';

import 'Screen/OtpScreen/otp_screen.dart';
import 'Screen/PostScreen/PostScren.dart';
import 'Screen/Task/Task.dart';
import 'providers/mentor/mentor_request.dart';
import 'Screen/Spash/splash.dart';
import 'providers/task/task_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // await DatabaseUtil().insertData(UserData(activeUserClid: "123"));
  await DatabaseUtil().getLoggedUser();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
  )
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => RegistrationProvider()),
        ChangeNotifierProvider(create: (ctx) => OtpProvider()),
        ChangeNotifierProvider(create: (ctx) => DashBoardProvider(),),
        ChangeNotifierProvider(create: (ctx) => TaskDataProvider()),
        ChangeNotifierProvider(create: (ctx) => MentorProvider()),
        ChangeNotifierProvider(create: (ctx) => MentorListProvider()),
        ChangeNotifierProvider(create: (ctx) => MentorRequestProvider()),
        ChangeNotifierProvider(create: (ctx) => MentorResponseProvider()),
        ChangeNotifierProvider(create: (ctx) => SplashProvider()),
        ChangeNotifierProvider(create: (ctx) => PreLoginProvider()),
        ChangeNotifierProvider(create: (ctx) => NotificationProvider()),
        ChangeNotifierProvider(create: (ctx) => GalleryProvider()),
        ChangeNotifierProvider(create: (ctx) => YoutubeProvider()),
        ChangeNotifierProvider(create: (ctx) => VideoProvider()),
      ],
      child: MyApp(),
    ));
  });


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.classname,
      routes: {
        '/': (context) => SplashScreen(),
        SignUpScreen.classname: (context) => SignUpScreen(),
        OtpScreen.classname: (context) => OtpScreen(),
        DashBoard.classname: (context) => DashBoard(),
        PostScreen.classname: (context) => PostScreen(),
        Task.classname: (context) => Task(),
        Mentor.classname:(context)=> Mentor(),
        MentorRequest.classname:(context)=>MentorRequest(),
        MentorResponse.classname:(context)=>MentorResponse(),
        MentorList.classname:(context)=>MentorList(),
        NotificationScreen.classname:(context)=>NotificationScreen(),
        ImageDisplay.classname:(context)=>ImageDisplay(),
        ImageViewer.classname:(context)=>ImageViewer(),
        PreLogin.classname:(context)=>PreLogin(),
        VideoPlayer.classname:(context)=>VideoPlayer(),
        Gallery.classname:(context)=>Gallery(),
        Youtube.classname:(context)=>Youtube(),
        PdfView.classname:(context)=>PdfView(),
        StudentTimeTablePage.classname:(context)=>StudentTimeTablePage(),
        MyMentorList.classname:(context)=>StudentTimeTablePage()
      },
    );
  }
}
