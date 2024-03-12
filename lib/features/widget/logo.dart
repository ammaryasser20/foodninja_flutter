import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodninja/main.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SvgPicture.asset(
          ImageAssets.logo,
        ),
        GradientText(
          AppStrings.foodNinja,
          style: GoogleFonts.viga(fontSize: FontSize.s40),
          colors: const [
            ColorManager.primaryColorLight,
            ColorManager.primaryColor,
          ],
        ),
        Text(
          AppStrings.delieverFavoriteFood,
          style: GoogleFonts.inter(
              fontWeight: FontWeightManager.semiBold,
              fontSize: FontSize.s13,
              color: isItDark() ? ColorManager.white : ColorManager.dark),
        ),
      ],
    ));
  }
}
