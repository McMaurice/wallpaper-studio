import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Iphone15Frame extends StatefulWidget {
  final ImageProvider image;
  final BoxFit fit;
  final bool showFrame;
  final Orientation orientation;

  const Iphone15Frame({
    super.key,
    required this.image,
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
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image(image: widget.image, fit: widget.fit),
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
