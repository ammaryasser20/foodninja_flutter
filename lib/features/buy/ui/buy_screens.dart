import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/network/routes_manager.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/buy/ui/widget/order_item.dart';
import 'package:foodninja/features/buy/ui/widget/total_order.dart';
import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCubit, BuyState>(
      builder: (context, state) {
        return Stack(
          children: [
            Transform.flip(
                flipX: isItArabic(),
                child: SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Stack(
                  children: [
                    if (BuyCubit.get(context).order.isEmpty)
                      Center(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  SvgPicture.asset(ImageAssets.buy,
                                      width: 35.w, height: 20.h),
                                  Positioned(
                                    right: 0,
                                    top: 2.h,
                                    child: Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: ColorManager.liteRed,
                                        border: Border.all(
                                            color: ColorManager.white),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "0",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              GradientText('  ${AppStrings.noOrder}',
                                  colors: const [
                                    ColorManager.primaryColorLight,
                                    ColorManager.primaryColor,
                                  ],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontFamily: FontFamilies.bentonSansBold,
                                      ))
                            ],
                          ),
                        ),
                      ),
                    ListView(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          AppStrings.orderDetails,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontFamily: FontFamilies.bentonSansBold,
                              ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        ...BuyCubit.get(context).order.entries.map(
                              (e) => Column(
                                children: [
                                  OrderItem(
                                    orderModel: e.value,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  )
                                ],
                              ),
                            ),
                        SizedBox(
                          height: 35.h,
                        )
                      ],
                    ),
                    if (BuyCubit.get(context).order.isNotEmpty)
                      Positioned(
                        bottom: 12.h,
                        child: TotalOrder(
                          function: () {
                            Navigator.pushNamed(context, AppRoute.confirmOrder);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
