/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogUtil {
  BuildContext context;
  String message;
  String title;
  String buttontext;

  DialogUtil({this.context, this.message, this.title, this.buttontext="Ok"});

  showErrorDialog() {
    Alert(
      context: context,
      type: AlertType.error,

      title: title,
      desc: message,
      buttons: [
        DialogButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text(
            buttontext,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          /*    onPressed: () => _onCustomAnimationAlertPressed(context),*/
          width: 120,
        )
      ],
    ).show();
  }

  showSuccessDialog() {
    Alert(
      context: context,
      type: AlertType.success,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text(
            buttontext,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          /*    onPressed: () => _onCustomAnimationAlertPressed(context),*/
          width: 120,
        )
      ],
    ).show();
  }
}
