/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'package:dio/dio.dart';
import 'package:school_sampleproj/utils/app_logger.dart';

class CheckDioError {
  String message;
  int errorCode;

  CheckDioError.set({this.message, this.errorCode});

  static check(DioError dioError) {
    AppLogger.print(dioError.toString());
    String message;
    int errcode;
    if (dioError.type == DioErrorType.RESPONSE) {
      final data = dioError.response.data;
      AppLogger.print(data.toString());

      if (dioError.response.statusCode == 400) {
        errcode = 400;
        message = data['error'];
      } else if (dioError.response.statusCode == 401) {
        errcode = 401;
        message = data['error'];
        if (!message.toLowerCase().contains("otp")) {}
      } else if (dioError.response.statusCode == 403) {
        errcode = 403;
        message = "Forbidden";
      } else if (dioError.response.statusCode == 404) {
        errcode = 404;
        message = "Not found";
      } else if (dioError.response.statusCode == 405) {
        errcode = 405;
        message = "Route does not exist";
      } else if (dioError.response.statusCode == 500) {
        errcode = 500;
        message = dioError.message;
      } else {
        message = "Something went wrong";
      }
    } else if (dioError.type == DioErrorType.CONNECT_TIMEOUT) {
      errcode=0;
      message = "connection timedout";
    } else if (dioError.type == DioErrorType.DEFAULT) {
      if (dioError.message.contains('SocketException')) {
        errcode=0;
        message = "no internet";
      }
    }

    AppLogger.print(message);
    CheckDioError chkObject =
        new CheckDioError.set(message: message, errorCode: errcode);
  if(message==null) {
    return null;
  }
    return chkObject;
  }
}
