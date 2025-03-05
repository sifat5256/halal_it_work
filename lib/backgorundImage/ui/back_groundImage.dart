import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String backgroundImage;

  const BackgroundWidget({
    required this.child,
    required this.backgroundImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image with Blur Effect
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // Blur effect
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.fill,
            ),
          ),
        ),

        // Foreground Content (Your screen content)
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
