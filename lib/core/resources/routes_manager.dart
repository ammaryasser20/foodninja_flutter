import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/features/home/ui/home_view.dart';
import 'package:foodninja/features/login/logic/cubit/login_cubit.dart';
import 'package:foodninja/features/login/ui/login_view.dart';
import 'package:foodninja/features/navigation_bar/logic/navigation_cubit.dart';
import 'package:foodninja/features/navigation_bar/ui/navigation_bar.dart';
import 'package:foodninja/features/onboarding/ui/onboarding.dart';
import 'package:foodninja/features/sign_up/logic/signup_cubit.dart';
import 'package:foodninja/features/sign_up/ui/sing_up_view.dart';

import 'package:foodninja/features/sign_up/ui/widget/signup_process.dart';
import 'package:foodninja/features/sign_up/ui/widget/signup_success.dart';
import 'package:foodninja/features/splash/view.dart';

class AppRoute {
  static const String splashScreen = "splashScreen";
  static const String login = "login";
  static const String onboarding = "onboarding";
  static const String signUp = "signUp";
  static const String homeScreen = "homeScreen";
  static const String signUpProcess = "signUpProcess";
  static const String signUpSuccess = "signUpSuccess";
  static const String navigationBar = "navigationBar";
}

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoute.login:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const Login(),
              ));
    case AppRoute.onboarding:
      return MaterialPageRoute(builder: (_) => const Onboarding());
    case AppRoute.signUp:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: const SignUpScreen(),
              ));
    case AppRoute.homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    case AppRoute.signUpProcess:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: SignUpProcess(),
              ));
    case AppRoute.signUpSuccess:
      return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
    case AppRoute.navigationBar:
      return MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) =>  getIt<NavigationCubit>(),
                child: const NavigationBarScreen(),
              ));
  }
  return null;
}
