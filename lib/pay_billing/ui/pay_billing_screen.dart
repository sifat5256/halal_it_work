import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../electricity_billing/ui/electricity_billing_screen.dart';



class PayBillScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Pay Your Bill'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Optional: Background color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Find the organization",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Optional: Background color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(

                          hintText: 'Enter organization type or name',
                          suffixIcon: Icon(Icons.arrow_forward),
                          border: InputBorder.none, // Removes the border

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Centers the content
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ElectricityBillScreen());
                      },
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16), // Adds padding inside the Card
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // Prevents unnecessary height
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.lightbulb, size: 50, color: Colors.amber),
                              SizedBox(height: 10),
                              Text(
                                'Electricity',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


