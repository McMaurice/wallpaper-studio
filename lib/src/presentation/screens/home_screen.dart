import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/models/category_model.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_divider.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gride_card.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gradient_text.dart';
import 'package:wallpaper_studio/src/presentation/widgets/wallpapper_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Column(
                    children: [
                      mainSelectedWalpper.imgPath.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GradientText(
                                  text: 'Discover Beautiful Wallpapers',
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Discover curated collections of stunning wallpapers. Browse by \n'
                                  'category, preview in full-screen, and set your favorites.',
                                  style: AppTextStyle.regular(
                                    size: 24.sp,
                                    color: AppColors.grey.withAlpha(
                                      (1 * 250).toInt(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50.h),
                              ],
                            )
                          : WallpapperDisplay(
                              onBack: () => setState(() {
                                mainSelectedWalpper = FavouritesModel(
                                  imgPath: "",
                                  name: "",
                                );
                              }),
                            ),
                    ],
                  ),

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
                          quantity: categories[index].amount,
                          forHomeView: true,
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
