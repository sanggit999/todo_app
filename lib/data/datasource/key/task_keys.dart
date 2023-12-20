import 'package:flutter/foundation.dart';

@immutable
class TaskKey {
  const TaskKey._();

  static const String id = "id";
  static const String title = "title";
  static const String note = "note";
  static const String time = "time";
  static const String date = "date";
  static const String category = "category";
  static const String isCompleted = "isCompleted";
}
