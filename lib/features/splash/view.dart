import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/network/routes_manager.dart';
import 'package:foodninja/features/widget/logo.dart';
import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  startDelay() {
    timer = Timer(const Duration(milliseconds: 500), goNext);
  }

  goNext() {
    if (CashHelper.getBool(key: Keys.notFirstTime)) {
      Navigator.pushReplacementNamed(context, AppRoute.login);
    } else {
      Navigator.pushReplacementNamed(context, AppRoute.onboarding);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startDelay());
    ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 100.h,
      width: 100.w,
      child: Center(
        child: Column(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isItDark()
                      ? [
                          ColorManager.dark.withOpacity(.8),
                          ColorManager.dark.withOpacity(0.0)
                        ]
                      : [
                          ColorManager.white.withOpacity(.8),
                          ColorManager.white.withOpacity(0.0)
                        ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: SvgPicture.asset(
                ImageAssets.pattern,
              ),
            ),
            const Logo(),
          ],
        ),
      ),
    ));
  }
}
