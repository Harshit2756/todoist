import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class HRadioTheme {
  HRadioTheme._();

  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        return HColors.grey;
      },
    ),
  );

  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        return HColors.darkerGrey;
      },
    ),
  );
}
