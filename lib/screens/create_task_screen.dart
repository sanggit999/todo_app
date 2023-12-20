import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/widgets/widgets.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
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
              const CommonTextField(
                title: "Tiêu đề",
                hintText: 'Nhập tiêu đề nhiệm vụ.',
              ),
              const Gap(15),
              const SelectCategory(),
              const Gap(15),
              const SelectDateTime(),
              const Gap(15),
              const CommonTextField(
                title: 'Ghi chú',
                hintText: "ABC...",
                maxLines: 6,
              ),
              const Gap(20),
              ElevatedButton(
                  onPressed: () {},
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
}
