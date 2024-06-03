import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoist/features/todo/controller/user_controller.dart';

import '../../../../../data/repository/authentication/authentication_repository.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final isDark = HHelperFunctions.isDarkMode();

    return AppBar(
      backgroundColor: isDark ? HColors.black : HColors.white,
      foregroundColor: isDark ? HColors.white : HColors.black,
      elevation: 5,
      surfaceTintColor: isDark ? HColors.grey : HColors.grey,
      title: ListTile(
        leading: CircleAvatar(
          backgroundColor: isDark ? HColors.darkGrey : HColors.white,
          radius: HSizes.lg,
          child: Image.asset(
            HImages.userAvatar,
            fit: BoxFit.contain,
          ),
        ),
        title: Obx(
          () => Text("Hello, ${controller.user.value.firstName}",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        subtitle: Text("Welcome to Todoist!",
            style: Theme.of(context).textTheme.bodySmall),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {
            showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(50.0, 70.0, 0.0,
                  0.0), // position where you want to show the menu
              items: [
                PopupMenuItem(
                  padding: const EdgeInsets.all(0),
                  height: 20,
                  child: TextButton(
                    child: const Text('Logout'),
                    onPressed: () {
                      AuthenticatorRepository.instance.logout();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
