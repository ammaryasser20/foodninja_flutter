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

import 'package:foodninja/features/widget/food_item.dart';
import 'package:foodninja/features/home/ui/widget/title_with_searchbar.dart';

import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class ExploreAllMenus extends StatefulWidget {
  const ExploreAllMenus({super.key});

  @override
  State<ExploreAllMenus> createState() => _ExploreAllMenus();
}

class _ExploreAllMenus extends State<ExploreAllMenus> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    final token = CashHelper.getString(key: Keys.token);
    context.read<HomeCubit>().getAllFood(token: token);
    context.read<HomeCubit>().getAllRestaurant(token: token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SuccessData &&
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
                          HelperFunction.pushToSearch(searchFor:AppStrings.menu,context: context);
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      if (context.read<HomeCubit>().foods != null)
                        SizedBox(
                          width: 100.w,
                          height: 14.h *
                              (context.read<HomeCubit>().foods!.food!.length +
                                  1),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                context.read<HomeCubit>().foods!.food!.length,
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
    ));
  }
}
