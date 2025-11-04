import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';
import 'package:wallpaper_studio/src/presentation/widgets/custom_buttons.dart';

class Iphone15Frame extends StatefulWidget {
  final ImageProvider? image;
  final BoxFit fit;
  final bool showFrame;
  final Orientation orientation;

  const Iphone15Frame({
    super.key,
    this.image,
    this.fit = BoxFit.cover,
    this.showFrame = true,
    this.orientation = Orientation.portrait,
  });

  @override
  State<Iphone15Frame> createState() => _Iphone15FrameState();
}

class _Iphone15FrameState extends State<Iphone15Frame> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DeviceFrame(
        device: Devices.ios.iPhone15Pro,
        isFrameVisible: widget.showFrame,
        orientation: widget.orientation,
        screen: Builder(
          builder: (context) {
            return Container(
              color: AppColors.primaryColor,
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  widget.image != null
                      ? Positioned.fill(
                          child: Image(image: widget.image!, fit: widget.fit),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              text: 'Connected to device',
                              textSize: 12,
                              forgroundColor: Color(0xFF168200),
                              icon: AppIcons.link,
                              iconSize: 15.sp,
                              backgroundColor: Color(
                                0xFF168200,
                              ).withAlpha((1 * 100).toInt()),
                            ),
                            SizedBox(height: 11.h),
                            GestureDetector(
                              onTap: (){},
                              child: Text(
                                'Click to disconnect',
                                style: AppTextStyle.medium(
                                  size: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                  Positioned(
                    bottom: 14.h,
                    left: 0.w,
                    right: 0.w,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 160.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/bar.svg",
                          height: 2.58.h,
                          width: 84.05.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
