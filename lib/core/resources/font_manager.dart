import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FontFamilies {
  static const String bentonSansBold = "BentonSans Bold";
  static const String bentonSansBook = "BentonSans Book";
  static const String bentonSansRegular = "BentonSans Regular";
  static const String bentonSansMedium = "BentonSans Medium";
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static double get s12 => 10.sp;
  static double get s13 => 11.sp;
  static double get s14 => 14;

  static double get s15 => 15;
  static double get s16 => 14.sp;
  static double get s20 => 18.sp;

  static double get s22 => 20.sp;
  static double get s23 => 23;
  static double get s27 => 25.sp;
  static double get s25 => 25;
  static double get s30 => 27.sp;
  static double get s33 => 33;
  static double get s40 => 35.sp;
}
