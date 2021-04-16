/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/Screen/MediaViewers/ImageViewer.dart';
import 'package:school_sampleproj/Screen/MediaViewers/pdf_view.dart';
import 'package:school_sampleproj/Screen/MediaViewers/video_player.dart';
import 'package:school_sampleproj/Screen/MediaViewers/youtube.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/student_providers/gallery/gallery_providder.dart';
import 'package:school_sampleproj/widget/Cards/gallery_item.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar_student.dart';

class Gallery extends StatefulWidget {
  static const classname = "/Gallery";

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GalleryProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppBarCommonStudent.getSize(context),
          child: AppBarCommonStudent(
            dashbordtext: "Gallery",
            title: "Mentors",
          )),
      body: Consumer<GalleryProvider>(
          builder: (context, value, child) {
            return Container(
              child: ListView.builder(itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (value.galleryList[index].mediaType.toLowerCase() ==
                          "image") {
                        Navigator.pushNamed(context, ImageViewer.classname,
                            arguments: "${webResourceURL}/StudyMaterials/${value
                                .galleryList[index].photoLocation}");
                      } else
                      if (value.galleryList[index].mediaType.toLowerCase() ==
                          "you tube link") {
                        Navigator.pushNamed(context, Youtube.classname,
                            arguments: "${value
                                .galleryList[index].photoLocation}");
                      } else if (value.galleryList[index].mediaType
                          .toLowerCase() == "pdf") {
                        Navigator.pushNamed(context, PdfView.classname,
                            arguments: "${webResourceURL}/StudyMaterials/${value
                                .galleryList[index].photoLocation}");
                      } else {
                        Navigator.pushNamed(context, VideoPlayer.classname,
                            arguments: "${webResourceURL}/StudyMaterials/${value
                                .galleryList[index].photoLocation}");
                      }
                    },
                    child: GalleryItem(model: value.galleryList[index]));
              }, itemCount: value.galleryList.length,
              ),
            );
          }
      ),
    );
  }

  @override
  void initState() {
    final provider = Provider.of<GalleryProvider>(context, listen: false);
    provider.loadData();
  }
}
