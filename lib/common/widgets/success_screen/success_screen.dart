import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class HSuccessScreen extends StatelessWidget {
  const HSuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitile,
      this.onPressed});

  final String image, title, subtitile;
  final VoidCallback? onPressed;

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
  ) * 2,
          child: Column(
            children: [
              /// Image
              Lottie.asset(image, width: HHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: HSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: HSizes.spaceBtwItems),

              Text(subtitile,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: HSizes.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(HTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
