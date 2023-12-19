import 'package:flutter/material.dart';
import 'package:todo_app/widgets/display_white_text.dart';
import 'package:go_router/go_router.dart';

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
    );
  }
}
