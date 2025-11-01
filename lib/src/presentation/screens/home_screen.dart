import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_studio/src/models/db.dart';
import 'package:wallpaper_studio/src/presentation/widgets/gradienr_text.dart';
import 'package:wallpaper_studio/src/presentation/widgets/wallpaper_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.isDesktop});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(height: 1.5, color: Colors.grey.shade300),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  GradientText(text: 'Discover Beautiful Wallpapers'),
                  SizedBox(height: 8.h),
                  Text(
                    'Discover curated collections of stunning wallpapers. Browse by \n'
                    'category, preview in full-screen, and set your favorites.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 32.sp,
                        ),
                      ),
                      Text(
                        'See All',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 24.sp,
                          color: const Color.fromRGBO(128, 128, 128, 1),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1.5,
                        ),
                    itemBuilder: (context, index) {
                      return WallPaperCard(
                        imageUrl: categories[index].imgPath,
                        name: categories[index].name,
                        description: categories[index].description,
                        quantity: categories[index].amount,
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
