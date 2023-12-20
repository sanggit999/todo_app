import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/data/data.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
