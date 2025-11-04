import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/screens/detail_screen.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_divider.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gride_card.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gradient_text.dart';
import 'package:wallpaper_studio/src/presentation/widgets/list_card.dart';
import 'package:wallpaper_studio/src/presentation/widgets/view_selector.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  bool isGride = true;
  bool isList = false;
  bool detailView = false;
  String category = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      body: !detailView
          ? Stack(
              children: [
                CustomDivider(),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        GradientText(text: 'Browse Categories'),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Explore our curated collections of stunning wallpapers',
                              style: AppTextStyle.regular(
                                size: 24.sp,
                                color: AppColors.grey.withAlpha(
                                  (1 * 250).toInt(),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                ViewSelector(
                                  isSelected: isGride,
                                  iconPath: 'assets/icons/gride.svg',
                                  onPressed: () => setState(() {
                                    isGride = true;
                                    isList = false;
                                  }),
                                ),
                                SizedBox(width: 8.w),
                                ViewSelector(
                                  isSelected: isList,
                                  iconPath: 'assets/icons/list.svg',
                                  onPressed: () => setState(() {
                                    isList = true;
                                    isGride = false;
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        // LIST OR GRIDE
                        isGride
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: categories.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 20.h,
                                      crossAxisSpacing: 20.w,
                                      childAspectRatio: 1.5,
                                    ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        detailView = true;
                                        category = categories[index].name;
                                      });
                                    },
                                    child: GrideCard(
                                      imageUrl: categories[index].imgPath,
                                      name: categories[index].name,
                                      description:
                                          categories[index].description,
                                      quantity: categories[index].amount,
                                      forHomeView: true,
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  final item = categories[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        detailView = true;
                                        category = item.name;
                                      });
                                    },
                                    child: ListCard(
                                      imageUrl: item.imgPath,
                                      name: item.name,
                                      description: item.description,
                                      quantity: item.amount, forHomeView: true,
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : DetailScreen(
              categoryName: category,
              onBack: () {
                setState(() {
                  detailView = false;
                });
              },
            ),
    );
  }
}
