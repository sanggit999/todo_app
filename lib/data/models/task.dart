// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:todo_app/data/data.dart';

import 'package:todo_app/utils/task_category.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TaskCategory category;
  final bool isCompleted;
  const Task({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.category,
    required this.isCompleted,
  });

  @override
  List<Object> get props {
    return [
      id!,
      title,
      note,
      time,
      date,
      category,
      isCompleted,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKey.id: id,
      TaskKey.title: title,
      TaskKey.note: note,
      TaskKey.time: time,
      TaskKey.date: date,
      TaskKey.category: category.name,
      TaskKey.isCompleted: isCompleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKey.id],
      title: map[TaskKey.title],
      note: map[TaskKey.note],
      time: map[TaskKey.time],
      date: map[TaskKey.date],
      category: TaskCategory.stringToCategory(map[TaskKey.category]),
      isCompleted: map[TaskKey.isCompleted],
    );
  }
}
