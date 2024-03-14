import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/features/login/data/models/login_request_body.dart';
import 'package:foodninja/features/login/logic/cubit/login_cubit.dart';
import 'package:foodninja/features/login/ui/widget/cubit_ui_state.dart';
import 'package:foodninja/features/login/ui/widget/social_auth.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/widget/default_bottom.dart';
import 'package:foodninja/features/widget/default_textformfield.dart';
import 'package:foodninja/features/widget/logo.dart';
import 'package:foodninja/main.dart';
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
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: DefaultTextFormFiled(
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(focus);
                  },
                  textInputType: TextInputType.emailAddress,
                  hintText: AppStrings.email,
                  controller: emailController,
                ),
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
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: DefaultTextFormFiled(
                  focusNode: focus,
                  hintText: AppStrings.password,
                  controller: passwordController,
                ),
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
            const SocialLogin(),
            SizedBox(
              height: 2.h,
            ),
            TextButton(
              onPressed: () {
                context.read<LoginCubit>().navigateToSignUpScreen(context);
              },
              child: GradientText(
                AppStrings.haveNotAccount,
                style: const TextStyle(
                    fontFamily: FontFamilies.bentonSansMedium,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorManager.primaryColor),
                colors: const [
                  ColorManager.primaryColorLight,
                  ColorManager.primaryColor,
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            DefaultBottom(
              text: AppStrings.login,
              width: 42.w,
              height: 7.h,
              onPressed: () {
                context.read<LoginCubit>().login(
                      LoginRequestBody(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()),
                    );
              },
            ),
            const LoginBlocListener()
          ],
        ),
      ),
    );
  }
}
