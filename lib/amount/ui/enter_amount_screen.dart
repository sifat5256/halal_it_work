import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../add_note/ui/add_note_screen.dart';
import '../controller/amount_controller.dart';

class EnterAmountScreen extends StatelessWidget {
  final AmountController controller = Get.put(AmountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Amount",style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E1700)
        ),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),

          // Gold Text with Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/operators_icon/gold.png', width: 24, height: 24),
              SizedBox(width: 8),
              Text("Gold", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Image.asset('lib/assets/operators_icon/Vector (2).png', ),

            ],
          ),

          SizedBox(height: 16),
          Obx(() => Text(
            controller.amount.value,
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black),
          )),

          SizedBox(height: 8),
          Obx(() => Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("= ${controller.amount.value} taka", style: TextStyle(color: Colors.black, fontSize: 16)),
                SizedBox(width: 4),
                Icon(Icons.edit, size: 16, color: Colors.black),
              ],
            ),
          )),

          SizedBox(height: 12),
          TextButton(
            onPressed: () => showAddNoteBottomSheet(context),
            child: Text("Add Note", style: TextStyle(color: Colors.grey, fontSize: 16)),
          ),


          Spacer(),
          _buildNumberPad(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () =>showConfirmPaymentBottomSheet(context,""),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFCD434),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Continue", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildNumberPad() {
    List<String> buttons = [
      "1", "2", "3",
      "4", "5", "6",
      "7", "8", "9",
      ".", "0", "⌫"
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemCount: buttons.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (buttons[index] == "⌫") {
                    controller.removeDigit();
                  } else {
                    controller.addDigit(buttons[index]);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      buttons[index],
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
