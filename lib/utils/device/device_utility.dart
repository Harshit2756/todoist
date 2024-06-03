import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HDeviceUtils {
  // * Orientation and Screen Size

  /// Returns true if the device is in landscape orientation
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// Returns true if the device is in portrait orientation
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// Set the preferred orientations
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Set the app to full screen mode
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// Get the screen height
  static double getScreenHeight(BuildContext? context) {
    return MediaQuery.of(context!).size.height;
  }

  /// Get the screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get the screen size
  static double getPixelRatio(BuildContext? context) {
    return MediaQuery.of(context!).devicePixelRatio;
  }

  /// Get the status bar height
  static double getStatusBarHeight(BuildContext? context) {
    return MediaQuery.of(context!).padding.top;
  }

  /// Get the bottom navigation bar height
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// Get the app bar height
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// Get the keyboard height
  static double getKeyboardHeight(BuildContext? context) {
    final viewInsets = MediaQuery.of(context!).viewInsets;
    return viewInsets.bottom;
  }

  //* Device Information and Features

  /// Returns true if the keyboard is visible
  static Future<bool> isKeyboardVisible(BuildContext? context) async {
    final viewInsets = View.of(context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// Hide the keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Returns true if the device is a physical device
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Returns true if the device is an iOS device
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Returns true if the device is an Android device
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// Vibrate the device for a set duration
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// Returns true if the device is in dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Set Status Bar to hidden
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Set the status bar to visible
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  /// Set the status bar color
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// Check if the device has an internet connection
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Launch a URL
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Function to open the phone dialer
  static void launchPhoneDialer(String phoneNumber) async {
    if (await canLaunchUrlString('tel:$phoneNumber')) {
      await launchUrlString('tel:$phoneNumber');
    } else {
      if (kDebugMode) {
        print('Could not launch phone dialer');
      }
    }
  }

  /// Function to open the email client
  static void launchEmailClient(String email) async {
    if (await canLaunchUrlString('mailto:$email')) {
      await launchUrlString('mailto:$email');
    } else {
      if (kDebugMode) {
        print('Could not launch email client');
      }
    }
  }

  /// Function to open google maps with location pre-filled
  static void launchGoogleMaps(double latitude, double longitude) async {
    if (await canLaunchUrlString(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude')) {
      await launchUrlString(
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    } else {
      if (kDebugMode) {
        print('Could not launch google maps');
      }
    }
  }
}
