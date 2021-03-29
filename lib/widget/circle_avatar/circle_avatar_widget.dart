import 'package:flutter/material.dart';


class CircleAvtarWidget extends StatelessWidget {
  double radius,iconsize;


  CircleAvtarWidget({this.radius=40, this.iconsize=60});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[200],
      child: Icon(
        Icons.person,
        size: iconsize,
      ),
    );
  }
}
