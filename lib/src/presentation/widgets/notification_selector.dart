import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';

class NotificationSelector extends StatefulWidget {
  const NotificationSelector({super.key});

  @override
  State<NotificationSelector> createState() => _NotificationSelectorState();
}

class _NotificationSelectorState extends State<NotificationSelector> {
  bool isNotifying = false;

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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notification', style: AppTextStyle.medium(size: 20.sp)),
                SizedBox(height: 8.h),
                Text(
                  'Get notified about new wallpapers and updates',
                  style: AppTextStyle.regular(
                    size: 14.sp,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            Positioned(
              right: -9,
              top: -7,
              child: Transform.scale(
                scale: 0.8.sp,
                child: Switch(
                  value: isNotifying,
                  thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
                  activeTrackColor: AppColors.secondaryColor,
                  inactiveTrackColor: AppColors.grey.withAlpha(
                    (1 * 50).toInt(),
                  ),
                  trackOutlineWidth: WidgetStateProperty.all(0.5.w),
                  onChanged: (value) {
                    setState(() {
                      isNotifying = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
