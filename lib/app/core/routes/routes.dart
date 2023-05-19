import 'package:flutter/material.dart';

import '../modules/error/presentation/ui/pages/error_page/error_page.dart';
import '../modules/geremetrika/presentation/ui/pages/home_page/home_page.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
    }
  }
}
