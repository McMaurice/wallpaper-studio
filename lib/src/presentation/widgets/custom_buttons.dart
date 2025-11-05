import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/core/utilities/icon_helper.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.onBack,
    this.icon,
    required this.text,
    required this.forgroundColor,
    this.backgroundColor,
    this.iconSize,
    this.textSize,
  });
  final VoidCallback? onBack;
  final String? icon;
  final String text;
  final double? textSize;
  final double? iconSize;
  final Color forgroundColor;
  final Color? backgroundColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 200.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10.sp),
          backgroundColor: widget.backgroundColor ?? Colors.transparent,
          foregroundColor: widget.forgroundColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21.dm),
            side: BorderSide(
              color:
                  widget.backgroundColor ??
                  AppColors.grey.withAlpha((0.5 * 100).toInt()),
              width: 1.w,
            ),
          ),
        ),
        onPressed: () => widget.onBack!(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              SizedBox(width: 10.w),
              IconHelper(
                iconPath: widget.icon!,
                size: widget.iconSize!,
                color: widget.forgroundColor,
              ),
            ],
            SizedBox(width: 10.w),
            Text(
              widget.text,
              style: AppTextStyle.medium(
                color: widget.forgroundColor,
                size: widget.textSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
