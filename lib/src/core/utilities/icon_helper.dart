import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconHelper extends StatelessWidget {
  final String iconPath;
  final double size;
  final Color? color;

  const IconHelper({
    super.key,
    required this.iconPath,
    required this.size,
    this.color = const Color(0xFF808080),
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: size.w,
      height: size.h,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
