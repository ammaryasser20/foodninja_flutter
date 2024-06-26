import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:sizer/sizer.dart';

import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/main.dart';

class GetImageItem extends StatelessWidget {
  const GetImageItem({
    Key? key,
    required this.image,
    required this.function,
    required this.text,
  }) : super(key: key);
  final String image;
  final Function function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await function();
      },
      child: Container(
        width: 90.w,
        height: 15.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: isItDark() ? ColorManager.liteGray : ColorManager.white),
          borderRadius: BorderRadius.circular(22),
          color: isItDark() ? ColorManager.liteGray : ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.whiteShadow.withOpacity(.07),
              offset: const Offset(12, 26),
              blurRadius: 50,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontFamily: FontFamilies.bentonSansBold),
            )
          ],
        ),
      ),
    );
  }
}
