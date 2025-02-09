import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../enter_pin_for_send_money/ui/send_money_pin_screen.dart';

void showConfirmationBottomSheet({
  required String amount,
  required String price,
  required String phoneNumber,
  required String paymentMethodImage,

}) {

  Get.bottomSheet(
    Container(
      height:600,
      decoration: BoxDecoration(
        color: Color(0xFFFCD434), // Background color

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppBar with Back and Cancel Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Get.back(),
                ),
                const Text(
                  'Confirm Send Money',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xFF494741),fontSize: 12),
                  ),
                ),
              ],
            ),
          ),

          // White Box with Payment Details
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('Amount', '$amount BDT', isBold: true),
                _buildDetailRow('Price', '$price gm GOLD'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Image.asset(paymentMethodImage, height: 25),
                  ],
                ),
                const SizedBox(height: 8),
                _buildDetailRow('Phone Number', phoneNumber, isBold: true),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),

          // Terms & Conditions
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'By continuing, I accept the halal cash Pay Terms of Use and Mobile Banking Terms of Use',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Spacer(),

          // Continue Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Get.to(SendMoneyPinScreen());
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}

// Helper Widget for Detail Rows
Widget _buildDetailRow(String title, String value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF494741)),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold ,
          ),
        ),
      ],
    ),
  );
}
