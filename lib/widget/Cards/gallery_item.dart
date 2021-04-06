import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_sampleproj/model/gallery_item_model.dart';
import 'package:school_sampleproj/model/mentor_request_model.dart';

class GalleryItem extends StatelessWidget {
  GallaryItemModel model;

  GalleryItem({this.model});

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
                        Text(
                          "${model.addedBy}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            (() {
                              return getPictureByType(model.mediaType);
                            }()),
                            SizedBox(
                              width: 3,
                            ),
                            (() {
                              return Text(
                                "Media: ${model.mediaType}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black54),
                              );
                            }())
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Subject: ${model.hwSubject}"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Message: ${model.hwRemarks == "" ? "-" : model.hwRemarks}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Date : ${model.hwDateStr}",
                      style: GoogleFonts.montserrat(fontSize: 12)),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPictureByType(String mediaType) {


    if (mediaType.toLowerCase()=="image") {
      return SvgPicture.asset(
        "assets/gallery.svg",
        width: 20,
        height: 20,
      );
    } else if (mediaType.toLowerCase()=="video") {
      return SvgPicture.asset(
        "assets/multimedia.svg",
        width: 20,
        height: 20,
      );
    } else if (mediaType.toLowerCase()=="pdf") {
      return SvgPicture.asset(
        "assets/pdf.svg",
        width: 20,
        height: 20,
      );
    } else {
      return SvgPicture.asset(
        "assets/document.svg",
        width: 20,
        height: 20,
      );
    }
  }
}
