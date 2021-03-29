

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherRequestCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
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
                    padding: const EdgeInsets.only(right:10.0),
                    child: Row(
                      children: [
                        Text("Teacher Name",style: TextStyle(fontWeight: FontWeight.bold),),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.watch_later,color: Colors.black45,
                              size: 20,
                            ),
                            SizedBox(width: 3,),
                            Text("Status: Pending",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black54),),
                          ],
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("Subject: Punjabi"),
                  SizedBox(height: 5,),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                   maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 5,),
                  Text("Date : 22/09/2021",style: GoogleFonts.montserrat(fontSize: 12)),
                  SizedBox(height: 5,),

                ],
              ),
            )
          ],
        ),
      ),
    );;
  }
}
