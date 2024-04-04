import 'package:flutter/material.dart';
import 'package:foodninja/core/resources/color_manager.dart';

import 'package:foodninja/features/search/logic/cubit/search_cubit.dart';
import 'package:foodninja/main.dart';

class SelectItem extends StatelessWidget {
  const SelectItem({super.key, required this.onTap, required this.text});
  final Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: SearchCubit.get(context).searchType == text
                    ? ColorManager.primaryColor
                    : isItDark()
                        ? ColorManager.white.withOpacity(.1)
                        : ColorManager.darkOrange.withOpacity(.1)),
            color: isItDark()
                ? ColorManager.white.withOpacity(.1)
                : ColorManager.darkOrange.withOpacity(.1)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: isItDark()
                  ? ColorManager.white.withOpacity(.5)
                  : ColorManager.orangeLight),
        ),
      ),
    );
  }
}
