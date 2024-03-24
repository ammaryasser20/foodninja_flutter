import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';

import 'package:foodninja/features/home/ui/widget/food_screen.dart';
import 'package:foodninja/features/profile/logic/cubit/profile_cubit.dart';
import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({
    super.key,
    required this.restaurant,
  });
  final Restaurant restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<Food>? foods;
  @override
  void initState() {
    final token = CashHelper.getString(key: Keys.token);
    context.read<HomeCubit>().getAllFood(token: token);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is SuccessData) {
            foods = context
                .read<HomeCubit>()
                .foods!
                .food!
                .where(
                  (element) =>
                      element.restaurantId == '${widget.restaurant.id}',
                )
                .toList();
            return SafeArea(
              child: Stack(
                children: [
                  widget.restaurant.pic != null
                      ? CachedNetworkImage(
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 35.h,
                          imageUrl:
                              "https://project1.amit-learning.com/c_restaurent/${widget.restaurant.coverPhoto!.split("/").last}",
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
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(50),
                            ),
                            color: isItDark()
                                ? ColorManager.dark
                                : ColorManager.white,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22)),
                                        child: widget.restaurant.pic != null
                                            ? CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    "https://project1.amit-learning.com/restaurent/${widget.restaurant.pic!.split("/").last}",
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                                height: 11.h,
                                              )
                                            : Image.asset(
                                                ImageAssets.errorImage),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        widget.restaurant.name ?? "error",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontFamily: FontFamilies
                                                    .bentonSansBold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(ImageAssets.locationIcon),
                                  SizedBox(
                                    width: 1.5.w,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
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
                                      widget.restaurant.tags1 ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontFamily: FontFamilies
                                                  .bentonSansMedium),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
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
                                      widget.restaurant.tags2 ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontFamily: FontFamilies
                                                  .bentonSansMedium),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
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
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.iconMap,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    '19 Km',
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
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              if (foods != null)
                                Row(
                                  children: [
                                    Text(
                                      AppStrings.popularMenu,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              fontFamily:
                                                  FontFamilies.bentonSansBold),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              if (foods != null)
                                SizedBox(
                                  width: 100.w,
                                  height: 25.h,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        borderRadius: BorderRadius.circular(15),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MultiBlocProvider(
                                                providers: [
                                                  BlocProvider<
                                                      ProfileCubit>.value(
                                                    value:
                                                        getIt<ProfileCubit>(),
                                                  ),
                                                ],
                                                child: FoodScreen(
                                                  food: foods![index],
                                                  restaurant: widget.restaurant,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: isItDark()
                                                ? ColorManager.liteGray
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ColorManager
                                                      .whiteShadow
                                                      .withOpacity(.07),
                                                  offset: const Offset(12, 26),
                                                  blurRadius: 50)
                                            ],
                                          ),
                                          width: 40.w,
                                          height: 20.h,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 30.w,
                                                height: 12.h,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: foods![index].pic != null
                                                    ? CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            "https://project1.amit-learning.com/food/${foods![index].pic!.split("/").last}",
                                                        placeholder: (context,
                                                                url) =>
                                                            const Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                      )
                                                    : Image.asset(
                                                        ImageAssets.errorImage),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Text(
                                                foods![index].name ?? "error",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .copyWith(
                                                      fontFamily: FontFamilies
                                                          .bentonSansMedium,
                                                    ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Text(
                                                '\$${foods![index].price}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .copyWith(
                                                        color: ColorManager
                                                            .darkOrange,
                                                        fontFamily: FontFamilies
                                                            .bentonSansBold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            SizedBox(
                                      width: 10.w,
                                    ),
                                    itemCount: foods!.length,
                                  ),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is LoadingData) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            );
          } else if (state is ErrorData) {
            return Center(
              child: Text((state).errorMassage),
            );
          }
          return Container();
        },
      ),
    );
  }
}
