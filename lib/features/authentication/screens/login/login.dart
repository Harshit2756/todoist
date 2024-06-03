import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/form_divider.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import 'widgets/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: HSizes.appBarHeight,
            left: HSizes.defaultSpace,
            right: HSizes.defaultSpace,
            bottom: HSizes.defaultSpace,
          ),
          child: Column(
            children: [
              /// Logo , Title and Subtitle
              const HLoginHeader(),

              /// Form
              const HLoginForm(),

              /// Divider
              HFormDivider(dividerText: HTexts.orSignInWith.capitalize!),

              const SizedBox(height: HSizes.spaceBtwSections),

              /// Footer
              const HSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
