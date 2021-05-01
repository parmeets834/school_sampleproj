
/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Student.dart';
import 'package:school_sampleproj/student_providers/dash_board_provider.dart';
import 'package:school_sampleproj/teachers_provider/teacher_dash_board_provider.dart';

import 'package:school_sampleproj/widget/Cards/dashboard_card.dart';
import 'package:school_sampleproj/widget/other/responsive_ui.dart';
import '../../global/constant_function.dart';

class TeachersDashBoard extends StatefulWidget {
  static const classname="/TeachersDashBoard";
  @override
  _TeachersDashBoardState createState() => _TeachersDashBoardState();
}



class _TeachersDashBoardState extends State<TeachersDashBoard> with RouteAware {



  double _height;

  double _width;

  double _pixelRatio;

  bool _large;

  bool _medium;


  @override
  void initState() {
    final provider=Provider.of<TeacherDashBoardProvider>(context,listen: false);


  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    double screenWidth = MediaQuery.of(context).size.width;
     final provider=Provider.of<TeacherDashBoardProvider>(context);
     provider.context=context;
    provider.carrage=ModalRoute.of(context).settings.arguments;
    currunt_teacher=provider.carrage.teacherDetailModel;
    setConfigurationAsPerTeacher(currunt_teacher);
    seturls();
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.list),
        title: Text("Cloud Campus App"),
      ),
      body: Stack(children: [
        Container(
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 120,
                color:Colors.grey[100],
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:10,top:10,bottom: 10),
                      child: Container(
                        height:100,
                        width: 100,
                        child: CircleAvatar(backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/a/a6/Georgia_School_logo_round.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:10,top:10,bottom: 10),
                      child: Container(

                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("St Marry Public School",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            Text("Teacher name: ${currunt_teacher.activeUserName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            Text("Class : ${currunt_teacher.activeUserClass}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            Text("DashBoard: Teacher",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                          ],),
                      ),
                    )

                  ],
                ),
              ),

              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 130,left: 10,right: 10),
            child: GridView.builder(
              itemCount: provider.getDashBoardItem().length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: (){
                      provider.loadRoute(index);
                    },
                    child: DashBoardCard(image: provider.items[index].image,title: provider.items[index].title,));
              },
            ))
      ]),
    );
  }


  @override
  void didPush() {
    print("did push happen");
  }

  @override
  void didPushNext() {
    print("did push Next happen");
  }

  @override
  void didPopNext() {
    print("did pop happen");
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
  }

  @override
  void didPop() {
    print("didPop");
  }
}
