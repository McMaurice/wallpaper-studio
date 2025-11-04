import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/utilities/icon_helper.dart';

class PreviewButton extends StatelessWidget {
  const PreviewButton({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Color(0xFFE5E5E5),
        
        borderRadius: BorderRadius.circular(11.r),
      ),
      child: IconHelper(
        iconPath: icon,
        size: 18.sp,
        color: AppColors.grey.withAlpha((1 * 150).toInt()),
      ),
    );
  }
}
