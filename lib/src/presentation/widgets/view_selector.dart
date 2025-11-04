import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/utilities/icon_helper.dart';

class ViewSelector extends StatelessWidget {
  final bool isSelected;
  final String iconPath;
  final VoidCallback onPressed;

  const ViewSelector({
    super.key,
    required this.isSelected,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.secondaryColor.withAlpha((0.5 * 50).toInt())
              : AppColors.grey.withAlpha((0.5 * 50).toInt()),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: IconHelper(
          iconPath: iconPath,
          size: 24.sp,
          color: isSelected
              ? AppColors.secondaryAccent
              : AppColors.grey.withAlpha((0.5 * 150).toInt()),
        ),
      ),
    );
  }
}
