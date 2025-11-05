import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';

class ModeSelector extends StatefulWidget {
  final String title;
  final String detail;
  final bool rectangle;

  const ModeSelector({
    super.key,
    required this.title,
    required this.detail,
    this.rectangle = false,
  });

  @override
  State<ModeSelector> createState() => _ModeSelectorState();
}

class _ModeSelectorState extends State<ModeSelector> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.grey.withAlpha((1 * 100).toInt()),
          width: 0.5.w,
        ),
      ),
      child: SizedBox(
        width: 569.w,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isActive = !isActive;
                });
              },
              child: Container(
                height: 24.w,
                width: 24.w,
                decoration: BoxDecoration(
                  borderRadius: widget.rectangle
                      ? BorderRadius.circular(4.r)
                      : null,
                  shape: widget.rectangle
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  border: Border.all(
                    color: isActive ? AppColors.secondaryAccent : Colors.grey,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 15.w,
                    width: 15.w,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.secondaryAccent
                          : Colors.transparent,

                      borderRadius: widget.rectangle
                          ? BorderRadius.circular(4.r)
                          : null,
                      shape: widget.rectangle
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: AppTextStyle.medium(size: 16.sp)),
                SizedBox(height: 4.h),
                Text(
                  widget.detail,
                  style: AppTextStyle.regular(
                    size: 14.sp,
                    color: Color(0xFF9C9C9C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
