

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonDetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Container(
        height: 100,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Teacher Name:",
                        style: GoogleFonts.raleway(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Kashnmir",
                        style: GoogleFonts.raleway(
                          fontSize: 14,),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Class: ",
                        style: GoogleFonts.raleway(
                          fontSize: 14, fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(" 10th"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
