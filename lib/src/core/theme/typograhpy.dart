import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';

class AppTextStyle {
  static TextStyle h1({Color? color, double? size}) {
    return TextStyle(
      fontSize: size ?? 60,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.primaryColor,
      fontFamily: 'ClashDisplay',
    );
  }

  static TextStyle h2({Color? color, double? size}) {
    return TextStyle(
      fontSize: size ?? 40,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.primaryColor,
      fontFamily: 'ClashDisplay',
    );
  }

  static TextStyle semiBold({Color? color, double? size}) =>
      GoogleFonts.poppins(
        fontSize: size ?? 24.sp,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle medium({Color? color, double? size}) => GoogleFonts.poppins(
    fontSize: size ?? 32.sp,
    fontWeight: FontWeight.w500,
    color: color ?? Colors.black,
  );

  static TextStyle regular({Color? color, double? size}) => GoogleFonts.poppins(
    fontSize: size ?? 16.sp,
    fontWeight: FontWeight.w400,
    color: color ?? Colors.black,
  );

  static TextStyle caption({Color? color, double? size}) => GoogleFonts.poppins(
    fontSize: size ?? 12.sp,
    fontWeight: FontWeight.w500,
    color: color ?? Colors.black,
  );
}
