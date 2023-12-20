import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/data/data.dart';

final taskRepositoriesProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
