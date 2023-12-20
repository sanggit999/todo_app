import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/utils/utils.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategory>((ref) {
  return TaskCategory.education;
});
