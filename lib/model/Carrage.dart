/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:school_sampleproj/model.dart';
import 'package:school_sampleproj/model/post_model.dart';


import 'mentor_request_model.dart';
import 'mentors_detail_model.dart';



class Carrage{
  StudentDataModel userData;
  PostModel postModel;
  MentorDetailModel teacherDetailModel;
  MentorRequestModel mentorRequestModel;
  dynamic usertype;

  Carrage({this.usertype,this.userData,this.postModel,this.teacherDetailModel,this.mentorRequestModel});
}