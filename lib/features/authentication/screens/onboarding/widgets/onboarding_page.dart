import 'package:flutter/material.dart';
import 'package:todoist/utils/device/device_utility.dart';

import '../../../../../utils/constants/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
  });
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(HSizes.defaultSpace),
      child: Column(
        children: [
          Container(
            width: HDeviceUtils.getScreenWidth(context) * 0.8,
            height: HDeviceUtils.getScreenHeight(context) * 0.6,
            padding: const EdgeInsets.only(top: 150),
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage(image),
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
