import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: const Icon(CupertinoIcons.clear),
              onPressed: () => Get.back()),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
    top: HSizes.appBarHeight,
    left: HSizes.defaultSpace,
    right: HSizes.defaultSpace,
    bottom: HSizes.defaultSpace,
  ) * 2,
          child: Column(
            children: [
              /// Image
              Image.asset(
                HImages.deliveredEmailIllustration,
                width: HHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: HSizes.spaceBtwSections),

              ///Email, Title & Subtitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                HTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: HSizes.spaceBtwItems),

              Text(
                HTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: HSizes.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(HTexts.done),
                ),
              ),

              const SizedBox(height: HSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendResetPasswordResetEmail(email),
                  child: const Text(HTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
