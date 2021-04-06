/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:school_sampleproj/model/Carrage.dart';

class ImageViewer extends StatefulWidget {
  static const classname="/ImageViewer";

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    String url=ModalRoute.of(context).settings.arguments;
    return Container(
        child: PhotoView(
      imageProvider: NetworkImage(url),
    ));
    ;
  }
}
