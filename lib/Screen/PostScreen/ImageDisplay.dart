/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:school_sampleproj/model/Carrage.dart';

class ImageDisplay extends StatefulWidget {
  static const classname="/ImageDisplay";

  @override
  _ImageDisplayState createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  @override
  Widget build(BuildContext context) {
    String url;

    Carrage carrage=ModalRoute.of(context).settings.arguments;



    return Container(
        child: PhotoView(
      imageProvider: NetworkImage(carrage.postModel.mediaUrl),
    ));
    ;
  }
}
