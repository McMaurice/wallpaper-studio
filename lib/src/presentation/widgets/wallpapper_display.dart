import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/core/utilities/formatters.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gradient_text.dart';
import 'package:wallpaper_studio/src/presentation/widgets/preview_buttons.dart';

class WallpapperDisplay extends StatefulWidget {
  const WallpapperDisplay({super.key, required this.onBack});
  final VoidCallback onBack;
  @override
  State<WallpapperDisplay> createState() => _WallpapperDisplayState();
}

class _WallpapperDisplayState extends State<WallpapperDisplay> {
  @override
  Widget build(BuildContext context) {
    final String wallpaper = mainSelectedWalpper.imgPath;
    final String name = mainSelectedWalpper.name;
    final String category = removeLastCharacter(mainSelectedWalpper.name);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(43.r),
            color: AppColors.primaryColor,
            border: Border.all(
              color: AppColors.grey.withAlpha((1 * 50).toInt()),
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 177.w,
                      height: 210.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26.r),
                        border: Border.all(
                          color: AppColors.grey.withAlpha((1 * 50).toInt()),
                          width: 3,
                        ),
                        image: DecorationImage(
                          image: AssetImage(wallpaper),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      text: 'Your Active Wallpaper',
                      style: AppTextStyle.h1(size: 36.sp),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'This wallpaper is currently set as your active background',
                      style: AppTextStyle.regular(
                        size: 20.sp,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Category',
                                  style: AppTextStyle.regular(
                                    size: 16.sp,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Text(
                                  "- $category",
                                  style: AppTextStyle.medium(size: 16.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Selection',
                                  style: AppTextStyle.regular(
                                    size: 16.sp,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Text(
                                  "- $name",
                                  style: AppTextStyle.medium(size: 16.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 800.w),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => widget.onBack(),
                              child: PreviewButton(icon: AppIcons.open),
                            ),
                            SizedBox(width: 12.w),
                            PreviewButton(icon: AppIcons.subsettings),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
