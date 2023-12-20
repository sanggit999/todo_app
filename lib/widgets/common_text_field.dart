import 'package:flutter/material.dart';

import 'package:todo_app/utils/extensions.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
  });

  final String title;
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const Gap(5),
        TextField(
          readOnly: readOnly,
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          maxLines: maxLines,
          onChanged: (value) {},
        )
      ],
    );
  }
}
