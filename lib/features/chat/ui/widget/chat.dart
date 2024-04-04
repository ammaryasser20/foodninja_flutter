import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/chat/logic/cubit/chat_cubit.dart';
import 'package:foodninja/features/chat/ui/widget/text_field_chat.dart';
import 'package:foodninja/main.dart';
import 'package:sizer/sizer.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(
                alignment:
                    isItArabic() ? Alignment.centerRight : Alignment.centerLeft,
                child: Transform.flip(
                  flipX: isItArabic(),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      ImageAssets.back,
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              AppStrings.delivery,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color:
                      isItDark() ? ColorManager.chatWhite : ColorManager.dark,
                  fontFamily: FontFamilies.bentonSansMedium),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Image.asset(
                    ImageAssets.delivery,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isItDark()
                          ? [
                              ColorManager.dark.withOpacity(.8),
                              ColorManager.dark.withOpacity(0.0)
                            ]
                          : [
                              ColorManager.white.withOpacity(.8),
                              ColorManager.white.withOpacity(0.0)
                            ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: SvgPicture.asset(ImageAssets.pattern, width: 100.w)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: ChatCubit.get(context).chat.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: isItArabic()
                                ? ChatCubit.get(context).chat[index].code == 0
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft
                                : ChatCubit.get(context).chat[index].code == 0
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ChatCubit.get(context)
                                              .chat[index]
                                              .code ==
                                          0
                                      ? isItDark()
                                          ? ColorManager.white.withOpacity(.1)
                                          : ColorManager.chatWhite
                                      : ColorManager.primaryColor),
                              child: Text(
                                ChatCubit.get(context).chat[index].message,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: ChatCubit.get(context)
                                                    .chat[index]
                                                    .code ==
                                                0
                                            ? isItDark()
                                                ? ColorManager.white
                                                    .withOpacity(.8)
                                                : ColorManager.darkText
                                            : ColorManager.white
                                                .withOpacity(.8),
                                        fontFamily: FontFamilies.bentonSansBook,
                                        letterSpacing: .5),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 2.h,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldChat(),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
