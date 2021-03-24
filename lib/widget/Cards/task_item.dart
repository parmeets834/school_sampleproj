

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_sampleproj/global/constant_function.dart';

class TaskItem extends StatelessWidget {
  String imageurl;
  String date;
  String subject;
  String description;


  TaskItem({this.imageurl="https://bitsofco.de/content/images/2018/12/broken-1.png", this.date="", this.subject="", this.description=""});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Center(child: Image.network(imageurl,fit: BoxFit.fill,)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(subject,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text(date,style: GoogleFonts.montserrat(fontSize: 12)),
                  SizedBox(height: 5,),
                  Text(description,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black54),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
