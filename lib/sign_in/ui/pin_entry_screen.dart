import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/pin_controller.dart';

class PinEntryScreen extends StatelessWidget {
  final PinController controller = Get.put(PinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("lib/assets/app_bar_icon/app_icon.png", height: 50, width: 50),

        backgroundColor: Colors.grey[200],
        title: Text("Halal Cash Personal",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset("lib/assets/app_bar_icon/head_set.png",height: 50,width: 50,),
        )],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 40),
            Text("Enter Your PIN",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Please enter your pin to continue",
                style: TextStyle(color: Color(0xFF494741))),
            SizedBox(height: 30),

            /// PIN Display
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  6,
                      (index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Color(0xFFD9D9D9)),
                      ),
                      child: Center(
                        child: Text(
                          controller.pin.value.length > index ? '•' : '',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            )),
            SizedBox(height: 20),

            /// Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Use another account",
                    style: TextStyle(color: Color(0xFFEEBE14), fontSize: 14)),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.fingerprint, size: 40, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("I forget my pay pin . ",
                    style: TextStyle(color: Color(0xFF767268), fontSize: 14)),
                Text("Reset it now.",
                    style: TextStyle(color: Color(0xFFEEBE14), fontSize: 14)),
              ],
            ),
            Spacer(),

            /// Number Pad
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          controller.deleteDigit();
                        } else if (buttons[index].isNotEmpty) {
                          controller.addDigit(buttons[index]);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFCBCBCB),
                         
                        ),
                        child: Center(
                          child: Text(
                            buttons[index],
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            /// Continue Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFCD434),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text("Continue",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
