
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;

  const GradientText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: 'ClashDisplay',
        ),
      ),
    );
  }
}
