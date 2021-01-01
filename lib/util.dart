import 'package:intl/intl.dart';

class LiteChatUtil {
  static final timeFormat = DateFormat('hh:mm a');
  static final monthAndDateFormat = DateFormat('EEE, MMM d');
  static final monthAndYearFormat = DateFormat('MMM d, ' 'y');

  static String getTimeOrDate(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateTime now = DateTime.now();
    return isSameDay(now, dateTime)
        ? timeFormat.format(dateTime)
        : (isSameYear(now, dateTime)
            ? monthAndDateFormat.format(dateTime)
            : monthAndYearFormat.format(dateTime));
  }

  static bool isSameDay(DateTime dateTimeOne, DateTime dateTimeTwo) {
    return dateTimeOne.day == dateTimeTwo.day &&
        dateTimeOne.month == dateTimeTwo.month &&
        isSameYear(dateTimeOne, dateTimeTwo);
  }

  static bool isSameYear(DateTime dateTimeOne, DateTime dateTimeTwo) {
    return dateTimeOne.year == dateTimeTwo.year;
  }
}
