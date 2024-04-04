import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';

import 'package:foodninja/features/widget/food_item.dart';
import 'package:foodninja/features/widget/restaurant_item.dart';
import 'package:foodninja/features/home/ui/widget/title_with_searchbar.dart';
import 'package:foodninja/features/search/logic/cubit/search_cubit.dart';
import 'package:foodninja/features/widget/default_search_bar.dart';
import 'package:foodninja/main.dart';

import 'package:sizer/sizer.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen(
      {super.key, required this.searchFor, required this.textSearch});
  final String searchFor;
  final String textSearch;
  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    if (widget.searchFor == AppStrings.menu) {
      SearchCubit.get(context).searchForFood(widget.textSearch);
    } else {
      SearchCubit.get(context).searchForRestaurant(widget.textSearch);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is LoadingSearchData) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            );
          } else if (state is SearchFallData) {
            return Center(child: Text(state.errorMassage));
          } else if (state is SearchFoodSuccessData) {
            return Stack(
              children: [
                Transform.flip(
                    flipX: isItArabic(),
                    child:
                        SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const TitleWithSearchBar(),
                          DefaultSearchBar(onTab: () {
                            Navigator.pop(context);
                          }),
                          SizedBox(
                            height: 2.h,
                          ),
                          if (state.foods.food!.isNotEmpty)
                            SizedBox(
                              width: 100.w,
                              height: 14.h * (state.foods.food!.length + 1),
                              child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.foods.food!.length,
                                itemBuilder: (context, index) {
                                  return FoodItem(
                                    food: state.foods.food![index],
                                    restaurant: SearchCubit.get(context)
                                        .restaurants
                                        .firstWhere(
                                            (element) =>
                                                '${element.id}' ==
                                                state.foods.food![index]
                                                    .restaurantId,
                                            orElse: () =>
                                                SearchCubit.get(context)
                                                    .restaurants[0]),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 2.h,
                                  );
                                },
                              ),
                            )
                          else
                            SizedBox(
                              height: 50.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                        width: 50.w,
                                        ImageAssets.searchNotFound),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    AppStrings.searchNotFound,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is SearchRestaurantSuccessData) {
            return Stack(children: [
              Transform.flip(
                  flipX: isItArabic(),
                  child: SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const TitleWithSearchBar(),
                        DefaultSearchBar(onTab: () {
                          Navigator.pop(context);
                        }),
                        SizedBox(
                          height: 2.h,
                        ),
                        if (state.restaurant.restaurant!.isNotEmpty)
                          SizedBox(
                            height: 17.h *
                                (state.restaurant.restaurant!.length + 1),
                            width: 100.w,
                            child: GridView.builder(
                              itemCount: state.restaurant.restaurant!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 25.h,
                                      crossAxisSpacing: 5.w,
                                      mainAxisSpacing: 3.h,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => RestaurantItem(
                                restaurant: state.restaurant.restaurant![index],
                              ),
                            ),
                          )
                        else
                          SizedBox(
                            height: 50.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Center(
                                  child: SvgPicture.asset(
                                      width: 50.w, ImageAssets.searchNotFound),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  AppStrings.searchNotFound,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ]);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
