import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/balance_widget.dart';


class WalletScreen extends StatefulWidget {
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funding',style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF1E1700),

        ),),

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceSection(),
            SizedBox(height: 16),
            _buildDepositWithdrawTransfer(context),

            SizedBox(height: 16),
            _buildFeatureIcons(),
            SizedBox(height: 16),
            Text('Available Balances',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Color(0xFF1E1700))),
            Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Color(0xFF21252E),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Hide 0 Balances',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: Color(0xFF494741))),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(child: BalanceListWidget()),
          ],
        ),
      ),
    );
  }

  Widget _buildDepositWithdrawTransfer(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.04,
                  width: MediaQuery.of(context).size.width*0.25,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                      color: Color(0xFFFBD533)
                  ),
                  child: Center(child: Text("Deposit",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E1700)
                  ),)),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.04,
                  width: MediaQuery.of(context).size.width*0.25,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF1E1700)
                  ),
                  child: Center(child: Text("Withdraw",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFF3F3F3)
                  ),)),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.04,
                  width: MediaQuery.of(context).size.width*0.25,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF1E1700)
                  ),
                  child: Center(child: Text("Transfer",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFF3F3F3)
                  ),)),
                ),
              )
            ],
          );
  }

  Widget _buildBalanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("lib/assets/operators_icon/eye (1).png"),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.01,
                ),
                Text('Total Balance',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.01,
                ),
                Container(
                  height: 27,
                  width: 70,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF1E1700),


                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('BDT',style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14
                        ),),
                        Image.asset("lib/assets/operators_icon/Vector (2).png",color: Colors.white,height: 10,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("lib/assets/operators_icon/file.png",height: 23,)
            
          ],
        ),
        Row(
          children: [
            Text('৳ ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
            Text('0.00',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
                width: MediaQuery.of(context).size.width*0.29),
            Text('Deposit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),

            //

          ],
        )
      ],
    );
  }



  Widget _buildFeatureIcons() {
    List<Map<String, dynamic>> features = [
      {'icon': "lib/assets/operators_icon/pay.png", 'label': 'Pay'},
      {'icon': "lib/assets/operators_icon/buisness.png", 'label': 'Business'},
      {'icon': "lib/assets/operators_icon/bank card 2.png", 'label': 'Card'},
      {'icon': "lib/assets/operators_icon/loan.png", 'label': 'Loan'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: features
          .map((feature) => Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFF21252E),
            child: Image.asset(feature['icon'], width: 35, height: 35),
          ),
          SizedBox(height: 4),
          Text(feature['label'],style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ],
      ))
          .toList(),
    );
  }

}
