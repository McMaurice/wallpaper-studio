import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final bool isGride;
  final bool circular;
  final bool isFave;

  const GlassContainer({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    required this.isGride,
    required this.circular,
    this.isFave = false,
  });

  @override
  Widget build(BuildContext context) {
    return circular
        ? ClipOval(
            child: Container(
              width: width,
              height: height,
              color: isGride ? Colors.transparent : const Color(0x1A878787),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isGride
                            ? Colors.white.withAlpha((1.0 * 100).toInt())
                            : const Color(0x1A878787),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          isGride
                              ? Colors.white.withAlpha((0.2 * 100).toInt())
                              : const Color(0x1A878787),
                          isGride
                              ? Colors.white.withAlpha((0.2 * 100).toInt())
                              : const Color(0x1A878787),
                        ],
                      ),
                    ),
                  ),
                  Center(child: child),
                ],
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(30.r),
            child: Container(
              width: width,
              height: height,
              color: isGride ? Colors.transparent : Color(0x1A878787),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: isGride
                            ? AppColors.primaryColor.withAlpha(
                                (1.0 * 100).toInt(),
                              )
                            : Color(0x1A878787),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          isGride
                              ? AppColors.primaryColor.withAlpha(
                                  (0.2 * 100).toInt(),
                                )
                              : Color(0x1A878787),
                          isGride
                              ? AppColors.primaryColor.withAlpha(
                                  (0.2 * 100).toInt(),
                                )
                              : Color(0x1A878787),
                        ],
                      ),
                    ),
                  ),
                  Center(child: child),
                ],
              ),
            ),
          );
  }
}
