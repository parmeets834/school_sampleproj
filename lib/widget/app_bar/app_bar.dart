import 'package:flutter/material.dart';

class AppBarCommon extends StatelessWidget {
  String title;


  AppBarCommon({this.title="Title Undefined"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("My Task"),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
              backgroundColor: Colors.white, child: Icon(Icons.person)),
        ),
        SizedBox(
          width: 7,
        ),
      ],
    );
    ;
  }

  static getSize(BuildContext context) {
    return Size(MediaQuery.of(context).size.width,AppBar().preferredSize.height);

  }
}
