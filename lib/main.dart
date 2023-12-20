import 'package:flutter/material.dart';
import 'package:todo_app/app/todo_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: TodoApp()));
}
