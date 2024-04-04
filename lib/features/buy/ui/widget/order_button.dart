import 'package:flutter/material.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final double width;
  final double height;
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
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: ColorManager.nearlyWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: GradientText(
              text,
              colors: const [
                ColorManager.primaryColorLight,
                ColorManager.primaryColor
              ],
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontFamily: FontFamilies.bentonSansBold,
                  ),
            ),
          )),
    );
  }
}
