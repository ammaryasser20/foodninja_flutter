import 'package:flutter/material.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
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
              style: Theme.of(context).textTheme.displayLarge
              !.copyWith(
                  fontFamily: FontFamilies.bentonSansBold,
                  color: ColorManager.white),
            ),
          )),
    );
  }
}
