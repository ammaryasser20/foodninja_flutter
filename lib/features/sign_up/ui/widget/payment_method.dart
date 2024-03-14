import 'package:flutter/material.dart';

import 'package:foodninja/core/resources/assets_manager.dart';

import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/sign_up/ui/widget/payment_item.dart';
import 'package:sizer/sizer.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.paymentMethod,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontFamily: FontFamilies.bentonSansBold),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            AppStrings.supTitleOfSignUpProcess,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontFamily: FontFamilies.bentonSansBook, height: 1.5),
          ),
          SizedBox(
            height: 2.h,
          ),
          const PaymentItem(
            image: ImageAssets.paypal,
          ),
          SizedBox(
            height: 2.h,
          ),
          const PaymentItem(
            image: ImageAssets.visa,
          ),
          SizedBox(
            height: 2.h,
          ),
          const PaymentItem(
            image: ImageAssets.payoneer,
          )
        ],
      ),
    );
  }
}
