import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.h,
      left: 0.w,
      right: 0.w,
      child: Container(height: 1.5.h, color: Colors.grey.shade300),
    );
  }
}
