import 'package:flutter/material.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model.dart';

class AppBarCommonTeacher extends PreferredSize {
  String title;


  AppBarCommonTeacher({this.title="Title Undefined"});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        margin:   EdgeInsets.only(top:25),
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
                    Text("Teacher: ${currunt_teacher.activeUserName??=""}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                 /*   Text("Class : ${currunt_user.activeUserClass}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                 */   Text("DashBoard: Teacher",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

                  ],),
              ),
            )

          ],
        ),
      ),
    );
    ;
  }

  static getSize(BuildContext context) {
    return Size(MediaQuery.of(context).size.width,250);

  }
}
