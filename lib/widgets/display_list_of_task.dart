import 'package:flutter/material.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/common_container.dart';
import 'package:gap/gap.dart';

class DisplayListOfTask extends StatelessWidget {
  const DisplayListOfTask(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context) {
    final height = isCompletedTasks
        ? context.deviceSize.height * 0.25
        : context.deviceSize.height * 0.3;

    final emptyTasks = isCompletedTasks
        ? "Chưa có nhiệm vụ hoàn thành."
        : "Không có nhiệm vụ.";

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(emptyTasks, style: context.textTheme.headlineSmall),
            )
          : ListView.builder(
              itemCount: tasks.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: task.category.color.withOpacity(0.3),
                          border:
                              Border.all(width: 2, color: task.category.color)),
                      child: Center(
                        child: Icon(
                          task.category.icon,
                          color: task.category.color,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(task.time),
                          Text(task.time),
                        ],
                      ),
                    ),
                    Checkbox(value: task.isCompleted, onChanged: (value) {})
                  ],
                );
              }),
    );
  }
}
