import 'package:flutter/material.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar_teacher.dart';

class TeacherTaskSubjectList extends StatefulWidget {
  static const classname = "/TeacherTaskSubjectList";

  @override
  _TeacherTaskSubjectState createState() => _TeacherTaskSubjectState();
}

class _TeacherTaskSubjectState extends State<TeacherTaskSubjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBarCommonTeacher.getSize(context),
          child: AppBarCommonTeacher(
            title: "Teacher List",
          )),
      body: ListView.builder(itemBuilder: (index, context) {


      }),
    );
  }
}
