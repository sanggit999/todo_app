import 'package:flutter/material.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/common_container.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/widgets/task_detail.dart';
import 'package:todo_app/widgets/task_title.dart';

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

    final emptyTasks =
        isCompletedTasks ? "Chưa có nhiệm vụ hoàn thành" : "Không có nhiệm vụ";

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(emptyTasks, style: context.textTheme.headlineSmall),
            )
          : ListView.separated(
              itemCount: tasks.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                    onLongPress: () {
                      // Action Todo delete task
                    },
                    onTap: () async {
                      // Action Todo detail task
                      await showModalBottomSheet(
                          enableDrag: true,
                          isDismissible: true,
                          context: context,
                          builder: (context) {
                            return TaskDetail(task: task);
                          });
                    },
                    child: TaskTitle(task: task));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
