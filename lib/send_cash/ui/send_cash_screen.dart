import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/mobile_banking/ui/mobile_banking_screen.dart';

class SendCashScreen extends StatelessWidget {
  const SendCashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],

        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          Image.asset("lib/assets/operators_icon/file.png",height: 25,width: 25,),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send Cash',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Color(0xFF000000)),
            ),
            const SizedBox(height: 10),
            const Text(
              'Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Color(0xFF7C7B77)),
            ),
            const SizedBox(height: 40),
            _buildOptionTile(
                Icons.account_balance_wallet,
                'Mobile banking',
                    () {
                  Get.to(MobileBankingScreen());
                    }
            ),
            const SizedBox(height: 20),
            _buildOptionTile(
                Icons.account_balance,
                'Bank',
                    () {}
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, Function onTap) {
    return Container(

      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF7C7B77),),
      ),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ListTile(

          leading: Icon(icon, color: Color(0xFFEEBE14)),
          title: Text(title, style: const TextStyle(fontSize: 16,color: Color(0xFF000000))),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18,color: Color(0xFF7C7B77),),
          onTap: () => onTap(),
        ),
      ),
    );
  }
}
