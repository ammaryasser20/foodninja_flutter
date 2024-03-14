import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/firebase_options.dart';
import 'package:foodninja/generated/l10n.dart';
import 'package:foodninja/features/onboarding/logic/onboarding_cubit.dart';
import 'package:foodninja/core/resources/routes_manager.dart';
import 'package:foodninja/core/resources/theme_manager.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  await CashHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnboardingCubit()),
      ],
      child: Sizer(builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: ThemeMode.light,
          locale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: onGenerateRoute,
          initialRoute: AppRoute.signUpProcess,
        );
      }),
    );
  }
}

bool isItDark() {
  return false;
}

bool isItArabic() {
  return Intl.getCurrentLocale() == "ar";
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
