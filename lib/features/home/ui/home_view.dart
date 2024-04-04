import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/network/routes_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/widget/default_search_bar.dart';

import 'package:foodninja/features/widget/food_item.dart';
import 'package:foodninja/features/widget/restaurant_item.dart';

import 'package:foodninja/features/home/ui/widget/special_deal.dart';
import 'package:foodninja/features/home/ui/widget/title_with_searchbar.dart';
import 'package:foodninja/features/profile/logic/cubit/profile_cubit.dart';
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

    context.read<HomeCubit>().getAllRestaurant(token: token);
    context.read<HomeCubit>().getAllFood(token: token);
    ProfileCubit.get(context).getUserInfo();

    super.initState();
  }

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
        } else if (state is SuccessData &&
            context.read<HomeCubit>().foods != null &&
            context.read<HomeCubit>().restaurants != null) {
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
                      DefaultSearchBar(
                        onTab: () {
                          HelperFunction.pushToSearch(context: context);
                        },
                      ),
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
                      if (context.read<HomeCubit>().restaurants != null)
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
                              return RestaurantItem(
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
                                restaurant: context
                                    .read<HomeCubit>()
                                    .restaurants!
                                    .restaurant!
                                    .firstWhere(
                                        (element) =>
                                            '${element.id}' ==
                                            context
                                                .read<HomeCubit>()
                                                .foods!
                                                .food![index]
                                                .restaurantId,
                                        orElse: () => context
                                            .read<HomeCubit>()
                                            .restaurants!
                                            .restaurant![0]),
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
