import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/deposit_controller.dart';

// Controller for Deposit Screen


// Deposit Screen UI
class DepositScreen extends StatelessWidget {
  final DepositController controller = Get.put(DepositController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        title:  Text("Deposit",style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          Image.asset("asset/images/file.png"),
          SizedBox(width: 10,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Tab Selection (Mobile Banking / Bank Transfer)
            Container(
              height: 50,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFD9D9D9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildToggleButton('Mobile Banking'),
                  _buildToggleButton('Bank Transfer'),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Text("Payment method",style: TextStyle(
              color: Color(0xFF7C7B77)
            ),),
            SizedBox(
              height: 15,
            ),

            // Payment Method Selection
            Obx(() => _buildPaymentMethods()),

            const SizedBox(height: 15),

            // Amount Input
            const Text("Amount", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18, color: Color(0xFF494741))),
            const SizedBox(height: 15),
            Container(
              color: Colors.white,
              child: TextField(

                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: controller.amountController,
                onChanged: (value) => controller.amount.value = value, // Update amount observable
                decoration: const InputDecoration(
                  suffixStyle: TextStyle(
                    fontSize: 17
                  ),
                  border: OutlineInputBorder(),
                  suffixText: "BDT",
                ),
              ),
            ),

           
            Spacer(),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),

                    backgroundColor: Color(0xFFFCD434)),
                onPressed: () {

                },
                child: const Text("Continue", style: TextStyle(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  // Toggle Button Widget
  Widget _buildToggleButton(String title) {
    return Obx(() => GestureDetector(
      onTap: () => controller.selectedTab.value = title,
      child: Container(
        height: 50,
        width: Get.width * 0.45,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: controller.selectedTab.value == title ? Color(0xFFEBBA4F) : Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(title, style: const TextStyle(color: Colors.black)),
      ),
    ));
  }

  // Payment Methods Grid (Only updates the selectedMethod)
  Widget _buildPaymentMethods() {
    final isMobileBanking = controller.selectedTab.value == 'Mobile Banking';
    final paymentMethods = isMobileBanking ? controller.mobileBankingMethods : controller.bankTransferMethods;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: paymentMethods.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        final method = paymentMethods[index];
        return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: GestureDetector(
            onTap: () => controller.selectedMethod.value = method['name']!,
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                border: Border.all(
                  
                  
                  color: controller.selectedMethod.value == method['name']! ? Colors.yellow : Colors.transparent,
                  
                  width: 2,
                ),
              ),

              child: Image.asset(method['image']!,fit: BoxFit.cover,),
            ),
          ),
        ));
      },
    );
  }
}
