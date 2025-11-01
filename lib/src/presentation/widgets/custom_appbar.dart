import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_studio/src/core/formatters.dart';
import 'package:wallpaper_studio/src/presentation/screens/browse_screen.dart';
import 'package:wallpaper_studio/src/presentation/screens/favourites_screen.dart';
import 'package:wallpaper_studio/src/presentation/screens/home_screen.dart';
import 'package:wallpaper_studio/src/presentation/screens/settings_screen.dart';

enum AppSection { home, browse, favourites, settings }

extension AppSectionData on AppSection {
  Widget icon({double size = 24, Color color = Colors.black}) {
    final String path;
    switch (this) {
      case AppSection.home:
        path = "assets/icons/home.svg";
        break;
      case AppSection.browse:
        path = "assets/icons/browse.svg";
        break;
      case AppSection.favourites:
        path = "assets/icons/favourites.svg";
        break;
      case AppSection.settings:
        path = "assets/icons/settings.svg";
        break;
    }

    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
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
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        title: Row(
          children: [
            const SizedBox(width: 47),
            SvgPicture.asset("assets/icons/logo.svg", height: 14, width: 14),
            const SizedBox(width: 8),
            Text(
              "Wallpaper Studio",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          ...AppSection.values.map(
            (section) => GestureDetector(
              onTap: () => _select(section),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  padding: const EdgeInsets.all(11.5),
                  decoration: BoxDecoration(
                    color: _selected == section
                        ? const Color.fromRGBO(245, 245, 245, 1)
                        : Colors.transparent,
                    border: Border.all(
                      color: _selected == section
                          ? Colors.black.withAlpha((0.5 * 100).toInt())
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      section.icon(
                        size: 24,
                        color: _selected == section
                            ? Colors.black
                            : Colors.grey.shade500,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        capitalizeFirst(section.name),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: _selected == section
                              ? Colors.black
                              : Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 47),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Builder(
          builder: (_) {
            switch (_selected) {
              case AppSection.home:
                return HomeScreen(isDesktop: isDesktop);
              case AppSection.browse:
                return BrowseScreen(isDesktop: isDesktop);
              case AppSection.favourites:
                return FavouritesScreen(isDesktop: isDesktop);
              case AppSection.settings:
                return SettingsScreen(isDesktop: isDesktop);
            }
          },
        ),
      ),
    );
  }
}
