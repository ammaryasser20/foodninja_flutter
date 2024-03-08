import 'package:flutter/material.dart';
import 'package:foodninja/presentation/resources/color_manager.dart';
import 'package:foodninja/presentation/resources/font_manager.dart';

class DefaultBottom extends StatelessWidget {
  const DefaultBottom({
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
      onTap: () {
        onPressed();
      },
      child: Container(
          width: width,
          height: height,
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
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontFamily: FontFamilies.bentonSansBold,
                  color: ColorManager.white),
            ),
          )),
    );
  }
}