import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/main.dart';

import 'package:foodninja/presentation/resources/assets_manager.dart';
import 'package:foodninja/presentation/resources/color_manager.dart';
import 'package:foodninja/presentation/resources/font_manager.dart';
import 'package:foodninja/presentation/resources/strings_manager.dart';
import 'package:foodninja/presentation/widget/default_bottom.dart';
import 'package:foodninja/presentation/widget/default_textformfield.dart';
import 'package:foodninja/presentation/widget/logo.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
                      width: 100.w,
                      height: 40.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    left: 25.w,
                    child: const Logo(),
                  ),
                ],
              ),
              Text(
                AppStrings.loginScreenTitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: FontFamilies.bentonSansBold,
                    fontSize: FontSize.s20),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.whiteShadow.withOpacity(.07),
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                    )
                  ],
                ),
                child: DefaultTextFormFiled(
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(focus);
                  },
                  hintText: AppStrings.email,
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.whiteShadow.withOpacity(.07),
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                    )
                  ],
                ),
                child: DefaultTextFormFiled(
                  focusNode: focus,
                  hintText: AppStrings.password,
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                AppStrings.orContinueWith,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontFamily: FontFamilies.bentonSansBold),
              ),
              SizedBox(
                height: 2.h,
              ),
              socialAuth(),
              SizedBox(
                height: 2.h,
              ),
              GradientText(
                AppStrings.forgotYourPassword,
                style: const TextStyle(
                    fontFamily: FontFamilies.bentonSansMedium,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorManager.primaryColor),
                colors: const [
                  ColorManager.primaryColorLight,
                  ColorManager.primaryColor,
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              DefaultBottom(
                  text: AppStrings.login,
                  width: 42.w,
                  height: 7.h,
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

Widget socialAuth() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
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
          children: [
            SvgPicture.asset(
              ImageAssets.facebookIcon,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              AppStrings.faceBook,
              style: Theme.of(NavigationService.navigatorKey.currentContext!)
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
          children: [
            SvgPicture.asset(
              ImageAssets.googleIcon,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              AppStrings.google,
              style: Theme.of(NavigationService.navigatorKey.currentContext!)
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
  );
}
