import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class HOutlinedButtonTheme {
  HOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: HSizes.buttonElevation,
      foregroundColor: HColors.dark,
      backgroundColor: HColors.white,
      disabledForegroundColor: HColors.darkGrey,
      disabledBackgroundColor: HColors.buttonDisabled,
      side: const BorderSide(color: HColors.borderPrimary, width: 1.5),
      textStyle: const TextStyle(
          fontSize: 16, color: HColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: HSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: HSizes.buttonElevation,
      foregroundColor: HColors.light,
      backgroundColor: HColors.darkGrey,
      side: const BorderSide(color: HColors.borderPrimary, width: 1.5),
      textStyle: const TextStyle(
          fontSize: 16, color: HColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: HSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HSizes.buttonRadius)),
    ),
  );
}
