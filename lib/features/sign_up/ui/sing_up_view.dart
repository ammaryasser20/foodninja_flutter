import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/features/sign_up/data/models/register_request_body.dart';
import 'package:foodninja/features/sign_up/logic/signup_cubit.dart';
import 'package:foodninja/features/sign_up/logic/signup_state.dart';
import 'package:foodninja/features/sign_up/ui/widget/cubit_ui_state.dart';
import 'package:foodninja/main.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/widget/default_button.dart';
import 'package:foodninja/features/widget/default_textformfield.dart';
import 'package:foodninja/features/widget/logo.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

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
                AppStrings.signUpScreenTitle,
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
                    FocusScope.of(context).requestFocus(emailFocus);
                  },
                  hintText: AppStrings.userName,
                  controller: userNameController,
                  prefix: ImageAssets.profile,
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
                  textInputType: TextInputType.emailAddress,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(passwordFocus);
                  },
                  focusNode: emailFocus,
                  prefix: ImageAssets.email,
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
                  isItForPassword: true,
                  prefix: ImageAssets.lock,
                  focusNode: passwordFocus,
                  hintText: AppStrings.password,
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            return Checkbox(
                              shape: const CircleBorder(),
                              activeColor: ColorManager.primaryColorLight,
                              value: context
                                  .read<SignUpCubit>()
                                  .emailMeAboutSpecialPricing,
                              onChanged: (v) {
                                context
                                    .read<SignUpCubit>()
                                    .changeEmailMe(v ?? false);
                              },
                            );
                          },
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      AppStrings.emailMeAboutSpecialPricing,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontFamily: FontFamilies.bentonSansBook,
                            color: isItDark()
                                ? ColorManager.white.withOpacity(.5)
                                : ColorManager.liteGray.withOpacity(.5),
                          ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              DefaultButton(
                  text: AppStrings.createAccount,
                  width: 42.w,
                  height: 7.h,
                  onPressed: () {
                    context.read<SignUpCubit>().register(RegisterRequestBody(
                        name: userNameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()));
                  }),
              SizedBox(
                height: 1.h,
              ),
              TextButton(
                onPressed: () {
                  context.read<SignUpCubit>().navigateToLoginScreen(context);
                },
                child: GradientText(
                  AppStrings.alreadyHaveAnAccount,
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
              const SignUpBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}
