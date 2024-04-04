import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/buy/ui/widget/payment_order_item.dart';
import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class ChoosePaymentWay extends StatelessWidget {
 const ChoosePaymentWay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCubit, BuyState>(
      builder: (context, state) {
        return PopScope(
          onPopInvoked: (didPop) {
            if (BuyCubit.get(context).wayOfPayment != "Cash.png") {
              if (BuyCubit.get(context)
                      .paymentController[BuyCubit.get(context).wayOfPayment]!
                      .text
                      .length !=
                  16) {
                BuyCubit.get(context).changeWayOfPayment("Cash.png");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(AppStrings.cantBeLowerThan16),
                  backgroundColor: ColorManager.liteRed,
                ));
              }
            }
            BuyCubit.get(context)
                .changeWayOfPayment(BuyCubit.get(context).wayOfPayment);
          },
          child: Scaffold(
            body: Stack(
              children: [
                Transform.flip(
                  flipX: isItArabic(),
                  child: SvgPicture.asset(ImageAssets.pattern2, width: 100.w),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: isItArabic()
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Transform.flip(
                              flipX: isItArabic(),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  ImageAssets.back,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          PaymentOrderItem(
                      
                            image: ImageAssets.paypal,
                            function: BuyCubit.get(context).changeWayOfPayment,
                            onChanged: (String value) {},
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          PaymentOrderItem(

                            image: ImageAssets.visa,
                            function: BuyCubit.get(context).changeWayOfPayment,
                            onChanged: (String value) {},
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          PaymentOrderItem(
            
                            image: ImageAssets.payoneer,
                            function: BuyCubit.get(context).changeWayOfPayment,
                            onChanged: (String value) {},
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              BuyCubit.get(context)
                                  .changeWayOfPayment("Cash.png");
                            },
                            child: Container(
                              width: 90.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: BuyCubit.get(context).wayOfPayment ==
                                            "Cash.png"
                                        ? ColorManager.primaryColor
                                        : isItDark()
                                            ? ColorManager.liteGray
                                            : ColorManager.white),
                                borderRadius: BorderRadius.circular(22),
                                color: isItDark()
                                    ? ColorManager.liteGray
                                    : ColorManager.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.whiteShadow
                                        .withOpacity(.07),
                                    offset: const Offset(12, 26),
                                    blurRadius: 50,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImageAssets.cash,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GradientText(
                                      "Cash",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontFamily:
                                                  FontFamilies.bentonSansBold),
                                      colors: const [
                                        ColorManager.primaryColorLight,
                                        ColorManager.primaryColor,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
