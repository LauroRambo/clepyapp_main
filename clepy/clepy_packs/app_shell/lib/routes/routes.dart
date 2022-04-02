import 'package:app_shell/screen/home_app.dart';
import 'package:flutter/material.dart';
import 'package:landing_module/landing_module.dart';
import 'package:login_module/login_module.dart';
import 'package:login_module/screens/login_screen.dart';
import 'package:product_screen/product_screen.dart';


class Routes {
  static Route<dynamic> launchRoutes(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'onboarding',
          ),
          builder: (_) => HomeApp(),
        );

      case 'onboarding':
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'onboarding',
          ),
          builder: (_) => OnBoardingScreen(),
        );
      case 'login':
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'login',
          ),
          builder: (_) => LoginScreen(),
        );
      case 'singin':
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'singin',
          ),
          builder: (_) => NewUserScreen(),
        );
      case 'details':
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'details',
          ),
          builder: (_) => DetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: 'home',
          ),
          builder: (_) => HomeApp(),
        );
    }
  }
}
