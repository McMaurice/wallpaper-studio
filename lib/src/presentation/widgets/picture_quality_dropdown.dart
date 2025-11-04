import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';

class ImageQualityDropdown extends StatefulWidget {
  const ImageQualityDropdown({super.key});

  @override
  State<ImageQualityDropdown> createState() => _ImageQualityDropdownState();
}

class _ImageQualityDropdownState extends State<ImageQualityDropdown> {
  String selectedQuality = 'High (Best Quality)';
  final List<String> qualities = ['Low', 'Medium', 'High (Best Quality)'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.grey.withAlpha((1 * 100).toInt()),
          width: 0.5.w,
        ),
      ),
      child: SizedBox(
        width: 569.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Image Quality', style: AppTextStyle.medium(size: 20.sp)),
          SizedBox(height: 8.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.grey.withAlpha((1 * 100).toInt()),
                width: 0.5.w,
              ),
            ),
            height: 36.h,
            alignment: Alignment.center,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedQuality,
                icon: const Icon(Icons.keyboard_arrow_down),
                isExpanded: true,
                dropdownColor: AppColors.primaryColor,
                items: qualities.map((quality) {
                  return DropdownMenuItem<String>(
                    value: quality,
                    child: Text(
                      quality,
                      style: AppTextStyle.regular(
                        size: 14.sp,
                        color: AppColors.grey,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedQuality = value;
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
