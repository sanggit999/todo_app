import 'package:hooks_riverpod/hooks_riverpod.dart';

final dateProvider = StateProvider.autoDispose<DateTime>((ref) {
  return DateTime.now();
});
