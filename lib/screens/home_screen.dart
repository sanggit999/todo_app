import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/routes/route_location.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/widgets/display_list_of_task.dart';
import 'package:todo_app/widgets/display_white_text.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final devices = context.deviceSize;

    final taskState = ref.watch(taskProvider);
    final incompletedTasks = _incompletedTasks(taskState.tasks);
    final completedTasks = _completedTasks(taskState.tasks);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: devices.width,
                height: devices.height * 0.3,
                color: colors.primary,
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(
                        text: "Danh Sách Làm Việc",
                        fontSize: 40,
                      )
                    ]),
              ),
            ],
          ),
          Positioned(
              top: 150,
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DisplayListOfTask(
                        tasks: incompletedTasks,
                      ),
                      const Gap(20),
                      Text(
                        "Đã hoàn thành ",
                        style: context.textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Gap(20),
                      DisplayListOfTask(
                        tasks: completedTasks,
                        isCompletedTasks: true,
                      ),
                      const Gap(20),
                      ElevatedButton(
                          onPressed: () {
                            context.push(RouteLocation.createTask);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: DisplayWhiteText(
                              text: "Thêm nhiệm vụ mới",
                              fontSize: 18,
                            ),
                          ))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  List<Task> _incompletedTasks(List<Task> tasks) {
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      if (!task.isCompleted) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }

  List<Task> _completedTasks(List<Task> tasks) {
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }
}
