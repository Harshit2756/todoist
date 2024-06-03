import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoist/features/todo/controller/home_controller.dart';
import 'package:todoist/features/todo/controller/todo_controller.dart';
import 'package:todoist/utils/constants/colors.dart';
import 'package:todoist/utils/constants/sizes.dart';
import 'package:todoist/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/cards/task_card.dart';
import '../../../../common/widgets/shimmer/shimmer_list.dart';
import '../../../../utils/show_model.dart';
import 'widgets/home_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final isDark = HHelperFunctions.isDarkMode();
    return Scaffold(
      backgroundColor: isDark ? HColors.darkerGrey : HColors.grey,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: HSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(height: HSizes.md),

              /// Today's Tasks and Add Task Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Today's Tasks",
                          style: Theme.of(context).textTheme.headlineSmall),
                      Text(controller.today,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        isDismissible: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: const AddNewTaskModel(),
                          );
                        },
                      ).then((value) {
                        TodoController.instance.resetvalues();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: HSizes.buttonElevation,
                      padding: const EdgeInsets.symmetric(
                          vertical: HSizes.md + 2, horizontal: HSizes.lg),
                    ),
                    child: const Text("+ Add Task"),
                  ),
                ],
              ),

              /// Task Cards
              const SizedBox(height: HSizes.defaultSpace - 4),
              Obx(() {
                return controller.isLoading.value
                    ? const HShimmerList()
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TaskCardWidget(todo: controller.todos[index]);
                        },
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: HSizes.sm),
                        itemCount: controller.todos.length,
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
