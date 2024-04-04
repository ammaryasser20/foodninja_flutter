import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';

import 'package:foodninja/features/buy/ui/widget/order_button.dart';
import 'package:sizer/sizer.dart';

class TotalOrder extends StatelessWidget {
  const TotalOrder({super.key, required this.function});
  final Function function;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCubit, BuyState>(
      builder: (context, state) {
        return Container(
          width: 90.w,
          height: 23.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                ColorManager.primaryColorLight,
                ColorManager.primaryColor,
              ],
            ),
          ),
          child: Stack(
            children: [
              SvgPicture.asset(
                ImageAssets.totalOrder,
                width: 90.w,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        children: [
                          Text(
                            AppStrings.subTotal,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: ColorManager.white,
                                    fontFamily: FontFamilies.bentonSansMedium),
                          ),
                          const Spacer(),
                          Text(
                            "${BuyCubit.get(context).getTotal()} \$",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: ColorManager.white,
                                    fontFamily: FontFamilies.bentonSansMedium),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        children: [
                          Text(
                            AppStrings.deliveryCharge,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: ColorManager.white,
                                    fontFamily: FontFamilies.bentonSansMedium),
                          ),
                          const Spacer(),
                          Text(
                            "10 \$",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: ColorManager.white,
                                    fontFamily: FontFamilies.bentonSansMedium),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        children: [
                          Text(
                            AppStrings.total,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: ColorManager.white,
                                    fontFamily: FontFamilies.bentonSansMedium),
                          ),
                          const Spacer(),
                          Text(
                            "${BuyCubit.get(context).getTotal() + 10} \$",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: ColorManager.white,
                                    fontFamily: FontFamilies.bentonSansMedium),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    OrderButton(
                      height: 7.h,
                      width: 90.w,
                      text: AppStrings.placeMyOrder,
                      onPressed: () {
                        function();
                     
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
