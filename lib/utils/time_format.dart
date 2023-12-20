import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeFormat {
  TimeFormat._();

  static String timeFormatString(TimeOfDay time) {
    try {
      final DateTime dateTime = DateTime.now();
      final date = DateTime(
          dateTime.day, dateTime.month, dateTime.year, time.hour, time.minute);
      return DateFormat.jm().format(date);
    } catch (e) {
      return "00:00 AM";
    }
  }
}
