import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mobile_top_up_controller.dart';


class MinutesOptionsWidget extends StatelessWidget {
  final MobileTopUpController controller;

  const MinutesOptionsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> minutesPackages = [
      {'min': '40 Minutes', 'price': '30 BDT','available':'3'},
      {'min': '50 Minutes', 'price': '50 BDT','available':'2'},
      {'min': '60 Minutes', 'price': '99 BDT','available':'1'},
      {'min': '100 Minutes', 'price': '199 BDT','available':'5'},
      {'min': '150 Minutes', 'price': '299 BDT','available':'3'},
      {'min': '200 Minutes', 'price': '399 BDT','available':'4'},
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: minutesPackages.length,
        itemBuilder: (context, index) {
          final package = minutesPackages[index];

          // Use Obx only for the part of the widget that depends on the observable state
          return Obx(() {
            final isSelected = controller.selectedMinutesPackage.value == package['min'];

            return GestureDetector(
              onTap: () => controller.selectedMinutesPackage.value = package['min']!,
              child: Card(
                color: isSelected ? Colors.yellow.shade50 : Colors.white,
                child: ListTile(
                  leading: CircleAvatar(child: Image.asset("lib/assets/operators_icon/Gp.png")),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(package['min']!,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      Text(package['price']!,  style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(package['available']!,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      Text("Available",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue
                        ),),// Adjust this as necessary
                    ],
                  ),
                  trailing: isSelected ? Icon(Icons.check, color: Colors.green) : null,
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
