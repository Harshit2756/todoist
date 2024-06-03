import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todoist/common/routes/routes_name.dart';

import 'common/bindings/general_bindings.dart';
import 'common/routes/routes.dart';
import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todoist',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
