import 'package:flutter/material.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:sizer/sizer.dart';

class BuyAgainButton extends StatelessWidget {
  const BuyAgainButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () async {
        await onPressed();
      },
      child: Container(
          width: 25.w,
          height: 4.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [
                ColorManager.primaryColorLight,
                ColorManager.primaryColor
              ],
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontFamily: FontFamilies.bentonSansBold,
                  color: ColorManager.white),
            ),
          )),
    );
  }
}
