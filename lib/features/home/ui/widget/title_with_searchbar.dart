import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/ui/widget/default_search_bar.dart';
import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class TitleWithSearchBar extends StatelessWidget {
  const TitleWithSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.homeScreenTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: FontFamilies.bentonSansBold),
            ),
          ),
          Container(
            width: 14.w,
            height: 14.w,
            decoration: BoxDecoration(
                color: isItDark()
                    ? ColorManager.white.withOpacity(.1)
                    : ColorManager.closeWhite,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  isItDark()
                      ? BoxShadow(
                          color: ColorManager.whiteShadow.withOpacity(.07),
                          offset: const Offset(12, 26),
                          blurRadius: 50,
                        )
                      : BoxShadow(
                          color: ColorManager.shadowNotificationIconLite
                              .withOpacity(.2),
                          offset: const Offset(11, 28),
                          blurRadius: 50,
                        )
                ]),
            child: SvgPicture.asset(
              ImageAssets.iconNotification,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
   const   DefaultSearchBar()
    ]);
  }
}
