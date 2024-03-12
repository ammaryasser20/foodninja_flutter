import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/features/splash/data/models/models.dart';

import 'package:foodninja/main.dart';
import 'package:foodninja/features/onboarding/logic/onboarding_cubit.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/widget/default_bottom.dart';

import 'package:sizer/sizer.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();

  late List<SliderObject> sliderObjectList;
  @override
  void initState() {
    sliderObjectList =
        OnboardingCubit.get(NavigationService.navigatorKey.currentContext)
            .getSliderData(NavigationService.navigatorKey.currentContext!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 2,
                controller: _pageController,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      SvgPicture.asset(
                        sliderObjectList[i].image,
                        height: 60.h,
                        width: 100.w,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        sliderObjectList[i].title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontFamily: FontFamilies.bentonSansBold),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        sliderObjectList[i].subTitle,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontFamily: FontFamilies.bentonSansBook),
                      )
                    ],
                  );
                },
              ),
            ),
            DefaultBottom(
              onPressed: () {
                OnboardingCubit.get(context).nextBottom(_pageController);
              },
              text:AppStrings.next,
              width: 42.w,
              height: 7.h,
            ),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }
}
