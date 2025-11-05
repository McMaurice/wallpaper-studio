import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_buttons.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_divider.dart';
import 'package:wallpaper_studio/src/presentation/widgets/iphone15_frame.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gradient_text.dart';
import 'package:wallpaper_studio/src/presentation/widgets/notification_selector.dart';
import 'package:wallpaper_studio/src/presentation/widgets/picture_quality_dropdown.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      body: Stack(
        children: [
          CustomDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 47.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 52.h),
                GradientText(text: 'Settings'),
                SizedBox(height: 8.h),
                Text(
                  'Customize your Wallpaper Studio experience',
                  style: AppTextStyle.regular(size: 24.sp),
                ),
                SizedBox(height: 50.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 47.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primaryColor,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 151.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 151.w),
                                Text(
                                  "Wallpaper Setup",
                                  style: AppTextStyle.medium(size: 24.sp),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  "Configure your wallpaper settings and enable auto-rotation",
                                  style: AppTextStyle.regular(size: 14.sp),
                                ),
                                SizedBox(height: 26.h),
                                const ImageQualityDropdown(),
                                SizedBox(height: 26.h),
                                const NotificationSelector(),
                                SizedBox(height: 26.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomButton(
                                      text: 'Cancel',
                                      forgroundColor: Colors.black,
                                      textSize: 14.sp,
                                    ),
                                    SizedBox(width: 20.w),
                                    CustomButton(
                                      text: 'Save Settings',
                                      forgroundColor: AppColors.primaryColor,
                                      textSize: 14.sp,
                                      backgroundColor:
                                          AppColors.secondaryAccent,
                                    ),
                                    SizedBox(width: 10.w),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 524.h,
                                    width: 258.w,
                                    child: Iphone15Frame(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 118.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
