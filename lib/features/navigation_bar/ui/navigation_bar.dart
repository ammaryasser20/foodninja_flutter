import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/resources/color_manager.dart';
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
        return PopScope(
          canPop: NavigationCubit.get(context).index == 0,
          onPopInvoked: (didPop) {
            if (NavigationCubit.get(context).index != 0) {
              controller.animateToPage(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
              NavigationCubit.get(context).changeIndex(newIndex: 0);
            } else {
              Navigator.pop(context);
            }
          },
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            extendBody: true,
            body: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: screens,
            ),
            floatingActionButton: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              padding: const EdgeInsets.all(15),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: isItDark()
                        ? ColorManager.darkShadow.withOpacity(.1)
                        : ColorManager.whiteShadow.withOpacity(.1),
                    blurRadius: 50,
                  )
                ],
                color: isItDark() ? ColorManager.liteGray : ColorManager.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: GNav(
                gap: 10,
                tabBorderRadius: 12,
                selectedIndex: NavigationCubit.get(context).index,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
                tabBackgroundGradient: LinearGradient(
                  colors: [
                    ColorManager.primaryColor.withOpacity(.1),
                    ColorManager.primaryColorLight.withOpacity(.1)
                  ],
                ),
                backgroundColor:
                    isItDark() ? ColorManager.liteGray : ColorManager.white,
                onTabChange: (value) {
                  NavigationCubit.get(context).changeIndex(newIndex: value);
                  controller.animateToPage(value,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                tabs: NavigationCubit.get(context).getTabs(context),
              ),
            ),
          ),
        );
      },
    );
  }
}
