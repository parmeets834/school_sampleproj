import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_sampleproj/widget/Cards/person_detail_card.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar.dart';
import 'package:school_sampleproj/widget/button/gradient_button.dart';
import 'package:school_sampleproj/widget/textbox/multiTextInput.dart';

class MentorRequest extends StatefulWidget {
  static const classname = "/MentorRequest";

  @override
  _MentorRequestState createState() => _MentorRequestState();
}

class _MentorRequestState extends State<MentorRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBarCommon.getSize(context),
        child: AppBarCommon(
          title: "Mentor Request",
        ),
      ),
      body: Column(
        children: [
          PersonDetailCard(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MultiLineTextInput(),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GradientButton(width: 150,onpress: (){},text: "Submit",),
              GradientButton(width: 150,onpress: (){},text: "Reset",),
            ],
          )
        ],
      ),
    );
  }
}
