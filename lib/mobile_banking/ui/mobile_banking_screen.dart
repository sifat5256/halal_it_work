import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:halal_it/mobile_banking/controller/number_pad_controller.dart';

import '../widget/confirm_bottom_sheet_widget.dart';

class MobileBankingScreen extends StatelessWidget {
  MobileBankingScreen({super.key});

  final NumberPadController controller = Get.put(NumberPadController());

  // Track which field is active
  final RxString activeField = 'amount'.obs; // Default to amount

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: const Text(
          'Mobile Banking',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          Image.asset("lib/assets/operators_icon/file.png",height: 25,width: 25,),
          SizedBox(width: 10,)
        ],
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Payment Method',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF7C7B77)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPaymentMethod('lib/assets/mobile_banking/bkashMB.png'),
                  const SizedBox(width: 10),
                  _buildPaymentMethod('lib/assets/mobile_banking/nagadMB.png'),
                ],
              ),
              const SizedBox(height: 20),

              // Phone Number Field
              const Text(
                'Phone Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Obx(
                    () => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300), // Optional: Add border for clarity
                  ),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      hintText: "Enter your phone",
                      filled: true,
                      fillColor: Colors.white, // Ensures white background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                    ),
                    initialCountryCode: controller.countryCode.value,
                    onCountryChanged: (country) {
                      controller.countryCode.value = country.dialCode;
                    },
                    onChanged: (phone) {
                      controller.phoneNumber.value = phone.number;
                    },
                  ),
                ),
              ),


              const SizedBox(height: 20),

              // Amount Field
              const Text(
                'Amount',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => activeField.value = 'amount',
                  child: Obx(() => Center(
                    child: _buildInputField(
                      controller.amount.value.isEmpty ? '0' : controller.amount.value,
                      activeField.value == 'amount',
                      suffix: 'BDT',
                    ),
                  )),
                ),
              ),
              const SizedBox(height: 20),

              // Number Pad
              _buildNumberPad(),
              const SizedBox(height: 20),

              // Next Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFCD434),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    showConfirmationBottomSheet(
                      amount: controller.amount.value,
                      price: '0.001',
                      phoneNumber: controller.phoneNumber.value,
                      paymentMethodImage: 'lib/assets/mobile_banking/bkash2.png',
                    );
                  },

                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for payment method icons
  Widget _buildPaymentMethod(String imagePath) {
    return SizedBox(
      height: 90,
      width: 125,
      child: Center(child: Image.asset(imagePath, fit: BoxFit.cover)),
    );
  }

  // Widget for input fields
  Widget _buildInputField(String value, bool isActive, {String? suffix}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: isActive ? Colors.blue : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          if (suffix != null)
            Text(
              suffix,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  // Custom Number Pad
  Widget _buildNumberPad() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.6,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            List<String> buttons = [
              '1', '2', '3',
              '4', '5', '6',
              '7', '8', '9',
              '', '0', '⌫',
            ];

            return GestureDetector(
              onTap: () {
                if (buttons[index] == '⌫') {
                  if (activeField.value == 'phoneNumber' && controller.phoneNumber.value.isNotEmpty) {
                    controller.phoneNumber.value = controller.phoneNumber.value.substring(0, controller.phoneNumber.value.length - 1);
                  } else if (activeField.value == 'amount' && controller.amount.value.isNotEmpty) {
                    controller.amount.value = controller.amount.value.substring(0, controller.amount.value.length - 1);
                  }
                } else if (buttons[index].isNotEmpty) {
                  if (activeField.value == 'phoneNumber') {
                    if (controller.phoneNumber.value.length < 11) { // Limit phone number length
                      controller.phoneNumber.value += buttons[index];
                    }
                  } else if (activeField.value == 'amount') {
                    controller.amount.value += buttons[index];
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFCBCBCB),
                ),
                child: Center(
                  child: Text(
                    buttons[index],
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
