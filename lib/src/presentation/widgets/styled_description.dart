import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledDescription extends StatelessWidget {
  const StyledDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Colors.transparent, Color(0xFFFFFFFF)],
        stops: [0.0, 0.6],
      ).createShader(bounds),
      child: Text(
        'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with the unrefined elegance of the natural world. Embrace "Natural Essence" for a truly organic transformation in your daily life.',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: Colors.black,
          height: 1.5,
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        maxLines: 6,
      ),
    );
  }
}
