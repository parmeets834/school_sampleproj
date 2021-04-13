/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/model/post_model.dart';


import 'mentor_request_model.dart';
import 'mentors_detail_model.dart';

enum otp_user_type{student, admin,parent }

class Carrage{
  StudentDataModel userData;
  PostModel postModel;
  MentorDetailModel teacherDetailModel;
  MentorRequestModel mentorRequestModel;
  dynamic otpuserType;

  Carrage({this.otpuserType,this.userData,this.postModel,this.teacherDetailModel,this.mentorRequestModel});
}