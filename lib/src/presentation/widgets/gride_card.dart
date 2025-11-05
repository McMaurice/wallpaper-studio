import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/core/utilities/formatters.dart';
import 'package:wallpaper_studio/src/core/utilities/icon_helper.dart';
import 'package:wallpaper_studio/src/models/category_model.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/widgets/glass_container.dart';

class GrideCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final bool? isFave;
  final VoidCallback? onBack;
  final bool forHomeView;
  final String? description;
  final int? quantity;

  const GrideCard({
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
  State<GrideCard> createState() => _GrideCardState();
}

class _GrideCardState extends State<GrideCard> {
  late bool _isFave;

  @override
  void initState() {
    super.initState();
    _isFave = widget.isFave!;
  }

  void _toggleFavorite() {
    setState(() {
      _isFave = !_isFave;
      final FavouritesModel newFav = FavouritesModel(
        imgPath: widget.imageUrl,
        name: widget.name,
      );
      if (_isFave) {
        if (!favourites.any((f) => f.imgPath == widget.imageUrl)) {
          favourites.add(newFav);
        }
      } else {
        favourites.removeWhere((f) => f.imgPath == widget.imageUrl);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.forHomeView
        ? ClipRRect(
            borderRadius: BorderRadius.circular(26.r),
            child: SizedBox(
              height: 290.h,
              width: 435.w,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                    left: 25.w,
                    bottom: 18.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: AppTextStyle.semiBold(
                            size: 24.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 4.h),

                        Text(
                          widget.description!,
                          style: AppTextStyle.regular(
                            size: 16.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        GlassContainer(
                          width: 110.w,
                          height: 26.h,
                          isGride: true,
                          circular: false,
                          child: Text(
                            '${widget.quantity} wallpapers',
                            style: AppTextStyle.regular(
                              size: 14.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: SizedBox(
              height: 290.h,
              width: 190.w,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () => widget.onBack!(),
                      child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
                    ),
                  ),

                  Positioned(
                    right: 12.w,
                    top: 12.h,
                    child: GestureDetector(
                      onTap: _toggleFavorite,
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

                  Positioned(
                    left: 16.w,
                    bottom: 48.h,
                    child: Text(
                      widget.name,
                      style: AppTextStyle.regular(
                        size: 24.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 16.w,
                    bottom: 16.h,
                    child: GlassContainer(
                      width: 75.w,
                      height: 25.h,
                      isGride: true,
                      circular: false,
                      child: Center(
                        child: Text(
                          removeLastCharacter(widget.name),
                          style: AppTextStyle.regular(
                            size: 14.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
