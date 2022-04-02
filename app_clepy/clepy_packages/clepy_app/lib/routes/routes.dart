import 'package:clepy_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_module/screens/login_screen.dart';

class Routes {
  static Route<dynamic> launchRoutes(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'splash',
          ),
          builder: (_) => SplashScreen(),
        );
      case 'login':
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'splash',
          ),
          builder: (_) => LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'splash',
          ),
          builder: (_) => SplashScreen(),
        );
    }
  }
}
