import 'package:flutter/material.dart';

class HColors {
  // App theme colors
  static const Color primary = Color(0xFF3F9BE3);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = HColors.white.withOpacity(0.1);

  // Transparent colors
  static const Color transparent = Colors.transparent;

  // Button colors
  static const Color buttonPrimary = Color(0xFFD5E8FA);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  static const Color foreground = Color.fromARGB(255, 6, 139, 249);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static Color error = Colors.red.shade600;
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // Category colors
  static const Color work = Color(0xFF3F9BE3);
  static const Color personal = Color(0xFFFFE24B);
  static const Color meeting = Color.fromARGB(255, 255, 213, 74);
  static const Color shopping = Color.fromARGB(255, 252, 97, 97);
  static const Color others = Color.fromARGB(255, 90, 252, 198);
}
