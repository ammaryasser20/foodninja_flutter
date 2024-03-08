import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/presentation/resources/assets_manager.dart';
import 'package:foodninja/presentation/resources/color_manager.dart';
import 'package:foodninja/presentation/resources/routes_manager.dart';
import 'package:foodninja/presentation/widget/logo.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    Navigator.pushReplacementNamed(context, AppRoute.onboarding);
  }

  @override
  void initState() {
    super.initState();
    //   _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 100.h,
      width: 100.w,
      child: Center(
        child: Column(
          // fit: StackFit.expand,
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorManager.white.withOpacity(.8),
                    ColorManager.white.withOpacity(0.0)
                  ],
                  //   stops: [0.50, 0.4],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: SvgPicture.asset(
                ImageAssets.pattern,
              ),
            ),
            Logo(),
          ],
        ),
      ),
    ));
  }
}
