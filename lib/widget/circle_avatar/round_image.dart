/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  Function onTap;
  IconData icon;
  String text;


  RoundImage({this.onTap, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Icon(icon),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}


