import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/payment_controller.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Done", style: TextStyle(color: Color(0xFFFFCF23), fontSize: 16)),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSuccessIcon(),
            SizedBox(height: 50),
            Text(
              "Payment Successful",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color(0xFF494741)),
            ),
            SizedBox(height: 5),
            Text(
              "The recipient can check the balance in the funding wallet",
              style: TextStyle(fontSize: 12, color: Color(0xFF494741)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            _buildPaymentDetails(),

            Spacer(),
            _buildSendAnotherTransactionButton(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Image.asset("lib/assets/operators_icon/3 6.png");
  }

  Widget _buildPaymentDetails() {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFFCD434), // Bright Yellow
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1), // Black Border
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("To", controller.payID.value, controller.recipientName.value),
          SizedBox(height: 8),
          _buildDetailRow("Order ID", controller.orderID.value),
          SizedBox(height: 8),
          _buildDetailRow("Payment Method", controller.paymentMethod.value),
          SizedBox(height: 8),

          _buildDetailRow("Paid With", controller.amountPaid.value),
        ],
      ),
    ));
  }



  Widget _buildDetailRow(String title, String value, [String? subValue]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Left-Right alignment
        children: [
          Expanded(
            flex: 2, // Left side (Title)
            child: Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF7C7B77)),
            ),
          ),
          Expanded(
            flex: 3, // Right side (Value)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // Align to right
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF494741)),
                  textAlign: TextAlign.right,
                ),
                if (subValue != null)
                  Text(
                    subValue,
                    style: TextStyle(fontSize: 14, color: Color(0xFF494741)),
                    textAlign: TextAlign.right,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildSendAnotherTransactionButton() {
    return ElevatedButton(
      onPressed: () => Get.snackbar("Transaction", "Send another transaction"),
      style: ElevatedButton.styleFrom(
        backgroundColor:Color(0xFFFCD434),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text("Send another transaction", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xFF020203))),
    );
  }
}
