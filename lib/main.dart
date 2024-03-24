import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';

import 'package:foodninja/features/manger/cubit/manger_cubit.dart';

import 'package:foodninja/firebase_options.dart';
import 'package:foodninja/generated/l10n.dart';

import 'package:foodninja/core/resources/routes_manager.dart';
import 'package:foodninja/core/resources/theme_manager.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CashHelper.init();
  await setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MangerCubit>(),
      child: Sizer(builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return BlocBuilder<MangerCubit, MangerState>(
          builder: (context, state) {
            return MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              theme: Themes.lightTheme,
              darkTheme: Themes.darkTheme,
              themeMode: MangerCubit.get(context).myMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
              locale: Locale(MangerCubit.get(context).myLanguage == ''
                  ? 'en'
                  : MangerCubit.get(context).myLanguage),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              onGenerateRoute: onGenerateRoute,
              initialRoute: AppRoute.splashScreen,
            );
          },
        );
      }),
    );
  }
}

bool isItDark() {
  //return true;
  return MangerCubit.get(NavigationService.navigatorKey.currentContext).myMode;
}

bool isItArabic() {
  return Intl.getCurrentLocale() == "ar";
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
