import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HFormater {
  /// Assuming a 10-digit US phone number format: (123) 456-7890
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 13) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 8)} ${phoneNumber.substring(8)}';
    }

    return phoneNumber;
  }

  /// Mask the last 4 digits of a phone number with asterisks
  static String maskPhoneNumber(String phoneNumber) {
    String lastFourDigits = phoneNumber.substring(phoneNumber.length - 4);
    String masked = lastFourDigits.padLeft(phoneNumber.length, '*');
    return masked;
  }

  /// Phone Number Input Formatter
  static List<TextInputFormatter> phoneNumberInputFormatter() {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(10),
    ];
  }

  /// Password Input Formatter
  static List<TextInputFormatter> passwordFormatter() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9!@#%^&*.]')),
      LengthLimitingTextInputFormatter(16),
    ];
  }

  /// Name Input Formatter
  static List<TextInputFormatter> nameFormatter() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
      LengthLimitingTextInputFormatter(50),
    ];
  }

  /// Email Input Formatter
  static List<TextInputFormatter> emailFormatter() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
      // LengthLimitingTextInputFormatter(25),
      FilteringTextInputFormatter.singleLineFormatter,
    ];
  }

  /// Address Input Formatter
  static List<TextInputFormatter> addressFormatter() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]')),
      LengthLimitingTextInputFormatter(50),
    ];
  }

  /// Pincode Input Formatter
  static List<TextInputFormatter> pincodeFormatter() {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(6),
    ];
  }

  /// Date Formatter as Saturday , 1 june
  static String formatDateymd(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat.yMd().format(date);
  }

  /// Time Formatter as 12:00 PM
  static String formatTime(TimeOfDay? time) {
    time ??= TimeOfDay.now();
    return time.format(Get.context!);
  }

  /// Date Formatter relative to now as today or 2 days ago tomorrow from String (3/4/2024)
  static String formatRelativeDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('d MMMM').format(dateTime);
  }
}
