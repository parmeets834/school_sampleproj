/*
Developed by newgen flutter intern

 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:school_sampleproj/Api/Api.dart';
import 'package:school_sampleproj/global/constant_function.dart';
import 'package:school_sampleproj/global/constants.dart';
import 'package:school_sampleproj/widget/app_bar/app_bar.dart';
import 'dart:convert' as convert;

import 'package:school_sampleproj/widget/table_sticky_headers_fees.dart';

const evenRows = const Color(0xffE2E2E2);
var _data;
var _titleColumn;
var _titleRow;
final columns = 7;
final rows = 6;
var list_arr = new List();

List<List<String>> _makeData() {
  final List<List<String>> output = [];
  for (int i = 0; i < columns; i++) {
    final List<String> row = [];
    for (int j = 0; j < rows; j++) {
      //row.add('T$i : L$j');
      row.add('-');
    }
    output.add(row);
  }
  return output;
}

/// Simple generator for column title
List<String> _makeTitleColumn() =>
    List.generate(columns, (i) => "-"); //'Top $i'

/// Simple generator for row title
List<String> _makeTitleRow() => List.generate(rows, (i) => "-"); //'Left $i'

class StudentTimeTablePage extends StatefulWidget {
  static const classname = "/StudentTimeTablePage";

  /* StudentTimeTablePage(
      {@required this.data,
        @required this.titleColumn,
        @required this.titleRow});
*/
  List<List<String>> data = _makeData();
  List<String> titleColumn = _makeTitleColumn();
  List<String> titleRow = _makeTitleRow();

  @override
  _StudentTimeTablePageState createState() => _StudentTimeTablePageState();
}

class _StudentTimeTablePageState extends State<StudentTimeTablePage> {
  int selectedRow;
  int selectedColumn;

  @override
  void initState() {
    super.initState();
    print('Fetch to Data:initState');
    //  fetchPost();

    fetchPost().then((result) {
      // If we need to rebuild the widget with the resulting data,
      // make sure to use `setState`
      setState(() {
        widget.data = _data;
        widget.titleColumn = _titleColumn;
        widget.titleRow = _titleRow;
      });
    });
    print('Fetch to Data:initState after fetchPost');
  }

  Color getContentColor(int i, int j) {
    if (i == selectedRow && j == selectedColumn) {
      return Colors.amber;
    } else if (i == selectedRow || j == selectedColumn) {
      return Colors.amberAccent;
    } else {
      if (j == 0 || j == 2 || j == 4) {
        return evenRows;
      } else {
        return Colors.transparent;
      }
    }
  }

  void clearState() => setState(() {
        selectedRow = null;
        selectedColumn = null;
      });

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: AppBarCommon.getSize(context),
              child: AppBarCommon(title: "My Task")),
          body: StickyHeadersTable(
            columnsLength: widget.titleColumn.length,
            rowsLength: widget.titleRow.length,
            columnsTitleBuilder: (i) => FlatButton(
              child: Text(widget.titleColumn[i]),
              color: ThemeData().primaryColor,
              textColor: Colors.white,
              onPressed: clearState,
            ),
            rowsTitleBuilder: (i) => InkWell(
              child: Container(
                  color: Colors.transparent,
                  child: Text(
                    widget.titleRow[i],
                    style: TextStyle(color: Colors.white),
                  )),
              onTap: clearState,
            ),
            contentCellBuilder: (i, j) => FlatButton(
              child: Text(widget.data[i][j]),
              color: getContentColor(i, j),
              onPressed: () => setState(() {
                selectedColumn = j;
                selectedRow = i;
                //  showDialogA(context, j,widget.data[i][j]+" "+ i.toString()+" Here " );
              }),
            ),
            legendCell: FlatButton(
              child: Text('-'),
              onPressed: clearState,
              color: ThemeData().primaryColor,
              textColor: Colors.white,
            ),
          ),
        ),
      );
}

Future fetchPost() async {
  _data = _makeData();

  _titleRow = [
    "Mon.",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];
  _titleColumn = ["1", "2", "3", "4", "5", "6", "7"];

  Response rep = await StudentApi().getTimeTabel(currunt_user);
  String Respstring = rep.data.toString();

  Respstring = Respstring.substring(0, Respstring.indexOf("||JasonEnd", 0));
  var jsonResponse = convert.jsonDecode(Respstring);
  list_arr = jsonResponse;

  final List<List<String>> output = [];
  for (int i = 0; i < columns; i++) {
    final List<String> row = [];
    for (int j = 0; j < rows; j++) {
      row.add(list_arr[j]["Col" + (i + 1).toString()]);
      // row.add(list_arr[j]["Col"+i.toString()] +j.toString()+","+i.toString());
    }
    output.add(row);
  }

  _data = output;

  print('Fetch to Data:after fetchPost Function');
}

void showDialogA(BuildContext context, int ndx, String SeleKey) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Selected Key " + SeleKey),
        content: new Text("Selected Index " + ndx.toString()),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Okay',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
            color: Colors.red,
            onPressed: () {
              //Navigator.of(context).pop();
              //Navigator.pop(context);
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel!',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          )
        ],
      );
    },
  );
}
