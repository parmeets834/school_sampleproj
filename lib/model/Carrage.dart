/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/model/post_model.dart';
import 'package:school_sampleproj/model/teacher_detail_model.dart';

import 'mentor_request_model.dart';

class Carrage{
  UserData userData;
  PostModel postModel;
  TeacherDetailModel teacherDetailModel;
  MentorRequestModel mentorRequestModel;
  Carrage({this.userData,this.postModel,this.teacherDetailModel,this.mentorRequestModel});
}