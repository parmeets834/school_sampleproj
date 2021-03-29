/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */


import 'package:flutter/material.dart';
import 'package:school_sampleproj/Screen/DashBoard/dashboard_screen.dart';

class UserCard extends StatelessWidget {
  String name;
  String classname;
  String rollno;
  UserCard({this.name, this.classname, this.rollno});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5,),
              Align(
                child: Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        "assets/person.png"),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("$name",
                style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Text(
                "$classname",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
              "$rollno",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

