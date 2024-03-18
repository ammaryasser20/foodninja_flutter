import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/home/ui/widget/search_text_form_field.dart';
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
    context.read<HomeCubit>().getAllRestaurant(token);
    super.initState();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is LoadingData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              );
            }
            if (state is ErrorData) {
              return Center(
                child: Text((state).errorMassage),
              );
            } else {
              return Stack(
                children: [
                  Transform.flip(
                      flipX: isItArabic(),
                      child:
                          SvgPicture.asset(ImageAssets.pattern2, width: 100.w)),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppStrings.homeScreenTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          fontFamily:
                                              FontFamilies.bentonSansBold),
                                ),
                              ),
                              Container(
                                width: 14.w,
                                height: 14.w,
                                decoration: BoxDecoration(
                                    color: isItDark()
                                        ? ColorManager.white.withOpacity(.1)
                                        : ColorManager.closeWhite,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      isItDark()
                                          ? BoxShadow(
                                              color: ColorManager.whiteShadow
                                                  .withOpacity(.07),
                                              offset: const Offset(12, 26),
                                              blurRadius: 50,
                                            )
                                          : BoxShadow(
                                              color: ColorManager
                                                  .shadowNotificationIconLite
                                                  .withOpacity(.2),
                                              offset: const Offset(11, 28),
                                              blurRadius: 50,
                                            )
                                    ]),
                                child: SvgPicture.asset(
                                  ImageAssets.iconNotification,
                                  fit: BoxFit.scaleDown,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SearchTextFormField(
                                cursorColor: isItDark()
                                    ? ColorManager.white
                                    : ColorManager.orangeLight,
                                prefix: ImageAssets.iconSearch,
                                hintText: AppStrings.hintSearchTextFormFile,
                                wight: 70.w,
                                hight: 6.h,
                                fillColor: isItDark()
                                    ? ColorManager.white.withOpacity(.1)
                                    : ColorManager.orange.withOpacity(.1),
                                controller: controller,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                width: 14.w,
                                height: 14.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: isItDark()
                                        ? ColorManager.white.withOpacity(.1)
                                        : ColorManager.orange.withOpacity(.1)),
                                child: SvgPicture.asset(
                                  ImageAssets.filterIcon,
                                  width: 7.w,
                                  height: 7.w,
                                  fit: BoxFit.none,
                                ),
                              )
                            ],
                          ),
                        //  Container(height: 30.h,width: 90.w,decoration: BoxDecoration(color: ),)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
