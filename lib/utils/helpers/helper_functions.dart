import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class HHelperFunctions {

  /// get category color based on category name
  static Color getCategoryColor(String category) {
    switch (category) {
      case 'Work':
        return HColors.work;
      case 'Personal':
        return HColors.personal;
      case 'Meeting':
        return HColors.meeting;
      case 'Shopping':
        return HColors.shopping;
      case 'Others':
        return HColors.others;
      default:
        return HColors.others;
    }
  }

  /// shift focus from one text field to another text field
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  /// Dark mode check
  static bool isDarkMode() {
    return Theme.of(Get.context!).brightness == Brightness.dark;
  }

  /// generic toast message imported from toast package , we will utilise this for showing errors or success messages
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: HColors.black,
      textColor: HColors.white,
    );
  }

  static void showAlert(String title, String message, BuildContext? context) {
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// time picker
  static Future<TimeOfDay?> timePicker() async {
    return await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
  }

  /// date picker
  static Future<DateTime?> datePicker() async {
    return await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
  }

  
}
