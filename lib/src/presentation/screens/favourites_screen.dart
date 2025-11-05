import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_appbar.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_buttons.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_divider.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gride_card.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gradient_text.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key, required this.onSectionChange});
  final Function(AppSection) onSectionChange;
  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      body: Stack(
        children: [
          CustomDivider(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 47.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 52.h),
                  GradientText(text: 'Saved Wallpapers'),
                  SizedBox(height: 8.h),
                  Text(
                    'Your saved wallpapers collection',
                    style: AppTextStyle.regular(size: 24.sp),
                  ),
                  SizedBox(height: 50.h),
                  favourites.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 144.h),
                              SvgPicture.asset(
                                AppIcons.emptyList,
                                width: 197.w,
                                height: 185.h,
                              ),
                              SizedBox(height: 50.h),
                              Text(
                                'No Saved Wallpapers',
                                style: AppTextStyle.medium(
                                  size: 24.sp,
                                  color: AppColors.grey,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                'Start saving your favorite wallpapers to see them here',
                                style: AppTextStyle.regular(
                                  size: 14.sp,
                                  color: AppColors.grey,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(
                                height: 50.h,
                                width: 200.w,
                                child: CustomButton(
                                  onBack: () =>
                                      widget.onSectionChange(AppSection.browse),
                                  text: 'Browse Wallpapers',
                                  forgroundColor: AppColors.primaryColor,
                                  backgroundColor: AppColors.secondaryColor,
                                  textSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: favourites.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                                mainAxisSpacing: 20.h,
                                crossAxisSpacing: 20.w,
                                childAspectRatio: 0.65,
                              ),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 290.h,
                              width: 190.w,
                              child: GrideCard(
                                imageUrl: favourites[index].imgPath,
                                name: favourites[index].name,
                                forHomeView: false,
                                isFave: true,
                                onBack: () {},
                              ),
                            );
                          },
                        ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
