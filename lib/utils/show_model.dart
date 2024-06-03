import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoist/utils/helpers/helper_functions.dart';

import '../features/todo/controller/todo_controller.dart';
import 'constants/colors.dart';
import 'constants/sizes.dart';
import 'device/device_utility.dart';
import '../common/widgets/pickers/date_time_picker.dart';
import '../common/widgets/radioListTile/radio_widget.dart';
import '../common/widgets/textfield/textfield_widget.dart';

class AddNewTaskModel extends StatelessWidget {
  const AddNewTaskModel({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode();
    final controller = Get.put(TodoController());
    return Container(
      height: HDeviceUtils.getScreenHeight(context) * 0.75,
      padding: const EdgeInsets.symmetric(horizontal: HSizes.defaultSpace),
      decoration: BoxDecoration(
        color: isDark ? HColors.black : HColors.white,
        borderRadius: BorderRadius.circular(HSizes.borderRadiusMd * 2),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("New Task",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            Divider(
                indent: HDeviceUtils.getScreenWidth(context) * 0.2,
                endIndent: HDeviceUtils.getScreenWidth(context) * 0.2,
                thickness: 2,
                color: isDark ? HColors.softGrey : HColors.darkGrey),
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: HSizes.md),
                  //* Title Task
                  Text(
                    "Title Task",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: HSizes.xs),

                  TextFieldWidget(
                    hintText: "Enter Task Title",
                    maxLines: 1,
                    controller: controller.titleController,
                    focusNode: controller.titleFocusNode,
                    inputFormatters: [LengthLimitingTextInputFormatter(25)],
                    nextFocusNode: controller.descriptionFocusNode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: HSizes.md),

                  //* Description
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: HSizes.xs),
                  TextFieldWidget(
                    hintText: "Add Description",
                    maxLines: 6,
                    inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    controller: controller.descriptionController,
                    focusNode: controller.descriptionFocusNode,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: HSizes.md),

                  //* Category
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Category",
                          style: Theme.of(context).textTheme.titleLarge),
                      Wrap(
                        spacing: HSizes.spaceBtwItems / 2,
                        children: [
                          Flexible(
                            child: HRadioWidget(
                              value: 'Work',
                              title: "Work",
                              categoryColor: HColors.work,
                              onChanged: () =>
                                  controller.category.value = 'Work',
                            ),
                          ),
                          Expanded(
                            child: HRadioWidget(
                              value: 'Personal',
                              title: "Personal",
                              categoryColor: HColors.personal,
                              onChanged: () =>
                                  controller.category.value = 'Personal',
                            ),
                          ),
                          Expanded(
                            child: HRadioWidget(
                              value: 'Meeting',
                              title: "Meeting",
                              categoryColor: HColors.meeting,
                              onChanged: () =>
                                  controller.category.value = 'Meeting',
                            ),
                          ),
                          Expanded(
                            child: HRadioWidget(
                              value: 'Shopping',
                              title: "Shopping",
                              categoryColor: HColors.shopping,
                              onChanged: () =>
                                  controller.category.value = 'Shopping',
                            ),
                          ),
                          Expanded(
                            child: HRadioWidget(
                              value: 'Others',
                              title: "Others",
                              categoryColor: HColors.others,
                              onChanged: () =>
                                  controller.category.value = 'Others',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: HSizes.md),
                  // * Start Date and Time Picker
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateTimeWidget(
                        title: "Start Date",
                        value: controller.startDate.value,
                        icon: CupertinoIcons.calendar,
                        onTap: () async {
                          controller.setStartDate();
                        },
                      ),
                      const SizedBox(width: HSizes.md),
                      DateTimeWidget(
                        title: "Start Time",
                        value: controller.startTime.value,
                        icon: CupertinoIcons.time,
                        onTap: () {
                          controller.setStartTime();
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: HSizes.md),

                  // * End Date and Time Picker
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateTimeWidget(
                        title: "End Date",
                        value: controller.endDate.value,
                        icon: CupertinoIcons.calendar,
                        onTap: () {
                          controller.setEndDate();
                        },
                      ),
                      const SizedBox(width: HSizes.md),
                      DateTimeWidget(
                        title: "End Time",
                        value: controller.endTime.value,
                        icon: CupertinoIcons.time,
                        onTap: () async {
                          controller.setEndTime();
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: HSizes.md),

                  // * Button Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            controller.cancel();
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: HSizes.md + 2),
                          ),
                          child: const Text("Cancel"),
                        ),
                      ),
                      const SizedBox(width: HSizes.md),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.createButton();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: HSizes.buttonElevation,
                            backgroundColor: HColors.primary,
                            foregroundColor: HColors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: HSizes.md + 2),
                          ),
                          child: const Text("Create"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
