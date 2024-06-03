import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoist/features/todo/controller/home_controller.dart';
import 'package:todoist/features/todo/model/todo_model.dart';
import 'package:todoist/utils/formatters/formatter.dart';
import 'package:todoist/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    final categoryColor = HHelperFunctions.getCategoryColor(todo.category);
    final isDark = HHelperFunctions.isDarkMode();
    final controller = HomeController.instance;
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: isDark ? HColors.black : HColors.white,
        borderRadius: BorderRadius.circular(HSizes.borderRadiusLg),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: double.infinity,
            decoration: BoxDecoration(
              color: categoryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(HSizes.borderRadiusLg),
                bottomLeft: Radius.circular(HSizes.borderRadiusLg),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: HSizes.lg + 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: IconButton(
                      icon: const Icon(CupertinoIcons.delete),
                      onPressed: () {
                        controller.deleteTask(todo.docId!);
                      },
                      style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero)),
                    ),
                    title: Text(
                      todo.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            decoration:
                                todo.isDone ? TextDecoration.lineThrough : null,
                            decorationColor: HColors.black,
                            decorationThickness: 3.0,
                          ),
                    ),
                    subtitle: Text(
                      todo.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration:
                                todo.isDone ? TextDecoration.lineThrough : null,
                            decorationColor: HColors.black,
                            decorationThickness: 3.0,
                          ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        activeColor: Colors.blue.shade800,
                        shape: const CircleBorder(),
                        value: todo.isDone,
                        onChanged: (value) {
                          controller.changeStatus(todo.docId!, value!);
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -12),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 1.5,
                          color: HColors.grey.withOpacity(0.5),
                        ),

                        /// Time and Category
                        Row(
                          children: [
                            Text(
                              // HFormater.formatRelativeDate(todo.endDate),
                              todo.endDate,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(width: HSizes.sm),
                            Text(todo.endTime,
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(width: HSizes.sm),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: HSizes.sm, vertical: HSizes.xs),
                              decoration: BoxDecoration(
                                color: categoryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(
                                    HSizes.borderRadiusSm),
                              ),
                              child: Text(todo.category,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
