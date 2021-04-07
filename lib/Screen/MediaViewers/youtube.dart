/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_sampleproj/providers/mediaViewers/youtube_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  static const String classname="/Youtube";
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {


  @override
  Widget build(BuildContext context) {
  final provider=Provider.of<YoutubeProvider>(context);
  provider.setVideoUrl(ModalRoute.of(context).settings.arguments);
    return Consumer<YoutubeProvider>(
      builder: (context, value,child) {
        return Container(child: Center(child: YoutubePlayer(
          controller: value.controller,
          showVideoProgressIndicator: true,
          onReady: () {
            provider.controller.addListener(listener);
        },
        )),);
      }
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await   SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void listener() {
  }
}
