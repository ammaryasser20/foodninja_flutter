import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/features/chat/logic/cubit/chat_cubit.dart';

import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class TextFieldChat extends StatelessWidget {
  TextFieldChat({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 5.w),
          decoration: BoxDecoration(
            color: isItDark() ? ColorManager.liteGray : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.whiteShadow.withOpacity(.07),
                  offset: const Offset(12, 26),
                  blurRadius: 50)
            ],
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              fillColor:
                  isItDark() ? ColorManager.liteGray : ColorManager.white,
              suffixIcon: IconButton(
                onPressed: () {
                  ChatCubit.get(context).sendMassage(controller.text);
                },
                icon: SvgPicture.asset(
                  ImageAssets.sendIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: isItDark()
                      ? ColorManager.liteGray
                      : ColorManager.lowWhite,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color:
                      isItDark() ? ColorManager.liteGray : ColorManager.white,
                ),
              ),
            ),
          )),
    );
  }
}
