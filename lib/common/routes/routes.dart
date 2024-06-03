import 'package:flutter/material.dart';
import 'package:todoist/features/todo/screen/home/home_screen.dart';

import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(body: Center(child: Text('No route defined')));
        });
    }
  }
}
