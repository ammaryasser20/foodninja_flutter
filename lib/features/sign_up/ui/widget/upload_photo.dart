import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';

import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/sign_up/logic/signup_cubit.dart';
import 'package:foodninja/features/sign_up/logic/signup_state.dart';
import 'package:foodninja/features/sign_up/ui/widget/get_image_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.uploadYourPhotoProfile,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontFamily: FontFamilies.bentonSansBold),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            AppStrings.supTitleOfSignUpProcess,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontFamily: FontFamilies.bentonSansBook, height: 1.5),
          ),
          SizedBox(
            height: 2.h,
          ),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              if (SignUpCubit.get(context).userImage == null) {
                return Column(
                  children: [
                    GetImageItem(
                      function: () async {
                        await context
                            .read<SignUpCubit>()
                            .setUserImage(ImageSource.gallery);
                      },
                      image: ImageAssets.gallery,
                      text: AppStrings.fromGallery,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GetImageItem(
                      function: () async {
                        await context
                            .read<SignUpCubit>()
                            .setUserImage(ImageSource.camera);
                      },
                      image: ImageAssets.camera,
                      text: AppStrings.takePhoto,
                    )
                  ],
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Center(
                    child: Container(
                      height: 25.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.file(
                            context.read<SignUpCubit>().userImage!,
                          ),
                          IconButton(
                              onPressed: () {
                                context.read<SignUpCubit>().deleteImage();
                              },
                              icon: SvgPicture.asset(
                                width: 40,
                                height: 40,
                                ImageAssets.closeIcon,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
