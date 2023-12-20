import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';

class AppAler {
  AppAler._();

  static Future<void> showDeleteAlerDialog(
      BuildContext context, WidgetRef ref, Task task) async {
    Widget cancelButton = TextButton(
        onPressed: () {
          context.pop();
        },
        child: const Text("Huỷ"));
    Widget okButton = TextButton(
        onPressed: () async {
          await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
            Fluttertoast.showToast(
                msg: "Xoá thành công.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: context.colorScheme.surface,
                textColor: Colors.black,
                fontSize: 16.0);
            context.pop();
          });
        },
        child: const Text("Xoá"));

    AlertDialog alertDialog = AlertDialog(
      title: const Text("Bạn có muốn xoá nhiệm vụ ? "),
      actions: [okButton, cancelButton],
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}
