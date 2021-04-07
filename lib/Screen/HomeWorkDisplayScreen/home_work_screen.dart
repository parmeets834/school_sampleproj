import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:school_sampleproj/Screen/MediaViewers/ImageViewer.dart';
import 'package:school_sampleproj/Screen/MediaViewers/video_player.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/post_model.dart';


class HomeWorkScreen extends StatefulWidget {
  static const classname = "/PostScreen";

  @override
  _HomeWorkScreenState createState() => _HomeWorkScreenState();
}

class _HomeWorkScreenState extends State<HomeWorkScreen> {
  @override
  Widget build(BuildContext context) {
    Carrage carrage=ModalRoute.of(context).settings.arguments;
    PostModel postData=carrage.postModel;

    String convertDateTimeDisplay(String date) {
      final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss');
      final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
      final DateTime displayDate = displayFormater.parse(date);
      final String formatted = serverFormater.format(displayDate);
      return formatted;
    }

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ((){
                  if(postData.mediaUrl!=null && postData.mediaType.toLowerCase()=="image" )
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,ImageViewer.classname,arguments: carrage.postModel.mediaUrl);
                      },
                      child: ConstrainedBox(
                        constraints: new BoxConstraints(
                          maxHeight: 250,

                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              child: Image.network(
                                postData.mediaUrl, // todo update as per login user
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  if(postData.mediaUrl!=null && postData.mediaType.toLowerCase()=="video" )
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,VideoPlayer.classname,arguments: carrage.postModel.mediaUrl);
                      },
                      child: ConstrainedBox(
                        constraints: new BoxConstraints(
                          maxHeight: 250,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              child: Image.asset(
                                "assets/videoPhoto.jpg", // todo update as per login user
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                  else
                    return Container();

                }() ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("${postData.title}",
                      style: TextStyle(color: Colors.black, fontSize: 30)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text("English Hons",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 17)),
                      Spacer(),
                      Text("Date : ${postData.date}",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 17)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                      "${postData.content}",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {}
}
