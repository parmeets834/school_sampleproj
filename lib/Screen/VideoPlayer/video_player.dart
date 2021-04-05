/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:provider/provider.dart';
import 'file:///D:/Practice%20folder/school_sampleproj/lib/providers/video_player.dart';
import 'vlc_player_with_controls.dart';

class VideoPlayer extends StatefulWidget {
  static const classname = "/VideoPlayer";

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  GlobalKey _key = GlobalKey<VlcPlayerWithControlsState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VideoPlayerProvider>(context);


    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
      child:  Container(
        height: MediaQuery.of(context).size.width,
        width:MediaQuery.of(context).size.width*1.5,        child: VlcPlayerWithControls(key:_key, controller: provider.videoPlayerController),
      ),
    ));
  }

  @override
  void initState() {
    final provider = Provider.of<VideoPlayerProvider>(context, listen: false);
    provider.videoPlayerController = VlcPlayerController.network(
      'http://techslides.com/demos/sample-videos/small.mp4',
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }
}
