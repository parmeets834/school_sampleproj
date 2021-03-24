import 'package:intl/intl.dart';

getDateStringFromDate(DateTime dateTime) {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
 return dateFormat.format(dateTime);
}
