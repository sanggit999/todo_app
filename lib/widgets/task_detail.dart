import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.task});

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        CircleContainer(
          color: task.category.color.withOpacity(0.3),
          child: Icon(
            task.category.icon,
            color: task.category.color,
          ),
        ),
        const Gap(15),
        Text(task.title,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        Text(task.time, style: context.textTheme.titleMedium),
        const Gap(16),
        Visibility(
            child: Column(
          children: [
            Text(
              "Nhiệm vụ sẽ hoàn thành vào",
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 14, color: Colors.black),
            ),
            Text(
              task.date,
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        )),
        const Gap(15),
        Divider(
          thickness: 1,
          color: task.category.color,
        ),
        const Gap(15),
        Text(task.note.isEmpty ? "Không có ghi chú ở nhiệm vụ này" : task.note),
        const Gap(15),
        Visibility(
            visible: task.isCompleted,
            child: Column(children: [
              Divider(
                thickness: 1,
                color: task.category.color,
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nhiệm vụ đã hoàn thành",
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 18, color: Colors.black),
                  ),
                  const Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )
                ],
              ),
            ])),
      ]),
    );
  }
}
