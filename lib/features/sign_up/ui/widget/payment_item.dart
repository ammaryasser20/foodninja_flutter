import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 10.h,
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
      child: SvgPicture.asset(
        image,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
