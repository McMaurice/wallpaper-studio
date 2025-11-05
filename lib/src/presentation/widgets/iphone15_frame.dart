import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_studio/src/core/constants/app_icons.dart';
import 'package:wallpaper_studio/src/core/theme/app_colors.dart';
import 'package:wallpaper_studio/src/core/theme/typograhpy.dart';

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
                alignment: Alignment.center,
                children: [
                  if (widget.image != null)
                    Positioned.fill(
                      child: Image(image: widget.image!, fit: widget.fit),
                    ),
                  if (widget.image == null)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 50,
                          width: 220,
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFFCFFFC3,
                            ), 
                            borderRadius: BorderRadius.circular(
                              40,
                            ), 
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AppIcons.link,
                                height: 18,
                                width: 18,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF168200),
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Connected to device',
                                style: AppTextStyle.medium(
                                  size: 14,
                                  color: const Color(0xFF168200),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Click to disconnect',
                            style: AppTextStyle.medium(
                              size: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  Positioned(
                    bottom: 14,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        "assets/icons/bar.svg",
                        height: 3,
                        width: 84,
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
