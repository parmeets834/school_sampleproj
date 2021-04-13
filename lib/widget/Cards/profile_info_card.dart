/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';

class ProfileInformationCard extends StatelessWidget {
 @required IconData icon;
 @required  Color iconcolor;
 @required String title;
 @required String text;


 ProfileInformationCard({ @required this.icon,  @required this.iconcolor, @required this.title, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(bottom:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: iconcolor,
            size: 25,
          ),
          SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
               title,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: Text(
                  text,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey[400],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

