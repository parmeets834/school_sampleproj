/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/model/post_model.dart';


import 'mentor_request_model.dart';
import 'mentors_detail_model.dart';
import 'teacher_details_model.dart';



class Carrage{
  StudentDataModel studentData;
  TeacherDetailModel teacherDetailModel;
  PostModel postModel;
  MentorDetailModel mentorDetailModel;
  MentorRequestModel mentorRequestModel;
  dynamic usertype;

  Carrage({this.usertype,this.studentData,this.postModel,this.mentorDetailModel,this.mentorRequestModel, this.teacherDetailModel});
}