import 'package:flutter/material.dart';
import 'package:foodninja/presentation/login/login_view/Login_view.dart';
import 'package:foodninja/presentation/onboarding/view/onboarding.dart';
import 'package:foodninja/presentation/sign_up/sign_up_view/sing_up_view.dart';
import 'package:foodninja/presentation/splash/view.dart';

class AppRoute {
  static const String splashScreen = "splashScreen";
  static const String login = "login";
  static const String onboarding = "onboarding";
  static const String signUp = "signUp";
}

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoute.login:
      return MaterialPageRoute(builder: (_) => const Login());
    case AppRoute.onboarding:
      return MaterialPageRoute(builder: (_) =>  const Onboarding());
      case AppRoute.signUp:
      return MaterialPageRoute(builder: (_) =>  const SignUpScreen());
  }
  return null;
}
