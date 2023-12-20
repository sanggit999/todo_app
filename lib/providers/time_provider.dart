import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final timeProvider = StateProvider.autoDispose<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
