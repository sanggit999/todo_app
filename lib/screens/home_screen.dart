import 'package:flutter/material.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/utils/task_category.dart';
import 'package:todo_app/widgets/display_list_of_task.dart';
import 'package:todo_app/widgets/display_white_text.dart';
import 'package:todo_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final devices = context.deviceSize;

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
                        text: "Ngày 18 Tháng 12 Năm 2023",
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      Gap(20),
                      DisplayWhiteText(
                        text: "Danh Sách Làm Việc",
                        fontSize: 40,
                      )
                    ]),
              ),
            ],
          ),
          Positioned(
              top: 200,
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
                      const DisplayListOfTask(
                        tasks: [
                          Task(
                              title: "title",
                              note: "note",
                              time: "time",
                              date: "date",
                              category: TaskCategory.education,
                              isCompleted: false)
                        ],
                      ),
                      const Gap(20),
                      Text(
                        "Đã hoàn thành ",
                        style: context.textTheme.headlineMedium,
                      ),
                      const Gap(20),
                      const DisplayListOfTask(
                        tasks: [],
                        isCompletedTasks: true,
                      ),
                      const Gap(20),
                      ElevatedButton(
                          onPressed: () {},
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
}
