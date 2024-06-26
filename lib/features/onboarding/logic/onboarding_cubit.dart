import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodninja/features/onboarding/data/models/models.dart';

import 'package:foodninja/main.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/network/routes_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
 // static OnboardngCubit get(context) => BlocProvider.of(context);
// Future<void> darkMode(bool dark) async {
//     await CashHelper.putBool(key: Keys.darkMode, value: dark);

//     emit( Ca());
//   }
  List<SliderObject> getSliderData(BuildContext context) => [
        SliderObject(AppStrings.onboardingTitleOne,
            AppStrings.onboardingSubTitleOne, ImageAssets.onboarding1),
        SliderObject(AppStrings.onboardingTitleTwo,
            AppStrings.onboardingSubTitleTwo, ImageAssets.onboarding2),
      ];
  void nextBottom(PageController pageController) {
    if (pageController.page == 1) {
      Navigator.pushReplacementNamed(
          NavigationService.navigatorKey.currentContext!, AppRoute.login);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}
