import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Screen/DashBoard/dashboard_screen.dart';
import 'package:school_sampleproj/Screen/SignIn/signup_screen.dart';
import 'package:school_sampleproj/model/Student.dart';
import 'package:school_sampleproj/providers/pre_login_provider.dart';
import 'package:school_sampleproj/widget/other/responsive_ui.dart';

class PreLogin extends StatefulWidget {
  @override
  _PreLoginState createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  List<UserModel> list = [
    UserModel(
        name: "Name : Ram singh",
        classname: "Class: 12th ",
        rollno: "Roll No: 120342"),
    UserModel(
        name: "Name : Kshitij singh",
        classname: "Class: 10th ",
        rollno: "Roll No: 120342"),
    UserModel(
        name: "Name : Ayush singh",
        classname: "Class: 10th ",
        rollno: "Roll No: 120342"),
    UserModel(
        name: "Name : Deepak singh",
        classname: "Class: 12th ",
        rollno: "Roll No:  120342"),
  ];

  double _height;

  double _width;

  double _pixelRatio;

  bool _large;

  bool _medium;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;
    _pixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
   final provider= Provider.of<PreLoginProvider>(context);
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.list),
        title: Text("Login to Cloud Campus"),
      ),
      body: Stack(children: [
        Container(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 120,
                color: Colors.grey[100],
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/a/a6/Georgia_School_logo_round.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("GEORGIA SCHOOL", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),),
                            Text("Dwaraka sector - 21 ND 110018")

                          ],),
                      ),
                    )

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Row(
                  children: [
                    rigisterNewUser(),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.classname);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "User already Registered",
                          style: TextStyle(

                              fontWeight: FontWeight.bold, fontSize: 17),
                        )),
                  )),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 230),
            child: GridView.builder(
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.2),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap:(){
                      Navigator.pushNamed(context, DashBoard.classname);
                    },
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
                            Text(
                              list[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              list[index].classname,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              list[index].rollno,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
      ]),
    );
  }


  Widget rigisterNewUser() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery
            .of(context)
            .size
            .width * 0.2),
        child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          onPressed: () {
            Navigator.pushNamed(context, SignUpScreen.classname);
          },
          textColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          child: Container(
            alignment: Alignment.center,
            //  width: _width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              gradient: LinearGradient(
                colors: <Color>[Colors.blue[300], Colors.blueAccent],
              ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Text("Register New User", style: TextStyle(fontSize: 14)),
          ),
        ),
      ),
    );
  }
}
