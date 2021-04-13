/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeProvider extends ChangeNotifier{

  YoutubePlayerController controller ;
 dynamic state=appstate.defaultstate;
  reset(){
    state=appstate.defaultstate;
    controller=null;
  }



  setVideoUrl(String  urlStr){
    if(state!=appstate.defaultstate){
      return;
    }
    state=appstate.laoding_complete;
    String videoId;
    videoId = YoutubePlayer.convertUrlToId(urlStr);
    print(videoId);
    controller  = YoutubePlayerController(
    initialVideoId: videoId,
    flags: YoutubePlayerFlags(
    autoPlay: true,
    mute: false,
    ),
    );
 notifyListeners();
  }



}