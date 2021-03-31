import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:school_sampleproj/Screen/Mentor/mentor_list.dart';
import 'package:school_sampleproj/Screen/PostScreen/PostScren.dart';

import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/providers/mentor/mentor_provider.dart';
import 'package:school_sampleproj/widget/Cards/add_card.dart';
import 'package:school_sampleproj/widget/Cards/task_item.dart';
import 'package:school_sampleproj/widget/Cards/teacher_request_card.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar.dart';

import 'mentor_request.dart';
import 'mentor_response.dart';

class Mentor extends StatefulWidget {
  static const classname = "/Mentor";

  @override
  _MentorState createState() => _MentorState();
}

class _MentorState extends State<Mentor> {


  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBarCommon.getSize(context),
          child: AppBarCommon(
            title: "Mentors",
          )),
      body: Consumer<MentorProvider>(builder: (context, value, child) {
        return Stack(
          children: [
            AddCard(
              text: "Click to Add New Request",
              onClick: () { Navigator.pushNamed(context, MentorList.classname);},
            ),
            ((){
              if(value.state==appstate.loading){
                return Container(child: Center(child: CircularProgressIndicator(),),);
              }else if(value.state==appstate.laoding_complete){
                return    Container(
                  padding: EdgeInsets.only(top:100),
                  child: ListView.builder(
                    itemBuilder: (_, index) => InkWell(
                      child: InkWell(
                        onTap:()=> Navigator.pushNamed(context, MentorResponse.classname,arguments: Carrage(mentorRequestModel: value.mentorRequestList[index])),
                        child: TeacherRequestCard(model: value.mentorRequestList[index],),
                      ),
                    ),

                    itemCount: value.mentorRequestList.length,
                  ),
                );
              }
            }())
            // custom card
          ],
        );
      }),
  /*    floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text('Add New Request'),
          icon: const Icon(Icons.add),
          backgroundColor:ThemeData().primaryColor,
        ),
      ),*/
    );

  }

  @override
  void initState() {
    final provider=Provider.of<MentorProvider>(context,listen:  false);
    provider.loadData();
  }
}
