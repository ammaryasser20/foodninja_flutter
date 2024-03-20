import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/routes_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';

import 'package:foodninja/features/home/ui/widget/food_item.dart';
import 'package:foodninja/features/home/ui/widget/restaurant_item.dart';

import 'package:foodninja/features/home/ui/widget/special_deal.dart';
import 'package:foodninja/features/home/ui/widget/title_with_searchbar.dart';
import 'package:foodninja/main.dart';

import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final token = CashHelper.getString(key: Keys.token);

    Future.wait([
      context.read<HomeCubit>().getAllRestaurant(token: token),
      context.read<HomeCubit>().getAllFood(token: token, activeLoading: false),
    ]);
    super.initState();
  }

  @override
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is LoadingData) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primaryColor,
            ),
          );
        } else if (state is ErrorData) {
          return Center(
            child: Text((state).errorMassage),
          );
        } else if (state is SuccessData) {
          return Stack(
            children: [
              Transform.flip(
                  flipX: isItArabic(),
                  child: SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: ListView(
                    children: [
                     const TitleWithSearchBar(),
                      SizedBox(
                        height: 1.h,
                      ),
                      const SpecialDeal(),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            AppStrings.restaurant,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontFamily: FontFamilies.bentonSansBold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              HelperFunction.pushName(
                                  AppRoute.exploreAllRestaurant);
                            },
                            child: Text(
                              AppStrings.viewMore,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: ColorManager.orangeTwo,
                                      fontFamily: FontFamilies.bentonSansBook),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      if (context.read<HomeCubit>().restaurants!.restaurant !=
                          null)
                        SizedBox(
                          width: 100.w,
                          height: 25.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: context
                                .read<HomeCubit>()
                                .restaurants!
                                .restaurant!
                                .take(3)
                                .length,
                            itemBuilder: (context, index) {
                              return RestaurantsItem(
                                restaurant: context
                                    .read<HomeCubit>()
                                    .restaurants!
                                    .restaurant![index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 10.w,
                              );
                            },
                          ),
                        ),
                      Row(
                        children: [
                          Text(
                            AppStrings.popularMenu,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontFamily: FontFamilies.bentonSansBold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              HelperFunction.pushName(AppRoute.exploreAllMenus);
                            },
                            child: Text(
                              AppStrings.viewMore,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: ColorManager.orangeTwo,
                                      fontFamily: FontFamilies.bentonSansBook),
                            ),
                          ),
                        ],
                      ),
                      if (context.read<HomeCubit>().foods != null)
                        SizedBox(
                          width: 100.w,
                          height: 14.h *
                              (context
                                      .read<HomeCubit>()
                                      .foods!
                                      .food!
                                      .take(3)
                                      .length +
                                  1),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: context
                                .read<HomeCubit>()
                                .foods!
                                .food!
                                .take(3)
                                .length,
                            itemBuilder: (context, index) {
                              return FoodItem(
                                food: context
                                    .read<HomeCubit>()
                                    .foods!
                                    .food![index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 2.h,
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
