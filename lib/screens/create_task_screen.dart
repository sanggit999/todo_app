import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/data.dart';

import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/routes/route_location.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateTaskScreen extends StatefulHookConsumerWidget {
  const CreateTaskScreen({super.key});
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const DisplayWhiteText(text: "Thêm nhiệm vụ mới"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: "Tiêu đề",
                hintText: 'Nhập tiêu đề nhiệm vụ.',
                controller: _titleController,
              ),
              const Gap(15),
              const SelectCategory(),
              const Gap(15),
              const SelectDateTime(),
              const Gap(15),
              CommonTextField(
                title: 'Ghi chú',
                hintText: "ABC...",
                maxLines: 6,
                controller: _noteController,
              ),
              const Gap(20),
              ElevatedButton(
                  onPressed: _createTask,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DisplayWhiteText(
                      text: "Thêm nhiệm vụ",
                      fontSize: 18,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final category = ref.watch(categoryProvider);
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);

    if (title.isNotEmpty) {
      final task = Task(
          title: title,
          note: note,
          time: TimeFormat.timeFormatString(time),
          date: DateFormat("dd/MM/yyyy").format(date),
          category: category,
          isCompleted: false);

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        Fluttertoast.showToast(
            msg: "Thêm thành công.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: context.colorScheme.surface,
            textColor: Colors.black,
            fontSize: 16.0);
        context.go(RouteLocation.home);
      });
    } else {
      Fluttertoast.showToast(
          msg: "Vui lòng không để trống.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: context.colorScheme.surface,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}
