
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Student.dart';
import 'package:school_sampleproj/student_providers/dash_board_provider.dart';

import 'package:school_sampleproj/widget/Cards/dashboard_card.dart';
import 'package:school_sampleproj/widget/other/responsive_ui.dart';
import '../../global/constant_function.dart';

class StudentDashBoard extends StatefulWidget {
  static const classname="/StudentDashBoard";
  @override
  _StudentDashBoardState createState() => _StudentDashBoardState();
}



class _StudentDashBoardState extends State<StudentDashBoard> with RouteAware {



  double _height;

  double _width;

  double _pixelRatio;

  bool _large;

  bool _medium;


  @override
  void initState() {
    final provider=Provider.of<DashBoardProvider>(context,listen: false);


  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    double screenWidth = MediaQuery.of(context).size.width;
     final provider=Provider.of<DashBoardProvider>(context);
     provider.context=context;
    provider.carrage=ModalRoute.of(context).settings.arguments;
    currunt_user=provider.carrage.studentData;
    setConfigurationAsPerUser(currunt_user);
    seturls();
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.list),
        title: Text("Login to Cloud Campus"),
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
                            Text("Student:${provider.carrage.studentData.activeUserName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            Text("Class : ${provider.carrage.studentData.activeUserClass}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            Text("DashBoard: Parent",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

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
