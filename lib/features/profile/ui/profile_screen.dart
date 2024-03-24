import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/local_DB/cached_app.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/assets_manager.dart';

import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/routes_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/manger/cubit/manger_cubit.dart';
import 'package:foodninja/features/profile/logic/cubit/profile_cubit.dart';
import 'package:foodninja/features/profile/ui/widget/favorites_item.dart';
import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CachedApp cachedApp = getIt<CachedApp>();
  @override
  void initState() {
    ProfileCubit.get(context).getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccessGetAllInfo) {
            return Stack(
              children: [
                ProfileCubit.get(context).userImageString != ""
                    ? CachedNetworkImage(
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 65.h,
                        imageUrl: ProfileCubit.get(context).userImageString,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image.asset(
                        ImageAssets.profileImage,
                        height: 55.h,
                        width: 100.w,
                        fit: BoxFit.fill,
                      ),
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 40.h,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: ColorManager.darkOrange
                                          .withOpacity(.1),
                                      borderRadius:
                                          BorderRadius.circular(18.5)),
                                  child: Text(
                                    AppStrings.memberGold,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: ColorManager.darkOrange,
                                            fontFamily:
                                                FontFamilies.bentonSansMedium),
                                  ),
                                ),
                                const Spacer(),
                                Transform.flip(
                                  flipX: isItArabic(),
                                  child: IconButton(
                                    icon: SvgPicture.asset(ImageAssets.logout),
                                    onPressed: () {
                                      CashHelper.clear();
                                      cachedApp.clearCache();
                                      HelperFunction.pushNamedAndRemoveUntil(
                                          AppRoute.login);
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              ProfileCubit.get(context).user!.name ?? "error",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontFamily: FontFamilies.bentonSansBold,
                                  ),
                            ),
                            Text(
                              ProfileCubit.get(context).user!.email ?? "error",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: isItDark()
                                        ? ColorManager.white.withOpacity(0.3)
                                        : ColorManager.gray.withOpacity(.5),
                                    fontFamily: FontFamilies.bentonSansRegular,
                                  ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    MangerCubit.get(context)
                                        .darkMode(!isItDark());
                                  },
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: isItDark()
                                          ? ColorManager.white
                                          : ColorManager.dark),
                                  child: GradientText(
                                    isItDark()
                                        ? AppStrings.wightMode
                                        : AppStrings.darkMode,
                                    colors: const [
                                      ColorManager.primaryColorLight,
                                      ColorManager.primaryColor,
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: isItDark()
                                          ? ColorManager.white
                                          : ColorManager.dark),
                                  onPressed: () {
                                    MangerCubit.get(context).changeLanguage(
                                        isItArabic() ? "en" : "ar");
                                  },
                                  child: GradientText(
                                      colors: const [
                                        ColorManager.primaryColorLight,
                                        ColorManager.primaryColor,
                                      ],
                                      isItArabic()
                                          ? AppStrings.english
                                          : AppStrings.arabic),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            if (ProfileCubit.get(context)
                                .favoriteFoods
                                .isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.favorites,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          fontFamily:
                                              FontFamilies.bentonSansBold,
                                        ),
                                  ),
                                  ...ProfileCubit.get(context)
                                      .favoriteFoods
                                      .map((food) => FavoritesItem(food: food)),
                                  SizedBox(
                                    height: 12.h,
                                  )
                                ],
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            );
          } else if (state is ProfileError) {
            return Text(state.error);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
