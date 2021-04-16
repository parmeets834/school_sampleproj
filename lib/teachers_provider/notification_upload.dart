/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_sampleproj/global/constant_function.dart';

class NotificationUploadProvider extends ChangeNotifier{
  TextEditingController controller =new TextEditingController();
  File image;
  var picker = ImagePicker();
  GlobalKey<ScaffoldState> skey;

  reset(){
    picker=null;
  }

   captureImage() async {
     final pickedFile = await picker.getImage(source: ImageSource.camera);
     image = File(pickedFile.path);

  }

   captureGallery() async{
     final pickedFile = await picker.getImage(source: ImageSource.camera);
     image = File(pickedFile.path);
  }

  submit(){
     if(image==null){
       toast(skey,"Image not captured");
     }

  }



}
