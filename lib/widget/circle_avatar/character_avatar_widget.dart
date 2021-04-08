import 'package:flutter/material.dart';


class CharacterAvtarWidget extends StatelessWidget {
  double radius,iconsize;
Color color;
  String text;

  CharacterAvtarWidget({this.radius=40, this.iconsize=60, this. color,this.text});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Text("${text.characters.first}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    );
  }
}
