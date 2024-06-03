import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.inputFormatters,
    this.maxLines = 1,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.nextFocusNode,
  });
  final int maxLines;
  final String hintText;
  final bool isObscureText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode();

    return TextFormField(
      maxLines: maxLines,
      focusNode: focusNode,
      validator: validator,
      controller: controller,
      obscuringCharacter: '*',
      keyboardType: keyboardType,
      obscureText: isObscureText,
      onFieldSubmitted: (_) => nextFocusNode != null && focusNode != null
          ? HHelperFunctions.fieldFocusChange(
              context, focusNode!, nextFocusNode!)
          : null,
      cursorColor: HColors.primary,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? HColors.darkerGrey : HColors.softGrey,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
