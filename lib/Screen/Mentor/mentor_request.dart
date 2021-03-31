import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/providers/mentor/mentor_request.dart';
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
    final provider=Provider.of<MentorRequestProvider>(context);
 provider.carrage=ModalRoute.of(context).settings.arguments;
provider.context=context;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBarCommon.getSize(context),
        child: AppBarCommon(
          title: "Mentor Request",
        ),
      ),
      body: Consumer<MentorRequestProvider>(
          builder: (context, value,child) {
          return Column(
            children: [
              PersonDetailCard(name:  provider.carrage.teacherDetailModel.empName,classname:  provider.carrage.teacherDetailModel.tClass,),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MultiLineTextInput(controller: value.message,   m_hintText: "Please Write Here",
                  m_helperText: 'Write all relvant point in this request',
                  m_labelText: 'Mentor Request',),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientButton(width: 150,onpress: (){
                   provider.sendData();
                  },text: "Submit", ),
                  GradientButton(width: 150,onpress: (){
                    value.reset();
                  },text: "Reset",),
                ],
              )
            ],
          );
        }
      ),
    );
  }

  @override
  void initState() {
    final provider=Provider.of<MentorRequestProvider>(context,listen: false);
    provider.message.text="";
  provider.state=appstate.defaultstate;

  }
}
