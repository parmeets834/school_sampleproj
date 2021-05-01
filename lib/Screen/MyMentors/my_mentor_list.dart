

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Screen/Mentor/mentor_request.dart';
import 'package:school_sampleproj/Screen/Mentor/mentor_response.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/student_providers/mentor/mentor_list_provider.dart';
import 'package:school_sampleproj/widget/Cards/person_detail_card.dart';
import 'package:school_sampleproj/widget/Cards/teacher_card.dart';
import 'package:school_sampleproj/widget/Cards/teacher_request_card.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar_student.dart';

class MyMentorList extends StatefulWidget {
  static const classname="/MyMentorList";
  @override
  _MyMentorListState createState() => _MyMentorListState();
}

class _MyMentorListState extends State<MyMentorList> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBarCommonStudent.getSize(context),
        child: AppBarCommonStudent(
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
                          child: TeacherCard(name: "${value.teacherList[index].empName}",color:value.colors[index],
                            subject: "${value.teacherList[index].subj}", ),
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
