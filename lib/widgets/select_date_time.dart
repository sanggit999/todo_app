import 'package:flutter/material.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends HookConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
            child: CommonTextField(
          readOnly: true,
          title: "Ngày",
          hintText: DateFormat('dd/MM/yyyy').format(date),
          suffixIcon: IconButton(
              onPressed: () {
                _selectDate(context, ref);
              },
              icon: const FaIcon(FontAwesomeIcons.calendar)),
        )),
        const Gap(5),
        Expanded(
            child: CommonTextField(
          readOnly: true,
          title: "Thời gian",
          hintText: TimeFormat.timeFormatString(time),
          suffixIcon: IconButton(
            onPressed: () {
              _selectTime(context, ref);
            },
            icon: const FaIcon(FontAwesomeIcons.clock),
          ),
        )),
      ],
    );
  }

  void _selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
    print(pickedDate);
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    final initinalTime = ref.read(timeProvider);
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: initinalTime);
    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
    print(pickedTime);
  }
}
