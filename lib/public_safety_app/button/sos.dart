import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SOSController extends GetxController {
  var fillPercentage = 0.0.obs;
  Timer? _timer;

  void startFilling() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (fillPercentage.value < 1.0) {
        fillPercentage.value += 0.1; // Gradually increase fill
      } else {
        timer.cancel(); // Stop when fully filled
      }
    });


  }

  void resetFilling() {
    _timer?.cancel();
    fillPercentage.value = 0.0; // Reset animation
  }
}

class SOSButtonScreen extends StatelessWidget {
  final SOSController controller = Get.put(SOSController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black87,
      body: Center(
        child: GestureDetector(
          onLongPress: controller.startFilling,
          onLongPressUp: controller.resetFilling,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Animated Circular Fill Progress
              Obx(() => Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.red.withOpacity(controller.fillPercentage.value),
                      Colors.red.withOpacity(0.1),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(controller.fillPercentage.value),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              )),

              // Circular Progress Indicator
              Obx(() => SizedBox(
                width: 160,
                height: 160,
                child: CircularProgressIndicator(
                  value: controller.fillPercentage.value,
                  strokeWidth: 8,
                  backgroundColor: Colors.red.withOpacity(0.2),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )),

              // Outer Circular Border
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 5),
                ),
              ),

              // SOS Text
              Text(
                "SOS",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(color: Colors.red, blurRadius: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
