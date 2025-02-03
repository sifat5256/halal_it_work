import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/amount/ui/enter_amount_screen.dart';
import '../controller/send_money_controller.dart';

class SendMoneyScreen extends StatelessWidget {
  final SendMoneyController controller = Get.put(SendMoneyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send to HalalCash user",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text("New Payee", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xFF1E1700))),
            SizedBox(height: 16),
            Row(
              children: [
                Obx(() => _buildSelectionButton("Email / Phone", controller.selectedMethod.value)),
                SizedBox(width: 16),
                Obx(() => _buildSelectionButton("Halal ID", controller.selectedMethod.value)),
              ],
            ),
            SizedBox(height: 26),
            Obx(() {
              if (controller.isEmailPhoneSelected) {
                return _buildTextField(controller.emailPhoneController, "Enter Email / Phone");
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(controller.halalIDController, "Enter Halal ID"),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Receiver can find Halal ID under Wallets → Funding Pay",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                        Text(
                          "where is it",
                          style: TextStyle(fontSize: 16, color: Color(0xFFC38714)),
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
            SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(EnterAmountScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFCD434),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF020202)),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text("Recent Payees", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: controller.recentPayees.length,
                itemBuilder: (context, index) {
                  final payee = controller.recentPayees[index];
                  return _buildPayeeTile(payee.id, payee.name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionButton(String text, String selected) {
    bool isSelected = text == selected;
    return GestureDetector(
      onTap: () => controller.setSelectedMethod(text),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _buildPayeeTile(String id, String name) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, color: Colors.black54),
      ),
      title: Text(id, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(name, style: TextStyle(color: Color(0xFF86837A))),
      onTap: () {},
    );
  }
}
