import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/home/ui/widget/restaurant_screen.dart';
import 'package:foodninja/features/profile/logic/cubit/profile_cubit.dart';

import 'package:foodninja/features/widget/default_bottom.dart';

import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key, required this.food, this.restaurant});
  final Food food;
  final Restaurant? restaurant;
  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is LoadingData) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primaryColor,
            ),
          );
        }
        return Scaffold(
            floatingActionButton: DefaultBottom(
              height: 7.h,
              width: 90.w,
              text: 'Add To Chart',
              onPressed: () {},
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  widget.food.pic != null
                      ? CachedNetworkImage(
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 35.h,
                          imageUrl:
                              "https://project1.amit-learning.com/food/${widget.food.pic!.split("/").last}",
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : Image.asset(ImageAssets.errorImage),
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 30.h,
                          width: 100.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: isItDark()
                                ? ColorManager.dark
                                : ColorManager.white,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(50),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 2.5.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      gradient: LinearGradient(
                                        colors: [
                                          ColorManager.primaryColor
                                              .withOpacity(0.1),
                                          ColorManager.primaryColorLight
                                              .withOpacity(0.1)
                                        ],
                                      ),
                                    ),
                                    child: GradientText(
                                      colors: const [
                                        ColorManager.primaryColor,
                                        ColorManager.primaryColorLight
                                      ],
                                      AppStrings.popular,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontFamily: FontFamilies
                                                  .bentonSansMedium),
                                    ),
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(ImageAssets.locationIcon),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                  IconButton(
                                    icon: ProfileCubit.get(context)
                                            .favoriteFoods
                                            .where((element) {
                                      if (element.id == widget.food.id) {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    }).isNotEmpty
                                        ? SvgPicture.asset(ImageAssets.loveIcon)
                                        : SvgPicture.asset(
                                            ImageAssets.unLoveIcon),
                                    onPressed: () async {
                                      if (ProfileCubit.get(context)
                                          .favoriteFoods
                                          .where((element) {
                                        if (element.id == widget.food.id) {
                                          return true;
                                        } else {
                                          return false;
                                        }
                                      }).isNotEmpty) {
                                        await ProfileCubit.get(context)
                                            .removeFavorites(widget.food);
                                      } else {
                                        await ProfileCubit.get(context)
                                            .addFavorite(widget.food);
                                      }
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.food.name ?? "error",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontFamily:
                                                FontFamilies.bentonSansBold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '\$${widget.food.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorManager.darkOrange,
                                            fontFamily:
                                                FontFamilies.bentonSansBold),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.iconStar,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    '4,8 Rating',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: isItDark()
                                                ? ColorManager.white
                                                    .withOpacity(.3)
                                                : ColorManager.gray
                                                    .withOpacity(.3)),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SvgPicture.asset(
                                    ImageAssets.shoppingBag,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    '2000+ Order',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: isItDark()
                                                ? ColorManager.white
                                                    .withOpacity(.3)
                                                : ColorManager.gray
                                                    .withOpacity(.3)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                widget.food.description ?? "error",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              if (widget.restaurant != null)
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                          create: (context) =>
                                              getIt<HomeCubit>(),
                                          child: RestaurantScreen(
                                            restaurant: widget.restaurant!,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22)),
                                        child: widget.restaurant!.pic != null
                                            ? CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    "https://project1.amit-learning.com/restaurent/${widget.restaurant!.pic!.split("/").last}",
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                                height: 15.h,
                                              )
                                            : Image.asset(
                                                ImageAssets.errorImage),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        widget.restaurant!.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                                fontFamily: FontFamilies
                                                    .bentonSansBold),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
