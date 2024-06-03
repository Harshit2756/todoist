import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoist/data/repository/todo/todo_repository.dart';
import 'package:todoist/features/todo/model/todo_model.dart';
import 'package:todoist/utils/helpers/helper_functions.dart';

import '../../../common/widgets/popups/full_screen_loader.dart';
import '../../../common/widgets/popups/loaders.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/formatters/formatter.dart';
import '../../../utils/helpers/network_manager.dart';

class TodoController extends GetxController {
  static TodoController get instance => Get.find();

  final RxString startDate = 'dd/mm/yy'.obs;
  final RxString startTime = 'hh : mm'.obs;
  final RxString endDate = 'dd/mm/yy'.obs;
  final RxString endTime = 'hh : mm'.obs;
  final RxString category = ''.obs;
  final _todoRepository = TodoRepository.instance;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  void resetvalues() {
    startDate.value = 'dd/mm/yy';
    startTime.value = 'hh : mm';
    endDate.value = 'dd/mm/yy';
    endTime.value = 'hh : mm';
    category.value = '';
    titleController.clear();
    descriptionController.clear();
  }

  Future<void> setStartDate() async {
    final DateTime? getDate = await HHelperFunctions.datePicker();
    final formatedDate = HFormater.formatDateymd(getDate);
    startDate.value = formatedDate;
  }

  Future<void> setStartTime() async {
    final TimeOfDay? getTime = await HHelperFunctions.timePicker();

    if (getTime != null) {
      final formatedTime = HFormater.formatTime(getTime);
      startTime.value = formatedTime;
    }
  }

  Future<void> setEndDate() async {
    final DateTime? getDate = await HHelperFunctions.datePicker();
    final formatedDate = HFormater.formatDateymd(getDate);
    endDate.value = formatedDate;
  }

  Future<void> setEndTime() async {
    final TimeOfDay? getTime = await HHelperFunctions.timePicker();

    if (getTime != null) {
      final formatedTime = HFormater.formatTime(getTime);
      endTime.value = formatedTime;
    }
  }

  /// Cancel creating new todo
  void cancel() {
    resetvalues();
    Get.back();
  }

  /// Save the todo task
  void createButton() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'We are adding your task....',
        HImages.loadingAnimations,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!formKey.currentState!.validate() ||
          category.value.isEmpty ||
          startDate.value == 'dd/mm/yy' ||
          startTime.value == 'hh : mm' ||
          endDate.value == 'dd/mm/yy' ||
          endTime.value == 'hh : mm') {
        HLoarders.errorSnackBar(
          title: 'Oh Snap!',
          message: 'Please fill all the fields',
        );

        /// Stop Loading
        HFullScreenLoader.stopLoading();
        return;
      }

      // Save Authenticated User Data in Firebase Firestore
      final newTask = TodoModel(
        title: titleController.text,
        description: descriptionController.text,
        startDate: startDate.value == 'dd/mm/yy'
            ? HFormater.formatDateymd(null)
            : startDate.value,
        startTime: startTime.value == 'hh : mm'
            ? HFormater.formatTime(null)
            : startTime.value,
        endDate: endDate.value,
        endTime: endTime.value,
        category: category.value,
        isDone: false,
      );
      await _todoRepository.addNewTask(newTask);

      HFullScreenLoader.stopLoading();

      // close the bottom sheet
      Get.back();

      // Show Success Message
      HLoarders.successSnackBar(
        title: 'Success',
        message: 'Task Added Successfully',
      );
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }

  /// on save button click
}
