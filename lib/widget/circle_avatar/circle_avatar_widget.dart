import 'package:flutter/material.dart';


class CircleAvtarWidget extends StatelessWidget {
  double radius,iconsize;
Color color;

  CircleAvtarWidget({this.radius=40, this.iconsize=60, this. color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Icon(
        Icons.person,
        size: iconsize,
      ),
    );
  }
}
