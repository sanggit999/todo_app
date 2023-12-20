import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/widgets/widgets.dart';

class SelectCategory extends HookConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategory.values.toList();
    return SizedBox(
      height: 60,
      child: Row(children: [
        Text(
          "Mục",
          style: context.textTheme.titleLarge,
        ),
        const Gap(20),
        Expanded(
            child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CircleContainer(
              color: category.color.withOpacity(0.3),
              child: InkWell(
                onTap: () {
                  ref.read(categoryProvider.notifier).state = category;
                },
                borderRadius: BorderRadius.circular(30),
                child: Icon(
                  category.icon,
                  color: category == selectedCategory
                      ? context.colorScheme.primary
                      : category.color,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Gap(20);
          },
        ))
      ]),
    );
  }
}
