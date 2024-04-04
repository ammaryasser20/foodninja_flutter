import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/widget/default_textformfield.dart';
import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class PaymentOrderItem extends StatefulWidget {
  const PaymentOrderItem(
      {super.key,
      required this.image,

      required this.function,
      required this.onChanged});
  final String image;

  final Function(String) function;
  final Function(String) onChanged;
  @override
  State<PaymentOrderItem> createState() => _PaymentOrderItemState();
}

class _PaymentOrderItemState extends State<PaymentOrderItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.function(widget.image.split('/').last);
          },
          child: Container(
            width: 90.w,
            height: 10.h,
            decoration: BoxDecoration(
              border: Border.all(
                  color: BuyCubit.get(context).wayOfPayment ==
                          widget.image.split('/').last
                      ? ColorManager.primaryColor
                      : isItDark()
                          ? ColorManager.liteGray
                          : ColorManager.white),
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
            child: Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                SvgPicture.asset(
                  widget.image,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        AnimatedContainer(
          height:
              BuyCubit.get(context).wayOfPayment == widget.image.split('/').last
                  ? 11.h
                  : 0,
          duration: const Duration(milliseconds: 300),
          child: BuyCubit.get(context).wayOfPayment ==
                  widget.image.split('/').last
              ? DefaultTextFormFiled(
                  onChanged: widget.onChanged,
                  maxLength: 16,
                  textInputType: TextInputType.number,
                  hintText: '**** **** **** ****',
                  controller: BuyCubit.get(context)
                      .paymentController[widget.image.split('/').last]!,
                )
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isItDark()
                            ? ColorManager.liteGray
                            : ColorManager.white),
                    borderRadius: BorderRadius.circular(15),
                    color:
                        isItDark() ? ColorManager.liteGray : ColorManager.white,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.whiteShadow.withOpacity(.07),
                        offset: const Offset(12, 26),
                        blurRadius: 50,
                      )
                    ],
                  ),
                  height: 2.h,
                ),
        )
      ],
    );
  }
}
