import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_divider.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gride_card.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gradient_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      body: Stack(
        children: [
          CustomDivider(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  GradientText(text: 'Discover Beautiful Wallpapers'),
                  SizedBox(height: 8.h),
                  Text(
                    'Discover curated collections of stunning wallpapers. Browse by \n'
                    'category, preview in full-screen, and set your favorites.',
                    style: AppTextStyle.regular(
                      size: 24.sp,
                      color: AppColors.grey.withAlpha((1 * 250).toInt()),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: AppTextStyle.medium(size: 32.sp),
                      ),
                      Text(
                        'See All',
                        style: AppTextStyle.regular(
                          size: 24.sp,
                          color: AppColors.grey.withAlpha((1 * 250).toInt()),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // Fixed Grid Section
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: GrideCard(
                          imageUrl: categories[index].imgPath,
                          name: categories[index].name,
                          description: categories[index].description,
                          quantity: categories[index].amount, forHomeView: true,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
