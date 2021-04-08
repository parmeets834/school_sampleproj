/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfView extends StatefulWidget {
  static const String classname="/PdfView";
  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("PDF")),
    body: SfPdfViewer.network(

      ModalRoute.of(context).settings.arguments,
      key: _pdfViewerKey,
      //controller:controller, is ued to jump page
     ),
  );


  }
}
