import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/buy/ui/buy_screens.dart';
import 'package:foodninja/features/chat/logic/cubit/chat_cubit.dart';
import 'package:foodninja/features/chat/ui/chat_screen.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/home/ui/home_view.dart';
import 'package:foodninja/features/profile/logic/cubit/profile_cubit.dart';
import 'package:foodninja/features/profile/ui/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  static NavigationCubit get(context) => BlocProvider.of(context);
  int index = 0;

  void changeIndex({required int newIndex}) {
    index = newIndex;
    emit(ChangeIndex());
  }

  List<GButton> getTabs(BuildContext context) => [
        GButton(
          textStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontFamily: FontFamilies.bentonSansMedium),
          icon: Icons.home,
          text: AppStrings.home,
          leading: Opacity(
              opacity: index == 0 ? 1 : .5,
              child: SvgPicture.asset(ImageAssets.home, width: 25, height: 25)),
        ),
        GButton(
          textStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontFamily: FontFamilies.bentonSansMedium),
          icon: Icons.home,
          text: AppStrings.profile,
          leading: Opacity(
            opacity: index == 1 ? 1 : .5,
            child: SvgPicture.asset(ImageAssets.profile, width: 25, height: 25),
          ),
        ),
        GButton(
          textStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontFamily: FontFamilies.bentonSansMedium),
          icon: Icons.abc,
          text: AppStrings.buy,
          leading: BlocBuilder<BuyCubit, BuyState>(
            builder: (context, state) {
              return Stack(
                children: [
                  if (BuyCubit.get(context).order.isNotEmpty)
                    const SizedBox(
                      width: 30,
                    ),
                  Opacity(
                    opacity: index == 2 ? 1 : .5,
                    child: SvgPicture.asset(ImageAssets.buy,
                        width: 25, height: 25),
                  ),
                  if (BuyCubit.get(context).order.isNotEmpty)
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ColorManager.liteRed,
                          border: Border.all(color: ColorManager.white),
                        ),
                        child: Center(
                          child: Text(
                            "${BuyCubit.get(context).order.length}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: 9,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ),
        GButton(
          textStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontFamily: FontFamilies.bentonSansMedium),
          icon: Icons.abc,
          text: AppStrings.chat,
          leading: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Stack(
                children: [
                  if (ChatCubit.get(context).chat.isNotEmpty &&
                      !ChatCubit.get(context).isItViewed)
                    const SizedBox(
                      width: 30,
                    ),
                  Opacity(
                    opacity: index == 3 ? 1 : .5,
                    child: SvgPicture.asset(ImageAssets.chat,
                        width: 25, height: 25),
                  ),
                  if (ChatCubit.get(context).chat.isNotEmpty &&
                      !ChatCubit.get(context).isItViewed)
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ColorManager.liteRed,
                          border: Border.all(color: ColorManager.white),
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        )
      ];
  List<Widget> screen = [
    MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>.value(
          value: getIt<ProfileCubit>(),
        ),
        BlocProvider<HomeCubit>.value(
          value: getIt<HomeCubit>(),
        ),
      ],
      child: const HomeScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>.value(
          value: getIt<ChatCubit>(),
        ),
        BlocProvider<ProfileCubit>.value(
          value: getIt<ProfileCubit>(),
        ),
        BlocProvider<BuyCubit>.value(
          value: getIt<BuyCubit>(),
        ),
      ],
      child: const ProfileScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider<BuyCubit>.value(
          value: getIt<BuyCubit>(),
        ),
      ],
      child: const BuyScreen(),
    ),
    MultiBlocProvider(providers: [
      BlocProvider<ChatCubit>.value(
        value: getIt<ChatCubit>(),
      ),
    ], child: const ChatScreen())
  ];
}
