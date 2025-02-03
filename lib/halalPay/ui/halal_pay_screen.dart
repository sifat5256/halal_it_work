import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/sendMoney/ui/send_money_screen.dart';

class HalalPayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCF23),
        elevation: 0,
        title: Text("Halal Pay",
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Icon(Icons.account_circle, color: Colors.black),
        actions: [
          Icon(Icons.headphones, color: Colors.black),
          SizedBox(width: 15)
        ],
      ),
      body: Column(
        children: [
          _buildBalanceSection(),
          _buildActionButtons(context),
          SizedBox(
            height: 10,
          ),
          _buildServiceOptions(),
          SizedBox(
            height: 30,
          ),
          _buildRecentTransaction(context),
        ],
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      color: Color(0xFFFFCF23),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Total Balance (BDT)", style: TextStyle(color: Color(0xFF494741), fontSize: 14)),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset("lib/assets/operators_icon/Vector (2).png",color: Color(0xFF494741),)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("৳ 50,000 Tk",
                        style: TextStyle(color: Color(0xFF1E1700), fontSize: 26, fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:   Color(0xFFFFCF23),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        elevation: 0, // Removed shadow
                      ),
                      child: Text("Deposit"),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text("My Pay ID: 111111", style: TextStyle(color: Color(0xFF1E1700), fontSize: 14)),
                    Image.asset("lib/assets/operators_icon/copy.png",color: Color(0xFF1E1700),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActionButtons(context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.17,
      color: Color(0xFFFFCF23),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildImageButton("lib/assets/operators_icon/send.png", "Send"),
          _buildImageButton("lib/assets/operators_icon/recv.png", "Receive"),
          _buildImageButton("lib/assets/operators_icon/Qr code scanner.png", "Scan to Pay"),
        ],
      ),
    );
  }

  Widget _buildImageButton(String imagePath, String label) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Get.to(SendMoneyScreen());
          },
          child: Container(
            width: 60, // Circular button size
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(16), // Ensures a perfect circular shape
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30), // Ensures the image stays within the circle
                child: Image.asset(
                  imagePath,
                  width: 25, // Adjust to fit inside the circular button
                  height: 25,
                  fit: BoxFit.cover,
                  color: Colors.black,// Ensures image fills the container
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }




  Widget _buildServiceOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildServiceIcon("lib/assets/halal_service_icons/send1.png", "Send Cash")),
          Expanded(child: _buildServiceIcon("lib/assets/halal_service_icons/gift.png", "Gift")),
          Expanded(child: _buildServiceIcon("lib/assets/operators_icon/mobiletoup.png", "Mobile Top Up")),
          Expanded(child: _buildServiceIcon("lib/assets/halal_service_icons/request_payment.png", "Request Payment")),
        ],
      ),
    );
  }

  Widget _buildServiceIcon(String imagePath, String label) {
    return Column(
      children: [
        Image.asset(imagePath, height: 35, width: 35, errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error, size: 30, color: Colors.red); // Placeholder for missing image
        }),
        SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12,color: Color(0xFF1E1700),fontWeight: FontWeight.bold)),
      ],
    );
  }


  Widget _buildRecentTransaction(context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.11,
          // width: 200,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // Reduced vertical space
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(12),

          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.1,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // Reduced vertical space
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),

          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.09,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // Reduced vertical space
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Light shadow
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 4), // Moves shadow downward
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.campaign, color: Colors.black, size: 24),
              Row(
                children: [
                // Similar to your icon
                  SizedBox(width: 10),
                  Text("Receive 10,000 Bdt",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 5),
                ],
              ),
              Text("2 hours ago", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }


}
