import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/history/ui/transaction_history_screen.dart';
import '../controller/balance_controller.dart';

class BalanceListWidget extends StatelessWidget {
  final BalanceController controller = Get.put(BalanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(

      itemCount: controller.assets.length,
      itemBuilder: (context, index) {
        var asset = controller.assets[index];
        return Column(
          children: [
            ListTile(
              onTap: (){
                Get.to(TransactionHistoryScreen());
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(asset['icon']!),
                        radius: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.04,
                      ),
                      Text(
                        asset['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ],
                  ),

                  Text("0.00", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17)),
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BDT",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
                          SizedBox(height: 4),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Available", style: TextStyle(fontSize: 12,color: Color(0xFF494741),)),
                                  Text("0.00", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF1E1700),)),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Freeze", style: TextStyle(fontSize: 12,color: Color(0xFF494741),)),
                                  Text("0.00", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF1E1700),)),
                                ],
                              ),


                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),

            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: Color(0xFF494741),
            ),

          ],
        );
      },
    ));
  }
}
