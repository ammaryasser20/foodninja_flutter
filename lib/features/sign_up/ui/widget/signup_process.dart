import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/routes_manager.dart';

import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/sign_up/logic/signup_cubit.dart';
import 'package:foodninja/features/sign_up/logic/signup_state.dart';
import 'package:foodninja/features/sign_up/ui/widget/payment_method.dart';
import 'package:foodninja/features/sign_up/ui/widget/upload_photo.dart';
import 'package:foodninja/features/widget/default_bottom.dart';
import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class SignUpProcess extends StatelessWidget {
  SignUpProcess({super.key});
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.flip(
              flipX: isItArabic(),
              child: SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: isItArabic()
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Transform.flip(
                      flipX: isItArabic(),
                      child: SvgPicture.asset(
                        ImageAssets.back,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 100.w,
                  height: 75.h,
                  child: PageView(
                    controller: controller,
                    children: const [PaymentMethod(), UploadPhoto()],
                  ),
                ),
                DefaultBottom(
                  width: 42.w,
                  height: 7.h,
                  text: AppStrings.next,
                  onPressed: () async {
                    await context.read<SignUpCubit>().nextPage(controller);
                  },
                ),
                BlocListener<SignUpCubit, SignUpState>(
                  listenWhen: (previous, current) =>
                      current is UploadingImage ||
                      current is SuccessAddImage ||
                      current is ErrorUploadingImage,
                  listener: (context, state) {
                    state.whenOrNull(uploadingImage: () {
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      );
                    }, successAddImage: () {
                      Navigator.pop(context);
                      HelperFunction.pushReplacementNamed(
                          AppRoute.signUpSuccess);
                    }, errorUploadingImage: (error) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          icon: const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 32,
                          ),
                          content: Text(
                            error,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                  child: const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
