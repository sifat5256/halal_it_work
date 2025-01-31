import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/mobile_top_up/ui/mobile_top_up_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:  MobileTopUpScreen(),
    );
  }
}
