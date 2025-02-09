import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMoneyProcessingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image.asset('lib/assets/halal_service_icons/rocket.png', height: 160),
            SizedBox(height: 20),
            Text(
              'Send Money Processing',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Most operators will complete this process within 15min, however some can take up to days. You will be notified once the send money succeeds',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: Color(0xFF494741)),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                _buildStatusItem('Payment success', '10-16-2023 23:57:10', true, true),
                _buildStatusItem('Transfer in progress', '10-16-2023 23:57:09', false, true),
                _buildStatusItem('Send money success', '', true, false),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF494741),
                  width: 2
                ),
                color: Color(0xFFFCD434),
                borderRadius: BorderRadius.circular(12),

              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),

                child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    _buildInfoRow('To', '7774575455 (Pay ID)\n            MD-Antor-ali'),


                    _buildInfoRow('Order ID', '123134345345'),

                    _buildInfoRow('Payment Method', 'Funding Wallet'),

                    _buildInfoRow('Paid With', '500 BDT'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(String title, String subtitle, bool isActive, bool hasLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Color(0xFF494741) : Color(0xFFFFCF23),

              ),
            ),
            if (hasLine)
              Container(
                width: 1.5,
                height: 50,
                color: Color(0xFF86837A),
              ),
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xFF1E1700)),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Color(0xFF86837A)),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
       // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Color(0xFF7C7B77)),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16,color: Color(0xFF494741),fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
