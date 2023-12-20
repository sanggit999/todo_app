import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/circle_container.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key, required this.task, this.onCompleted});

  final Task task;
  final Function(bool?)? onCompleted;
  @override
  Widget build(BuildContext context) {
    final texts = context.textTheme;

    final double iconOpacity = task.isCompleted ? 0.3 : 0.9;
    final double backgroundOpacity = task.isCompleted ? 0.1 : 0.5;

    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;

    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(backgroundOpacity),
            child: Icon(
              task.category.icon,
              color: task.category.color.withOpacity(iconOpacity),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,
                    style: texts.titleMedium?.copyWith(
                        decoration: textDecoration,
                        fontSize: 20,
                        fontWeight: fontWeight)),
                Text(
                  task.time,
                  style: texts.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: onCompleted)
        ],
      ),
    );
  }
}
