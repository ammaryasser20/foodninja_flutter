import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/profile/ui/widget/buy_again_button.dart';

import 'package:foodninja/features/widget/food_screen.dart';
import 'package:foodninja/features/profile/logic/cubit/profile_cubit.dart';
import 'package:foodninja/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider<ProfileCubit>.value(
                          value: getIt<ProfileCubit>(),
                        ),
                        BlocProvider<BuyCubit>.value(
                          value: getIt<BuyCubit>(),
                        ),
                      ],
                      child: FoodScreen(
                        food: food,
                        restaurant: ProfileCubit.get(context)
                            .favoriteRestaurantWithIDs[food.restaurantId],
                      ),
                    ),
                    type: PageTransitionType.bottomToTop));
          },
          child: Container(
            margin: EdgeInsets.only(top: 2.h),
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
            child: Row(
              children: [
                Container(
                  width: 25.w,
                  height: 12.h,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: food.pic != null
                      ? CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://project1.amit-learning.com/food/${food.pic!.split("/").last}",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : Image.asset(ImageAssets.errorImage),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                      width: 30.w,
                      child: Row(
                        children: [
                          Flexible(
                              child: Text(
                            maxLines: 1,
                            food.name ?? " ",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontFamily: FontFamilies.bentonSansMedium),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: .25.h,
                    ),
                    Text(
                      ProfileCubit.get(context)
                              .favoriteRestaurantWithIDs[food.restaurantId]!
                              .name ??
                          " ",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: isItDark()
                              ? ColorManager.white.withOpacity(.3)
                              : ColorManager.gray.withOpacity(.3),
                          fontFamily: FontFamilies.bentonSansRegular),
                    ),
                    SizedBox(
                      height: .50.h,
                    ),
                    GradientText(
                      '\$${food.price}',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontFamily: FontFamilies.bentonSansMedium),
                      colors: const [
                        ColorManager.primaryColorLight,
                        ColorManager.primaryColor
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                BuyAgainButton(
                  text: AppStrings.addOrder,
                  onPressed: () {
                    BuyCubit.get(context).addOrder(
                        food,
                        ProfileCubit.get(context)
                            .favoriteRestaurantWithIDs[food.restaurantId]!);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
