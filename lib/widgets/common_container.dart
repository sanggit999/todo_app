import 'package:flutter/material.dart';
import 'package:todo_app/utils/extensions.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final devices = context.deviceSize;
    return Container(
        width: devices.width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.colorScheme.primaryContainer),
        child: child);
  }
}
