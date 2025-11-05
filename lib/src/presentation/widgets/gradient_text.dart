import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const GradientText({required this.text, super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [AppColors.secondaryColor, AppColors.red],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width.w, bounds.height));
      },
      child: Text(
        text,
        style: style ?? AppTextStyle.h1(size: 60.sp),
      ),
    );
  }
}
