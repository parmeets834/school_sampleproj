import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/model/Carrage.dart';
import 'package:school_sampleproj/model/post_model.dart';

import 'ImageDisplay.dart';

class PostScreen extends StatefulWidget {
  static const classname = "/PostScreen";

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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
                  if(postData.image!=null )
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,ImageDisplay.classname,arguments: carrage);
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
                                postData.image, // todo update as per login user
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
         /*       Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text("-- Author is : Person Name",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 17)),
                      Spacer(),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {}
}
