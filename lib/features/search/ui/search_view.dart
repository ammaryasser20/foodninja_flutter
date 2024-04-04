import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';

import 'package:foodninja/features/home/ui/widget/title_with_searchbar.dart';
import 'package:foodninja/features/search/logic/cubit/search_cubit.dart';
import 'package:foodninja/features/search/ui/widget/search_result.dart';
import 'package:foodninja/features/search/ui/widget/select_item.dart';
import 'package:foodninja/features/widget/default_button.dart';
import 'package:foodninja/features/widget/search_text_form_field.dart';
import 'package:foodninja/main.dart';

import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.searchFor});
  final String? searchFor;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    SearchCubit.get(context).typeOfSearch(widget.searchFor ?? AppStrings.menu);
    super.initState();
  }

  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DefaultButton(
        width: 90.w,
        height: 7.h,
        text: AppStrings.search,
        onPressed: () {
          if (controller.text != '') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<SearchCubit>.value(
                      value: getIt<SearchCubit>(),
                    ),
                  ],
                  child: SearchResultScreen(
                    searchFor: SearchCubit.get(context).searchType,
                    textSearch: controller.text,
                  ),
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
                .showSnackBar(
              SnackBar(
                backgroundColor: ColorManager.orange,
                content: Text(AppStrings.typeWhatYouWantToSearchFor),
              ),
            );
          }
        },
      ),
      body: Stack(
        children: [
          Transform.flip(
              flipX: isItArabic(),
              child: SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWithSearchBar(),
                      SearchTextFormField(
                        controller: controller,
                        prefix: ImageAssets.iconSearch,
                        hintText: AppStrings.hintSearchTextFormFile,
                        wight: 90.w,
                        hight: 7.h,
                        fillColor: isItDark()
                            ? ColorManager.white.withOpacity(.1)
                            : ColorManager.orange.withOpacity(.1),
                        cursorColor: isItDark()
                            ? ColorManager.white
                            : ColorManager.orangeLight,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        AppStrings.type,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontFamily: FontFamilies.bentonSansBold,
                                ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          SelectItem(
                            text: AppStrings.restaurant,
                            onTap: () {
                              SearchCubit.get(context)
                                  .typeOfSearch(AppStrings.restaurant);
                            },
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          SelectItem(
                            text: AppStrings.menu,
                            onTap: () {
                              SearchCubit.get(context)
                                  .typeOfSearch(AppStrings.menu);
                            },
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
