import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/network/routes_manager.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';

import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/buy/ui/widget/total_order.dart';

import 'package:foodninja/features/chat/logic/cubit/chat_cubit.dart';
import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:sizer/sizer.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BuyCubit, BuyState>(
        builder: (context, state) {
          return Stack(
            children: [
              Transform.flip(
                  flipX: isItArabic(),
                  child: SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                      Text(
                        AppStrings.confirmOrder,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontFamily: FontFamilies.bentonSansBold,
                                ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 90.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: isItDark()
                                  ? ColorManager.liteGray
                                  : ColorManager.white),
                          borderRadius: BorderRadius.circular(15),
                          color: isItDark()
                              ? ColorManager.liteGray
                              : ColorManager.white,
                          boxShadow: [
                            isItDark()
                                ? const BoxShadow(
                                    color: ColorManager.darkShadow,
                                    blurRadius: 50,
                                  )
                                : BoxShadow(
                                    color: ColorManager.whiteShadow
                                        .withOpacity(.07),
                                    offset: const Offset(12, 26),
                                    blurRadius: 50,
                                  ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.5.h, horizontal: 4.w),
                              child: Row(
                                children: [
                                  Text(
                                    AppStrings.paymentMethod,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontFamily:
                                                FontFamilies.bentonSansRegular,
                                            color: isItDark()
                                                ? ColorManager.white
                                                    .withOpacity(.3)
                                                : ColorManager.gray
                                                    .withOpacity(.3)),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoute.choosePaymentWay);
                                    },
                                    child: GradientText(
                                      AppStrings.edit,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontFamily: FontFamilies
                                                  .bentonSansRegular),
                                      colors: const [
                                        ColorManager.primaryColorLight,
                                        ColorManager.primaryColor,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: BuyCubit.get(context).wayOfPayment ==
                                      "Cash.png"
                                  ? Row(
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
                                                  fontFamily: FontFamilies
                                                      .bentonSansBold),
                                          colors: const [
                                            ColorManager.primaryColorLight,
                                            ColorManager.primaryColor,
                                          ],
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 1.5.h),
                                          child: SvgPicture.asset(
                                              "$imagePath/${BuyCubit.get(context).wayOfPayment}"),
                                        ),
                                        const Spacer(),
                                        Text(HelperFunction.textSplit(
                                            BuyCubit.get(context)
                                                .paymentController[
                                                    BuyCubit.get(context)
                                                        .wayOfPayment]!
                                                .text))
                                      ],
                                    ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      TotalOrder(
                        function: () {
                          ChatCubit.get(context).addOrder(
                              orders: BuyCubit.get(context).order,
                              wayOfPayment: BuyCubit.get(context).wayOfPayment);
                          BuyCubit.get(context).finishOrder();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: ColorManager.primaryColor,
                              content: Text(AppStrings.yourOrderConfirmed)));
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
