import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';

import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/widget/default_search_bar.dart';

import 'package:foodninja/features/widget/restaurant_item.dart';
import 'package:foodninja/features/home/ui/widget/title_with_searchbar.dart';

import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class ExploreAllRestaurant extends StatefulWidget {
  const ExploreAllRestaurant({super.key});

  @override
  State<ExploreAllRestaurant> createState() => _ExploreAllRestaurant();
}

class _ExploreAllRestaurant extends State<ExploreAllRestaurant> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    final token = CashHelper.getString(key: Keys.token);
    context.read<HomeCubit>().getAllRestaurant(token: token);
    context.read<HomeCubit>().getAllFood(token: token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SuccessData && context.read<HomeCubit>().foods != null) {
          return Scaffold(
            body: Stack(
              children: [
                Transform.flip(
                    flipX: isItArabic(),
                    child:
                        SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: ListView(
                      children: [
                        const TitleWithSearchBar(),
                        DefaultSearchBar(
                          onTab: () {
                            HelperFunction.pushToSearch(
                                searchFor: AppStrings.restaurant, context: context);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        if (context.read<HomeCubit>().restaurants != null)
                          SizedBox(
                            height: 17.h *
                                (context
                                        .read<HomeCubit>()
                                        .restaurants!
                                        .restaurant!
                                        .length +
                                    1),
                            width: 100.w,
                            child: GridView.builder(
                              itemCount: context
                                  .read<HomeCubit>()
                                  .restaurants!
                                  .restaurant!
                                  .length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 25.h,
                                      crossAxisSpacing: 5.w,
                                      mainAxisSpacing: 3.h,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => RestaurantItem(
                                restaurant: context
                                    .read<HomeCubit>()
                                    .restaurants!
                                    .restaurant![index],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
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
        } else {
          return Container();
        }
      },
    );
  }
}
