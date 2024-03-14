import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';

import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/sign_up/logic/signup_cubit.dart';
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
                  onPressed: () {
                    context.read<SignUpCubit>().nextPage(controller);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
