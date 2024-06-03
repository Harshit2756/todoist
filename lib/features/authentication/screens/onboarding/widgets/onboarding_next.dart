import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isdark = HHelperFunctions.isDarkMode();
    return Positioned(
      right: HSizes.defaultSpace,
      bottom: HDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          OnBoardingController.instance.nextPage(context);
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            side: const BorderSide(color: HColors.primary),
            backgroundColor: HColors.primary),
        child: Icon(CupertinoIcons.forward,
            color: isdark ? Colors.black : Colors.white),
      ),
    );
  }
}
