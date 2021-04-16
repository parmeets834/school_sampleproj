/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/teachers_provider/notification_upload.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar_teacher.dart';
import 'package:school_sampleproj/widget/button/gradient_button.dart';
import 'package:school_sampleproj/widget/circle_avatar/round_image.dart';
import 'package:school_sampleproj/widget/textbox/multiTextInput.dart';

class NotificationUpload extends StatefulWidget {
  static const classname="/NotificationUpload";

  @override
  _NotificationUploadState createState() => _NotificationUploadState();
}

class _NotificationUploadState extends State<NotificationUpload> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBarCommonTeacher.getSize(context),
          child: AppBarCommonTeacher(
            title: "NotificationTeacher",
          )),
      body: Consumer<NotificationUploadProvider>(

        builder: (context, value,child) {
          return Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundImage(
                    icon: Icons.camera_alt,
                    text: "Camera",
                    onTap: () {value.captureImage();},
                  ),
                  RoundImage(
                    icon: Icons.image_outlined,
                    text: "Gallery",
                    onTap: () {},
                  ),
                ],
              ),
              Divider(thickness: 1,),
             SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MultiLineTextInput(m_hintText:"Type Message", m_helperText:"", m_labelText:"Enter Notification Message Here",controller:value.controller ),
              ),
              GradientButton(onpress: (){},text: "Submit",width: MediaQuery.of(context).size.width*0.40,height: MediaQuery.of(context).size.height*0.06,)
            ],
          );
        }
      ),
    );;
  }

  @override
  void initState() {
    final provider=Provider.of<NotificationUploadProvider>(context,listen: false);
    provider.skey=new GlobalKey<ScaffoldState>();
    provider.reset();
  }
}
