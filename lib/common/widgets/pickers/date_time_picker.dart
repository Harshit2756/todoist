import 'package:flutter/material.dart';
import 'package:todoist/utils/constants/colors.dart';
import 'package:todoist/utils/helpers/helper_functions.dart';
import '../../../utils/constants/sizes.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String title, value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = HHelperFunctions.isDarkMode();
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: HSizes.xs),
          Material(
            color: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                color: isDark ? HColors.darkerGrey : HColors.softGrey,
                borderRadius: BorderRadius.circular(HSizes.buttonRadius),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(HSizes.buttonRadius),
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(HSizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(HSizes.buttonRadius),
                  ),
                  child: Row(
                    children: [
                      Icon(icon),
                      const SizedBox(width: HSizes.xs),
                      Text(value,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
