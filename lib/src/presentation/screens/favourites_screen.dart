import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_divider.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gride_card.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gradient_text.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
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
                            children: [
                              SvgPicture.asset(
                                AppIcons.emptyList,
                                width: 197.w,
                                height: 185.h,
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          padding: EdgeInsets.only(right: 16.w),
                          itemCount: favourites.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 20.h,
                                crossAxisSpacing: 20.w,
                                childAspectRatio: 0.6,
                              ),
                          itemBuilder: (context, index) {
                            final formattedName = "Nature ${index + 1}";
                            return GrideCard(
                              imageUrl: favourites[index],
                              name: formattedName,
                              onBack: () {
                                setState(() {
                                  //  favourites.remove(index);
                                });
                              },
                              forHomeView: false,
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
