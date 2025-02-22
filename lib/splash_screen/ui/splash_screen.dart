import 'dart:ui'; // Import for ImageFilter
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';




// Splash Screen UI
class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      body: Center(
        child: Stack(
          children: [
            // Full-screen Background Blur Effect with soft white color
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0), // Lighter blur effect
                child: Container(
                  color: Colors.white.withOpacity(0.3), // Soft white overlay with reduced opacity
                ),
              ),
            ),

            // Logo and Text Animation
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Animated Logo (Scaling)
                    ScaleTransition(
                      scale: controller.logoScaleAnimation,
                      child: FadeTransition(
                        opacity: controller.opacityAnimation,
                        child: Image.asset('asset/images/splash.png', width: 140), // Your Logo
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeTransition(
                      opacity: controller.opacityAnimation,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                          children: [
                            const TextSpan(text: "HALAL "),
                            TextSpan(text: "IT NETWORK", style: TextStyle(color: Colors.amber)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen (After Splash)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Screen", style: TextStyle(fontSize: 24))),
    );
  }
}
