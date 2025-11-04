import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/core/utilities/formatters.dart';
import 'package:wallpaper_studio/src/core/utilities/icon_helper.dart';
import 'package:wallpaper_studio/src/presentation/screens/browse_screen.dart';
import 'package:wallpaper_studio/src/presentation/screens/favourites_screen.dart';
import 'package:wallpaper_studio/src/presentation/screens/home_screen.dart';
import 'package:wallpaper_studio/src/presentation/screens/settings_screen.dart';

enum AppSection { home, browse, favourites, settings }

extension AppSectionData on AppSection {
  Widget icon({Color color = Colors.black}) {
    final String path;
    switch (this) {
      case AppSection.home:
        path = AppIcons.home;
        break;
      case AppSection.browse:
        path = AppIcons.browse;
        break;
      case AppSection.favourites:
        path = AppIcons.favourite;
        break;
      case AppSection.settings:
        path = AppIcons.settings;
        break;
    }

    return IconHelper(iconPath: path, size: 20.sp, color: color);
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  AppSection _selected = AppSection.home;

  void _select(AppSection section) {
    setState(() => _selected = section);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.primaryColor,
        elevation: 10,
        title: Row(
          children: [
            SizedBox(width: 47.w),
            IconHelper(iconPath: AppIcons.logo, size: 14.sp, color: null),
            SizedBox(width: 8.w),
            Text("Wallpaper Studio", style: AppTextStyle.regular(size: 14)),
          ],
        ),
        actions: [
          ...AppSection.values.map(
            (section) => GestureDetector(
              onTap: () => _select(section),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16),
                  decoration: BoxDecoration(
                    color: _selected == section
                        ? AppColors.primaryAccent
                        : Colors.transparent,
                    border: Border.all(
                      color: _selected == section
                          ? Colors.black.withAlpha((0.5 * 50).toInt())
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      section.icon(
                        color: _selected == section
                            ? Colors.black
                            : AppColors.grey.withAlpha((1 * 150).toInt()),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        capitalizeFirst(section.name),
                        style: AppTextStyle.regular(
                          size: 14.sp,
                          color: _selected == section
                              ? Colors.black
                              : AppColors.grey.withAlpha((1 * 150).toInt()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 47.w),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Builder(
          builder: (_) {
            switch (_selected) {
              case AppSection.home:
                return HomeScreen();
              case AppSection.browse:
                return BrowseScreen();
              case AppSection.favourites:
                return FavouritesScreen();
              case AppSection.settings:
                return SettingsScreen();
            }
          },
        ),
      ),
    );
  }
}
