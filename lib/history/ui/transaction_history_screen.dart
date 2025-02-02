import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/success/ui/payment_success_screen.dart';
import '../controller/transaction_controller.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final TransactionController controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text("History", style: TextStyle(fontWeight: FontWeight.bold)),

      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabs(),
                Image.asset("lib/assets/operators_icon/calenda.png",color: Color(0xFF454D5A),)
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(child: _buildTransactionList()),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ["All", "Paid", "Received"].map((tab) {
        bool isSelected = controller.selectedTab.value == tab;
        return GestureDetector(
          onTap: () => controller.selectedTab.value = tab,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFF1E1700) : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              tab,
              style: TextStyle(
                color: isSelected ?Color(0xFFF3F3F3) : Color(0xFF1E1700),
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            ),
          ),
        );
      }).toList(),
    ));
  }

  Widget _buildTransactionList() {
    return Obx(() => ListView.builder(
      itemCount: controller.filteredTransactions.length,
      itemBuilder: (context, index) {
        var tx = controller.filteredTransactions[index];

        return ListTile(
          onTap: (){
            Get.to(PaymentSuccessScreen());
          },
          leading: Icon(
            tx["icon"] == "lock" ? Icons.lock_outline : Icons.arrow_downward,
            color: tx["icon"] == "lock" ? Color(0xFF78797A) :  Color(0xFF78797A)
          ),
          title: Text(tx["type"]!, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xFF1E1700))),
          subtitle: Text("${tx["date"]} ${tx["time"]}",style: TextStyle(
            fontSize: 13,
            color: Color(0xFF494741)
          ),),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(tx["amount"]!, style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF1E1700),fontSize: 14)),
              Text(tx["status"]!, style: TextStyle(color: Color(0xFF2EBC87), fontSize: 10)),
            ],
          ),
        );
      },
    ));
  }
}
