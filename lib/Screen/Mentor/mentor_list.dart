

import 'package:flutter/material.dart';
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
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => InkWell(
                child: InkWell(
                  onTap:()=> Navigator.pushNamed(context, MentorRequest.classname),
                  child: TeacherCard(name: "Teacher name ${index}",subject: "Subject: Hindi", ),
                ),
              ),
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
