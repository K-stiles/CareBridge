import 'package:intl/intl.dart';

class DateFormatter {
  static String formatter(DateTime date) {
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
