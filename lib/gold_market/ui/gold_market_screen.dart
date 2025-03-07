import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:halal_it/gold_market/ui/buy_sell_gold_screen.dart';

import '../widget/custom_graph.dart';
import '../widget/price_car_widget.dart';
import '../widget/tab_bar_widget.dart';

class GoldMarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Image.asset("asset/currncey_chnge/currency_change.png"),
            SizedBox(
              width: 5,
            ),
            Text("GOLD/BDT",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
        actions: [
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            PriceCard(),
            SizedBox(height: 10),
            TabBarWidget(),
            SizedBox(height: 30),
            Row(
              children: [
                Image.asset("asset/currncey_chnge/currency_change.png"),
                SizedBox(width: 10,),
                Text("BDT",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),)
              ],
            ),
            SizedBox(
              height: 25,
            ),

            CustomGraph(),

            SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                    child: SizedBox()),
                Expanded(
                    flex:2,
                    child: _buildBuySellButtons()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuySellButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton("BUY", Colors.green, () {
          Get.to(GoldBuySellScreen());
        }),
        _buildButton("SELL", Colors.red, () {
          Get.to(GoldBuySellScreen());
        }),
      ],
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      onPressed: onTap,
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }

}
