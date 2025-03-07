import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/mobile_top_up_controller.dart';

class CallRateOptionsWidget extends StatelessWidget {
  final MobileTopUpController controller;

  const CallRateOptionsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> callRatePackages = [
      {'data': '1GB', 'price': '30 BDT','available':'3'},
      {'data': '2GB', 'price': '50 BDT','available':'2'},
      {'data': '5GB', 'price': '99 BDT','available':'1'},
      {'data': '10GB', 'price': '199 BDT','available':'5'},
      {'data': '15GB', 'price': '299 BDT','available':'3'},
      {'data': '20GB', 'price': '399 BDT','available':'4'},
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: callRatePackages.length,
        itemBuilder: (context, index) {
          final package = callRatePackages[index];

          // Use Obx only for the part of the widget that depends on the observable state
          return Obx(() {
            final isSelected = controller.callRatedMinutesPackage.value == package['data'];

            return GestureDetector(
              onTap: () => controller.callRatedMinutesPackage.value = package['data']!,
              child: Card(
                color: isSelected ? Colors.yellow.shade50 : Colors.white,
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.wifi)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(package['data']!,
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
