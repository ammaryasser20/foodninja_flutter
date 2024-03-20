import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';

import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.food});
  final Food food;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 12.h,
      width: 90.w,
      clipBehavior: Clip.hardEdge,
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
      child: Row(children: [
        Container(
          width: 25.w,
          height: 12.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: food.pic != null
              ? CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://project1.amit-learning.com/food/${food.pic!.split("/").last}",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image.asset(ImageAssets.errorImage),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          food.name ?? " ",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontFamily: FontFamilies.bentonSansMedium),
        ),
        const Spacer(),
        Text(
          '\$${food.price}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorManager.darkOrange,
              fontFamily: FontFamilies.bentonSansBold),
        ),
        SizedBox(
          width: 5.w,
        )
      ]),
    );
  }
}
