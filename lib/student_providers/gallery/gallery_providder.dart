/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/gallery_item_model.dart';
import 'package:school_sampleproj/widget/Cards/gallery_item.dart';

class GalleryProvider extends ChangeNotifier {
  List<GallaryItemModel> galleryList;

  void loadData() async{
    galleryList=[];

    Response resp = await StudentApi().getGalleryContent(currunt_user);
       String str=refineString(resp.data);
    List<dynamic> ls=  jsonDecode(str);

    for(dynamic item in ls){
      galleryList.add(GallaryItemModel.fromJson(item));
    }
notifyListeners();

  }
}
