import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/buy/ui/widget/choose_payment_way.dart';
import 'package:foodninja/features/buy/ui/widget/confirm_order.dart';
import 'package:foodninja/features/chat/logic/cubit/chat_cubit.dart';
import 'package:foodninja/features/chat/ui/widget/chat.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/home/ui/home_view.dart';
import 'package:foodninja/features/home/ui/widget/explore_menus.dart';
import 'package:foodninja/features/home/ui/widget/explore_restaurant.dart';
import 'package:foodninja/features/login/logic/cubit/login_cubit.dart';
import 'package:foodninja/features/login/ui/login_view.dart';
import 'package:foodninja/features/navigation_bar/logic/navigation_cubit.dart';
import 'package:foodninja/features/navigation_bar/ui/navigation_bar.dart';
import 'package:foodninja/features/onboarding/logic/onboarding_cubit.dart';
import 'package:foodninja/features/onboarding/ui/onboarding.dart';
import 'package:foodninja/features/search/logic/cubit/search_cubit.dart';
import 'package:foodninja/features/search/ui/search_view.dart';
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
  static const String exploreAllRestaurant = "exploreAllRestaurant";
  static const String exploreAllMenus = "exploreAllMenus";
  static const String searchScreen = "searchScreen";
  static const String confirmOrder = "confirmOrder";
  static const String choosePaymentWay = "choosePaymentWay";
  static const String chat = "chat";
}

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoute.splashScreen:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case AppRoute.login:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const Login(),
        ),
      );
    case AppRoute.onboarding:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<OnboardingCubit>(),
          child: const Onboarding(),
        ),
      );
    case AppRoute.signUp:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<SignUpCubit>.value(
              value: getIt<SignUpCubit>(),
            ),
          ],
          child: const SignUpScreen(),
        ),
      );
    case AppRoute.homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

    case AppRoute.signUpProcess:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<SignUpCubit>.value(
              value: getIt<SignUpCubit>(),
            ),
          ],
          child: SignUpProcess(),
        ),
      );
    case AppRoute.signUpSuccess:
      return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
    case AppRoute.navigationBar:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<BuyCubit>.value(
              value: getIt<BuyCubit>(),
            ),
             BlocProvider<ChatCubit>.value(
              value: getIt<ChatCubit>(),
            ),
            BlocProvider<NavigationCubit>.value(
              value: getIt<NavigationCubit>(),
            ),
          ],
          child: const NavigationBarScreen(),
        ),
      );
    case AppRoute.exploreAllRestaurant:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: const ExploreAllRestaurant(),
        ),
      );
    case AppRoute.exploreAllMenus:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: const ExploreAllMenus(),
        ),
      );
    case AppRoute.searchScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<SearchCubit>(),
          child: const SearchScreen(),
        ),
      );
    case AppRoute.confirmOrder:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<BuyCubit>.value(
              value: getIt<BuyCubit>(),
            ),
            BlocProvider<ChatCubit>.value(
              value: getIt<ChatCubit>(),
            ),
          ],
          child: const ConfirmOrder(),
        ),
      );
    case AppRoute.choosePaymentWay:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<BuyCubit>.value(
              value: getIt<BuyCubit>(),
            ),
          ],
          child: const ChoosePaymentWay(),
        ),
      );
    case AppRoute.chat:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<ChatCubit>.value(
              value: getIt<ChatCubit>(),
            ),
          ],
          child: const Chat(),
        ),
      );
  }
  return null;
}
