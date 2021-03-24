

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_sampleproj/global/constant_function.dart';

class TaskItemShimmer extends StatelessWidget {
  String imageurl;
  String date;
  String subject;
  String description;


  TaskItemShimmer({this.imageurl="", this.date="", this.subject="", this.description=""});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex :2 ,
              child: Container(
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: 40.0,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
