import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/student_providers/mentor/mentor_response.dart';

import 'package:school_sampleproj/widget/Cards/person_detail_card.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar.dart';
import 'package:school_sampleproj/widget/button/gradient_button.dart';
import 'package:school_sampleproj/widget/textbox/multiTextInput.dart';

class MentorResponse extends StatefulWidget {
  static const classname = "/MentorResponse";

  @override
  _MentorResponseState createState() => _MentorResponseState();
}

class _MentorResponseState extends State<MentorResponse> {


  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<MentorResponseProvider>(context);
 provider.carrage=ModalRoute.of(context).settings.arguments;
provider.context=context;
provider.loadData();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBarCommon.getSize(context),
        child: AppBarCommon(
          title: "Mentor Response",
        ),
      ),
      body: Consumer<MentorResponseProvider>(
          builder: (context, value,child) {
          return Column(
            children: [
              PersonDetailCard(name: provider.carrage.mentorRequestModel.addedBy,classname: provider.carrage.mentorRequestModel.hwClass,),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AbsorbPointer(child: MultiLineTextInput(controller: value.message,   m_hintText: "",
                  m_helperText: 'Here is display Teacher Reply',
                  m_labelText: 'Mentor Response',)),
              ),
              SizedBox(height: 10,),
            ],
          );
        }
      ),
    );
  }

  @override
  void initState() {
    final provider=Provider.of<MentorResponseProvider>(context,listen: false);
  provider.state=appstate.defaultstate;

  }
}
