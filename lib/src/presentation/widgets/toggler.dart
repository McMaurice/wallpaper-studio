import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';

class Toggler extends StatefulWidget {
  final String title;
  final String description;
  final bool useSwitch;

  const Toggler({
    super.key,
    required this.title,
    required this.description,
    this.useSwitch = true,
  });

  @override
  State<Toggler> createState() => _TogglerState();
}

class _TogglerState extends State<Toggler> {
  bool _isActive = false;

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: AppTextStyle.medium(size: 20.sp)),
                SizedBox(height: 8.h),
                Text(
                  widget.description,
                  style: AppTextStyle.regular(
                    size: 14.sp,
                    color: Color(0xFF9C9C9C),
                  ),
                ),
              ],
            ),

            widget.useSwitch
                ? Transform.scale(
                    scale: 0.8.sp,
                    child: Switch(
                      value: _isActive,
                      thumbColor: WidgetStateProperty.all(
                        AppColors.primaryColor,
                      ),
                      activeTrackColor: AppColors.secondaryColor,
                      inactiveTrackColor: AppColors.grey.withAlpha(
                        (1 * 50).toInt(),
                      ),
                      trackOutlineWidth: WidgetStateProperty.all(0.5.w),
                      onChanged: (value) {
                        setState(() {
                          _isActive = value;
                        });
                      },
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50.h,
                        width: 220.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFC8FFBD),
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.active,
                              height: 18.h,
                              width: 18.w,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFF168200),
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Activated',
                              style: AppTextStyle.medium(
                                size: 14.sp,
                                color: const Color(0xFF1BA400),
                              ),
                            ),
                          ],
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
