/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:provider/provider.dart';
import 'file:///D:/Practice%20folder/school_sampleproj/lib/providers/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:school_sampleproj/providers/mediaViewers/video_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoPlayer extends StatefulWidget {
  static const classname = "/VideoPlayer";

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<VideoPlayer> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<VideoProvider>(context);
   // provider.setMediaUrl(ModalRoute.of(context).settings.arguments);
     return Consumer<VideoProvider>(

       builder: (context, value,child) {
         return Scaffold(
           body: WebView(
            initialUrl: ModalRoute.of(context).settings.arguments,
    ),
         );
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
}
