import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/network/routes_manager.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/chat/logic/cubit/chat_cubit.dart';
import 'package:foodninja/features/navigation_bar/logic/navigation_cubit.dart';
import 'package:foodninja/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Stack(
          children: [
            Transform.flip(
              flipX: isItArabic(),
              child: SvgPicture.asset(ImageAssets.pattern2, width: 100.w),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: isItArabic()
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Transform.flip(
                        flipX: isItArabic(),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            NavigationCubit.get(context)
                                .changeIndex(newIndex: 0);
                          },
                          child: SvgPicture.asset(
                            ImageAssets.back,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      AppStrings.chat,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: FontFamilies.bentonSansBold,
                          ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    if (ChatCubit.get(context).chat.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          ChatCubit.get(context).chatOpened();
                          Navigator.pushNamed(context, AppRoute.chat);
                        },
                        child: Container(
                          width: 90.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: isItDark()
                                ? ColorManager.liteGray
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      ColorManager.whiteShadow.withOpacity(.07),
                                  offset: const Offset(12, 26),
                                  blurRadius: 50)
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 2.w,
                              ),
                              Image.asset(
                                ImageAssets.delivery,
                                height: 8.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.delivery,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: isItDark()
                                                ? ColorManager.chatWhite
                                                : ColorManager.dark,
                                            fontFamily:
                                                FontFamilies.bentonSansMedium),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                    width: 30.w,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            ChatCubit.get(context)
                                                .chat
                                                .first
                                                .message,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  color: isItDark()
                                                      ? ColorManager.white
                                                          .withOpacity(.3)
                                                      : ColorManager.gray
                                                          .withOpacity(.3),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "${ChatCubit.get(context).chat.last.time.hour}:${ChatCubit.get(context).chat.last.time.minute}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          color: isItDark()
                                              ? ColorManager.white
                                                  .withOpacity(.3)
                                              : ColorManager.gray
                                                  .withOpacity(.3),
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
            if (ChatCubit.get(context).chat.isEmpty)
              Center(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(ImageAssets.chat,
                              width: 30.w, height: 15.h),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 10.w,
                              height: 10.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: ColorManager.liteRed,
                                border: Border.all(color: ColorManager.white),
                              ),
                              child: Center(
                                  child: Text(
                                "0",
                                style: Theme.of(context).textTheme.displayLarge,
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      GradientText(AppStrings.noMessages,
                          colors: const [
                            ColorManager.primaryColorLight,
                            ColorManager.primaryColor,
                          ],
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontFamily: FontFamilies.bentonSansBold,
                                  ))
                    ],
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
