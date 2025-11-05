import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/core/utilities/formatters.dart';
import 'package:wallpaper_studio/src/core/utilities/icon_helper.dart';
import 'package:wallpaper_studio/src/models/category_model.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'glass_container.dart';

class ListCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final bool? isFave;
  final VoidCallback? onBack;
  final bool forHomeView;
  final String? description;
  final int? quantity;

  const ListCard({
    super.key,
    required this.forHomeView,
    required this.imageUrl,
    required this.name,
    this.isFave = false,
    this.onBack,
    this.description,
    this.quantity,
  });

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  late bool _isFave;

  @override
  void initState() {
    super.initState();
    _isFave = widget.isFave!;
  }

  void _addFavourite() {
    setState(() {
      final FavouritesModel newFav = FavouritesModel(
        imgPath: widget.imageUrl,
        name: widget.name,
      );

      favourites.add(newFav);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.forHomeView
        ? Container(
            margin: EdgeInsets.only(bottom: 20.h),
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(
                        widget.imageUrl,
                        width: 277.w,
                        height: 185.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          widget.name,
                          style: AppTextStyle.medium(size: 30.sp),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          widget.description!,
                          style: AppTextStyle.regular(size: 16.sp),
                        ),
                        SizedBox(height: 19.h),
                        GlassContainer(
                          width: 130.w,
                          height: 30.h,
                          isGride: false,
                          circular: false,
                          child: Center(
                            child: Text(
                              '${widget.quantity} wallpapers',
                              style: AppTextStyle.regular(size: 14.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.only(top: 12.h),
                  width: double.infinity,
                  height: 1.2.h,
                  color: const Color(0xFFBDBDBD),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: 20.h),
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: GestureDetector(
                            onTap: () => widget.onBack!(),
                            child: Image.asset(
                              widget.imageUrl,
                              width: 277.h,
                              height: 185.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12.w,
                          top: 12.h,
                          child: GestureDetector(
                            onTap: _addFavourite,
                            child: _isFave
                                ? Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: IconHelper(
                                        iconPath: AppIcons.loveFill,
                                        size: 24.sp,
                                        color: _isFave
                                            ? AppColors.secondaryAccent
                                            : AppColors.primaryColor,
                                      ),
                                    ),
                                  )
                                : GlassContainer(
                                    width: 40.w,
                                    height: 40.h,
                                    isGride: true,
                                    circular: true,
                                    child: IconHelper(
                                      iconPath: AppIcons.loveFill,
                                      size: 24.sp,
                                      color: AppColors.secondaryAccent,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          widget.name,
                          style: AppTextStyle.medium(size: 30.sp),
                        ),
                        SizedBox(height: 4.h),
                        GlassContainer(
                          width: 130.w,
                          height: 30.h,
                          isGride: false,
                          circular: false,
                          child: Center(
                            child: Text(
                              removeLastCharacter(widget.name),
                              style: AppTextStyle.regular(size: 14.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.only(top: 12.h),
                  width: double.infinity,
                  height: 1.2.h,
                  color: AppColors.grey,
                ),
              ],
            ),
          );
  }
}
