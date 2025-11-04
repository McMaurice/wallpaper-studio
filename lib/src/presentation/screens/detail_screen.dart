import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/core/utilities/icon_helper.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_buttons.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_divider.dart';
import 'package:wallpaper_studio/src/presentation/widgets/device_frame.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gride_card.dart';
import 'package:wallpaper_studio/src/presentation/widgets/list_card.dart';
import 'package:wallpaper_studio/src/presentation/widgets/preview_buttons.dart';
import 'package:wallpaper_studio/src/presentation/widgets/styled_description.dart';
import 'package:wallpaper_studio/src/presentation/widgets/view_selector.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.categoryName,
    required this.onBack,
  });
  final String categoryName;
  final VoidCallback onBack;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isGride = true;
  bool isList = false;

  late String selectedImage;
  late String displayName;

  @override
  void initState() {
    super.initState();
    selectedImage = subImage.first;
    displayName = "${widget.categoryName} 1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccent,
      body: Column(
        children: [
          const CustomDivider(),
          SizedBox(height: 43.h),
          Expanded(
            child: Row(
              children: [
                // LEFT SIDE
                SizedBox(width: 40.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => widget.onBack(),
                        child: Row(
                          children: [
                            IconHelper(
                              iconPath: AppIcons.back,
                              size: 30.sp,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Back to Categories',
                              style: AppTextStyle.regular(
                                size: 20.sp,
                                color: AppColors.grey.withAlpha(
                                  (1 * 250).toInt(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nature',
                            style: AppTextStyle.h2(
                              size: 48.sp,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              ViewSelector(
                                isSelected: isGride,
                                iconPath: AppIcons.gride,
                                onPressed: () => setState(() {
                                  isGride = true;
                                  isList = false;
                                }),
                              ),
                              SizedBox(width: 8.w),
                              ViewSelector(
                                isSelected: isList,
                                iconPath: AppIcons.list,
                                onPressed: () => setState(() {
                                  isList = true;
                                  isGride = false;
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // Grid/List Section
                      Expanded(
                        child: isGride
                            ? GridView.builder(
                                padding: EdgeInsets.only(right: 16.w),
                                itemCount: subImage.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 20.h,
                                      crossAxisSpacing: 20.w,
                                      childAspectRatio: 0.6,
                                    ),
                                itemBuilder: (context, index) {
                                  final formattedName =
                                      "${widget.categoryName} ${index + 1}";
                                  return GrideCard(
                                    imageUrl: subImage[index],
                                    name: formattedName,
                                    onBack: () {
                                      setState(() {
                                        displayName = formattedName;
                                        selectedImage = subImage[index];
                                      });
                                    },
                                    forHomeView: false,
                                  );
                                },
                              )
                            : ListView.builder(
                                padding: EdgeInsets.only(right: 16.w),
                                itemCount: subImage.length,
                                itemBuilder: (context, index) {
                                  final formattedName =
                                      "${widget.categoryName} ${index + 1}";
                                  return ListCard(
                                    imageUrl: subImage[index],
                                    name: formattedName,
                                    onBack: () {
                                      setState(() {
                                        displayName = formattedName;
                                        selectedImage = subImage[index];
                                      });
                                    },
                                    forHomeView: false,
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 81.w),

                // RIGHT SIDE
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryColor,
                          Color(0xFFF8F8F8),
                          AppColors.primaryAccent,
                        ],
                        stops: [0.0, 0.3, 1.0],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            SizedBox(width: 40.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Preview',
                                    style: AppTextStyle.semiBold(size: 32.sp),
                                  ),
                                  SizedBox(height: 37.h),
                                  Text(
                                    'Name',
                                    style: AppTextStyle.regular(
                                      size: 14.sp,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    displayName,
                                    style: AppTextStyle.medium(size: 24.sp),
                                  ),
                                  SizedBox(height: 30.h),
                                  Text(
                                    'Tags',
                                    style: AppTextStyle.regular(
                                      size: 14.sp,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Wrap(
                                    spacing: 12.w,
                                    children: tags.map((tag) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.grey.withAlpha(
                                            (0.5 * 50).toInt(),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            24.r,
                                          ),
                                          border: Border.all(
                                            color: AppColors.grey.withAlpha(
                                              (0.5 * 50).toInt(),
                                            ),
                                            width: 0.0,
                                          ),
                                        ),
                                        child: Text(
                                          tag,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(height: 30.h),
                                  Text(
                                    'Description',
                                    style: AppTextStyle.regular(
                                      size: 14.sp,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  StyledDescription(),
                                  SizedBox(height: 37.h),
                                  Row(
                                    children: [
                                      PreviewButton(icon: AppIcons.open),
                                      SizedBox(width: 12.w),
                                      PreviewButton(icon: AppIcons.scale),
                                      SizedBox(width: 12.w),
                                      PreviewButton(icon: AppIcons.subsettings),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // SIMULATOR
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  SizedBox(height: 40.h),
                                  Padding(
                                    padding: EdgeInsetsGeometry.only(
                                      left: 40.w,
                                    ),
                                    child: Iphone15Frame(
                                      image: AssetImage(selectedImage),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 40.w),
                          ],
                        ),
                        SizedBox(height: 91.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 200.w,
                              child: CustomButton(
                                text: 'Save to Favourites',
                                forgroundColor: Colors.black,
                                textSize: 14.sp,
                                icon: AppIcons.love,
                                iconSize: 24.sp,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            SizedBox(
                              height: 50.h,
                              width: 200.w,
                              child: CustomButton(
                                text: 'Set to Wallpaper',
                                forgroundColor: AppColors.primaryColor,
                                textSize: 14.sp,
                                backgroundColor: AppColors.secondaryAccent,
                              ),
                            ),

                            SizedBox(width: 40.w),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 40.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
