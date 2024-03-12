import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 45.w,
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.whiteShadow.withOpacity(.07),
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                  )
                ],
                color: isItDark() ? ColorManager.liteGray : ColorManager.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: isItDark()
                        ? ColorManager.liteGray
                        : ColorManager.lowWhite)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageAssets.facebookIcon,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  AppStrings.faceBook,
                  style:
                      Theme.of(NavigationService.navigatorKey.currentContext!)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                            fontFamily: FontFamilies.bentonSansBold,
                          ),
                )
              ],
            ),
          ),
          Container(
            width: 45.w,
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.whiteShadow.withOpacity(.07),
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                  )
                ],
                color: isItDark() ? ColorManager.liteGray : ColorManager.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: isItDark()
                        ? ColorManager.liteGray
                        : ColorManager.lowWhite)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageAssets.googleIcon,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  AppStrings.google,
                  style:
                      Theme.of(NavigationService.navigatorKey.currentContext!)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                            fontFamily: FontFamilies.bentonSansBold,
                          ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
