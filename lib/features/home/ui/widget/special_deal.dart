import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class SpecialDeal extends StatelessWidget {
  const SpecialDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 19.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            ColorManager.primaryColorLight,
            ColorManager.primaryColor,
          ],
        ),
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: .2,
            child: SvgPicture.asset(
              ImageAssets.backGround,
              width: 100.w,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 0,
            child: Image.asset(
              height: 19.h,
              ImageAssets.iceCream,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            left: 50.w,
            top: 4.h,
            child: Text(
              AppStrings.specialDeal,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  height: 1.2,
                  color: isItDark() ? ColorManager.dark : ColorManager.white,
                  fontFamily: FontFamilies.bentonSansBold),
            ),
          ),
          Positioned(
            left: 50.w,
            top: 10.h,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ColorManager.white),
              child: GradientText(
                AppStrings.buyNow,
                colors: const [
                  ColorManager.primaryColorLight,
                  ColorManager.primaryColor,
                ],
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontFamily: FontFamilies.bentonSansBold,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
