import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoist/features/todo/controller/todo_controller.dart';

import '../../../utils/constants/sizes.dart';

class HRadioWidget extends StatelessWidget {
  const HRadioWidget({
    super.key,
    this.focusNode,
    required this.value,
    required this.title,
    required this.onChanged,
    required this.categoryColor,
  });

  final String title;
  final Color categoryColor;
  final String value;
  final FocusNode? focusNode;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final controller = TodoController.instance;
    return Obx(
      () => Container(
        width: 150,
        height: 30,
        margin: const EdgeInsets.only(bottom: HSizes.sm),
        child: RadioListTile(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: categoryColor, width: 2),
            borderRadius: BorderRadius.circular(HSizes.lg),
          ),
          fillColor: WidgetStateProperty.all(categoryColor),
          focusNode: focusNode,
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: const Offset(0, 0),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: categoryColor),
            ),
          ),
          value: value,
          groupValue: controller.category.value,
          onChanged: (newValue) => onChanged(),
        ),
      ),
    );
  }
}
