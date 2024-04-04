import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';

import 'package:sizer/sizer.dart';

class ImageSelection extends StatelessWidget {
  const ImageSelection(
      {super.key, required this.functionCamera, required this.functionGallery});
  final Function functionCamera;
  final Function functionGallery;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 25.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              functionCamera();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageAssets.camera),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  AppStrings.takePhoto,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontFamily: FontFamilies.bentonSansBold),
                )
              ],
            ),
          ),
          VerticalDivider(
            indent: 3.h,
            endIndent: 3.h,
          ),
          GestureDetector(
            onTap: () {
              functionGallery();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageAssets.gallery),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  AppStrings.fromGallery,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontFamily: FontFamilies.bentonSansBold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
