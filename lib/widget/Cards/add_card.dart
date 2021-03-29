

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';

class AddCard extends StatelessWidget {
  String text;
  Function onClick;


  AddCard({this.text="", this.onClick});

  @override
  Widget build(BuildContext context) {
    Size screenSize=getScreenSize(context);
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 100,
        child: Card(
            shadowColor: main_color,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style: GoogleFonts.raleway(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
