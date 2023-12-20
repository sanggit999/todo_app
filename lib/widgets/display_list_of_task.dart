import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/app_alert.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';

class DisplayListOfTask extends HookConsumerWidget {
  const DisplayListOfTask(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      AppAler.showDeleteAlerDialog(context, ref, task);
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
                    child: TaskTitle(
                      task: task,
                      onCompleted: (value) async {
                        await ref
                            .read(taskProvider.notifier)
                            .updateTask(task)
                            .then((value) {
                          Fluttertoast.showToast(
                              msg: task.isCompleted
                                  ? "Nhiệm vụ chưa hoàn thành. "
                                  : "Nhiệm vụ đã hoàn thành.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: context.colorScheme.surface,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        });
                      },
                    ));
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
