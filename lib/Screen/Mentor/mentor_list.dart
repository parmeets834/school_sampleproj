

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Screen/Mentor/mentor_response.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/providers/mentor/mentor_list_provider.dart';
import 'package:school_sampleproj/widget/Cards/person_detail_card.dart';
import 'package:school_sampleproj/widget/Cards/teacher_card.dart';
import 'package:school_sampleproj/widget/Cards/teacher_request_card.dart';

import 'package:school_sampleproj/widget/app_bar/app_bar.dart';

import 'mentor_request.dart';

class MentorList extends StatefulWidget {
  static const classname="/MentorList";
  @override
  _MentorListState createState() => _MentorListState();
}

class _MentorListState extends State<MentorList> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBarCommon.getSize(context),
        child: AppBarCommon(
          title: "Mentor List",
        ),
      ),
      body: Consumer<MentorListProvider>(
        builder: (context, value,child) {
          return ((){
            if(value.state==appstate.laoding_complete)
             return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) => InkWell(
                        child: InkWell(
                          onTap:()=> Navigator.pushNamed(context, MentorRequest.classname,arguments: Carrage(teacherDetailModel:value.teacherList[index])),
                          child: TeacherCard(name: "Teacher name ${value.teacherList[index].empName}",
                            subject: "Subject: ${value.teacherList[index].subj}", ),
                        ),
                      ),
                      itemCount: value.teacherList.length,
                    ),
                  ),
                ],
              );
            else if(value.state!=appstate.laoding_complete)
              return Container(child: Center(child: CircularProgressIndicator(),),);

          }());
        }
      ),
    );
  }

  @override
  void initState() {
    final provider=Provider.of<MentorListProvider>(context,listen: false);
 provider.state=appstate.defaultstate;
 provider.loadData();
  }
}
