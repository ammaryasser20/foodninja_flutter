import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/routes_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/widget/default_bottom.dart';
import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
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
                        //   stops: [0.50, 0.4],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: SvgPicture.asset(
                      ImageAssets.pattern,
                    ),
                  ),
                ),
                Positioned(
                    top: 27.h, child: SvgPicture.asset(ImageAssets.done)),
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            GradientText(
              AppStrings.congrats,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: FontFamilies.bentonSansBold),
              colors: const [
                ColorManager.primaryColorLight,
                ColorManager.primaryColor,
              ],
            ),
            Text(
              AppStrings.yourProfileIsReadyToUse,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontFamily: FontFamilies.bentonSansBold),
            ),
            SizedBox(
              height: 25.h,
            ),
            DefaultBottom(
                width: 42.w,
                height: 7.h,
                text: AppStrings.login,
                onPressed: () {
                  CashHelper.clear();
                  HelperFunction.pushNamedAndRemoveUntil(AppRoute.login);
                }),
          ],
        ),
      ),
    );
  }
}
