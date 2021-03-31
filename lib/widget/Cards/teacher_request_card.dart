import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_sampleproj/model/mentor_request_model.dart';

class TeacherRequestCard extends StatelessWidget {

  MentorRequestModel model;

  TeacherRequestCard({this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      children: [
                        Text("${model.addedBy}",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        Spacer(),
                        Row(
                          children: [
                            (() {
                              if (model.tchReply == "") {
                              return   Icon(Icons.watch_later, color: Colors.black45,
                                  size: 20,
                                );
                              }else{
                               return  Icon(Icons.check, color: Colors.black45,
                                  size: 20,
                                );
                              }
                            }()),
                            SizedBox(width: 3,),
                            (() {
                              if (model.tchReply == "") {
                                return Text("Status: Pending", maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black54),);
                              }
                              if (model.tchReply != "") {
                                return Text("Status: Replied", maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black54),);
                              }
                            }())

                          ],
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Subject: ${model.hwSubject}"),
                  SizedBox(height: 5,),
                  Text(
                    "Message: ${model.hwRemarks==""?"-":model.hwRemarks}",
                    maxLines: 2, overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 5,),
                  Text("Date : ${model.hwDateStr}",
                      style: GoogleFonts.montserrat(fontSize: 12)),
                  SizedBox(height: 5,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
