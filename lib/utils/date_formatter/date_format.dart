
import 'package:intl/intl.dart';

class TimeUtils {
  static String formatToWeekMonthDay(DateTime dateTime) {
    final format = DateFormat.MMMEd().format(dateTime);
    return format;
  }

  static String formatToHour(DateTime dateTime) {
    final format = DateFormat.jm().format(dateTime);
    return format;
  }

  
}