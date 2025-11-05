import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_buttons.dart';
import 'package:wallpaper_studio/src/presentation/widgets/mode_selector.dart';
import 'package:wallpaper_studio/src/presentation/widgets/toggler.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(0)),
      ),
      width: 784.w,
      backgroundColor: AppColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.all(43.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wallpaper Setup", style: AppTextStyle.medium(size: 24.sp)),
              SizedBox(height: 8.h),
              Text(
                "Configure your wallpaper settings and enable auto-rotation",
                style: AppTextStyle.regular(size: 14.sp),
              ),
              SizedBox(height: 26.h),
              Toggler(
                title: 'Activate Wallpaper',
                description:
                    'Set the selected wallpaper as your \ndesktop background',
                useSwitch: false,
              ),
              SizedBox(height: 26.h),
              Text("Display mode", style: AppTextStyle.regular(size: 20.sp)),
              SizedBox(height: 8.h),
              ModeSelector(
                title: 'Fit',
                detail: 'Scale to fit without cropping',
              ),
              SizedBox(height: 8.h),
              ModeSelector(
                title: 'Fill',
                detail: 'Scale to fill the entire screen',
              ),
              SizedBox(height: 8.h),
              ModeSelector(
                title: 'Stretch',
                detail: 'Stretch to fill the screen',
              ),
              SizedBox(height: 8.h),
              ModeSelector(
                title: 'Tile',
                detail: 'Repeat the image to fill the screen',
              ),
              SizedBox(height: 26.h),
              Toggler(
                title: 'Auto - Rotation',
                description:
                    'Automatically change your wallpaper at regular intervals',
              ),
              SizedBox(height: 26.h),
              Text(
                "Advanced Settings",
                style: AppTextStyle.regular(size: 20.sp),
              ),
              SizedBox(height: 8.h),
              ModeSelector(
                title: 'Lock Wallpaper',
                detail: 'Prevent accidental changes',
                rectangle: true,
              ),
              SizedBox(height: 8.h),
              ModeSelector(
                title: 'Sync Across Devices',
                detail: 'Keep wallpaper consistent on all devices',
                rectangle: true,
              ),
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
                    backgroundColor: AppColors.secondaryAccent,
                  ),
                  SizedBox(width: 90.w),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
