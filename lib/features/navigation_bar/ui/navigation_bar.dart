import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/navigation_bar/logic/navigation_cubit.dart';
import 'package:foodninja/main.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sizer/sizer.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  late List<Widget> screens;
  @override
  void initState() {
    screens = NavigationCubit.get(context).screen;
    super.initState();
  }

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: screens,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(15),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: isItDark()
                        ? ColorManager.darkShadow.withOpacity(.1)
                        : ColorManager.whiteShadow.withOpacity(.1),
                    //   offset: const Offset(12, 26),
                    blurRadius: 50,
                  )
                ],
                color: isItDark() ? ColorManager.liteGray : ColorManager.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: GNav(
                gap: 10,
                tabBorderRadius: 12,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                tabBackgroundGradient: LinearGradient(colors: [
                  ColorManager.primaryColor.withOpacity(.1),
                  ColorManager.primaryColorLight.withOpacity(.1)
                ]),
                backgroundColor:
                    isItDark() ? ColorManager.liteGray : ColorManager.white,
                onTabChange: (value) {
                  NavigationCubit.get(context).changeIndex(newIndex: value);
                  controller.animateToPage(value,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                tabs: [
                  GButton(
                    textStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontFamily: FontFamilies.bentonSansMedium),
                    icon: Icons.home,
                    text: AppStrings.home,
                    leading: Opacity(
                        opacity:
                            NavigationCubit.get(context).index == 0 ? 1 : .5,
                        child: SvgPicture.asset(ImageAssets.home,
                            width: 25, height: 25)),
                  ),
                  GButton(
                    textStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontFamily: FontFamilies.bentonSansMedium),
                    icon: Icons.home,
                    text: AppStrings.profile,
                    leading: Opacity(
                      opacity: NavigationCubit.get(context).index == 1 ? 1 : .5,
                      child: SvgPicture.asset(ImageAssets.profile,
                          width: 25, height: 25),
                    ),
                  ),
                  GButton(
                    textStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontFamily: FontFamilies.bentonSansMedium),
                    icon: Icons.abc,
                    text: AppStrings.buy,
                    leading: Opacity(
                        opacity:
                            NavigationCubit.get(context).index == 2 ? 1 : .5,
                        child: SvgPicture.asset(ImageAssets.buy,
                            width: 25, height: 25)),
                  ),
                  GButton(
                    textStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontFamily: FontFamilies.bentonSansMedium),
                    icon: Icons.abc,
                    text: AppStrings.chat,
                    leading: Opacity(
                        opacity:
                            NavigationCubit.get(context).index == 3 ? 1 : .5,
                        child: SvgPicture.asset(ImageAssets.chat,
                            width: 25, height: 25)),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
