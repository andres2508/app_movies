import 'package:intl/intl.dart';

class TMDBDateUtils {
  static final String SHORT_FORMAT = "yyyy-MM-dd";

  static String shortFormat(DateTime date) {
    var format = DateFormat(SHORT_FORMAT);
    return format.format(date);
  }
}
