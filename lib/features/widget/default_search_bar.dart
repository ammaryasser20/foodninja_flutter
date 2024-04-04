import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/widget/search_text_form_field.dart';
import 'package:foodninja/main.dart';

import 'package:sizer/sizer.dart';

class DefaultSearchBar extends StatelessWidget {
  const DefaultSearchBar({super.key, this.controller,required this.onTab});
  final TextEditingController? controller;
    final void Function() onTab;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchTextFormField(
          onTab: onTab,
          readOnly: true,
          cursorColor:
              isItDark() ? ColorManager.white : ColorManager.orangeLight,
          prefix: ImageAssets.iconSearch,
          hintText: AppStrings.hintSearchTextFormFile,
          wight: 73.w,
          hight: 6.h,
          fillColor: isItDark()
              ? ColorManager.white.withOpacity(.1)
              : ColorManager.orange.withOpacity(.1),
          controller: controller,
        ),
        SizedBox(
          width: 2.w,
        ),
        Container(
          width: 14.w,
          height: 14.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isItDark()
                  ? ColorManager.white.withOpacity(.1)
                  : ColorManager.orange.withOpacity(.1)),
          child: SvgPicture.asset(
            ImageAssets.filterIcon,
            width: 7.w,
            height: 7.w,
            fit: BoxFit.none,
          ),
        )
      ],
    );
  }
}
