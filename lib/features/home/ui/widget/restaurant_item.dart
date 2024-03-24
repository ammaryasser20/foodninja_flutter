import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';

import 'package:foodninja/features/home/data/models/restaurant.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/home/ui/widget/restaurant_screen.dart';
import 'package:foodninja/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    super.key,
    required this.restaurant,
  });
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: BlocProvider(
                  create: (context) => getIt<HomeCubit>(),
                  child: RestaurantScreen(
                    restaurant: restaurant,
                  ),
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isItDark() ? ColorManager.liteGray : Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            isItDark()
                ? BoxShadow(
                    color: ColorManager.darkShadow.withOpacity(.5),
                    blurRadius: 50)
                : BoxShadow(
                    color: ColorManager.whiteShadow.withOpacity(.07),
                    offset: const Offset(12, 16),
                    blurRadius: 50)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(22)),
              child: restaurant.pic != null
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://project1.amit-learning.com/restaurent/${restaurant.pic!.split("/").last}",
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: 15.h,
                    )
                  : Image.asset(ImageAssets.errorImage),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              restaurant.name!,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontFamily: FontFamilies.bentonSansBold),
            ),
          ],
        ),
      ),
    );
  }
}
