
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/contract/ui/contract_screen.dart';
import 'package:halal_it/mobile_top_up/controller/mobile_top_up_controller.dart';
import 'package:halal_it/mobile_top_up/widget/amount_options_widget.dart';
import 'package:halal_it/mobile_top_up/widget/call_rate_options_widget.dart';
import 'package:halal_it/mobile_top_up/widget/internet_options_widget.dart';
import 'package:halal_it/mobile_top_up/widget/minutes_options_widget.dart';

import '../widget/combo_options_widget.dart';

class MobileTopUpScreen extends StatelessWidget {
  final MobileTopUpController controller = Get.put(MobileTopUpController());

   MobileTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),


      appBar: AppBar(
        backgroundColor: Color(0xFFF3F3F3),
        centerTitle: true,
        title: Text("Mobile Top Up",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.file_open)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6,right: 6),
              child: Column(
                children: [
                  /// Mobile Number Input Field
                  _buildMobileNumberInput(),
                  SizedBox(height: 15),
                  ///  Operator Selection Gp Airtel Robi etc
                  _buildOperatorSelection(),
                  SizedBox(height: 15),
                  ///  Prepaid / Postpaid / Skitto Selection
                  _buildTypeSelectionPrepaidPostpaid(),
                ],
              ),
            ),

            SizedBox(height: 15),
            /// Tab Selection (Amount, Combo, Internet, Call Rate.)
            _buildTabSelectionAmountComboInternet(),

            Spacer(),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  /// Mobile Number Input Field
  Widget _buildMobileNumberInput() {
    return Container(
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          labelText: "Mobile Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon:IconButton(
              onPressed: (){
                Get.to(ContactsScreen());
              }, icon:  Icon(Icons.contacts),)
        ),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  ///  Operator Selection with Images
  Widget _buildOperatorSelection() {
    List<Map<String, dynamic>> operators = [
      {'name': 'GP', 'image': 'lib/assets/operators_icon/grameen.png'},
      {'name': 'Airtel', 'image': 'lib/assets/operators_icon/airtel.png'},

      {'name': 'Banglalink', 'image': 'lib/assets/operators_icon/banglalink.png'},
      {'name': 'Robi', 'image': 'lib/assets/operators_icon/robi.png'},

      {'name': 'Telitalk', 'image': 'lib/assets/operators_icon/telitalk.png'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: operators.map((operator) {
        return GestureDetector(
          onTap: () => controller.selectedOperator.value = operator['name'],
          child: Obx(() => Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: controller.selectedOperator.value == operator['name']
                  ? Color(0xFFFCD434).withOpacity(0.6)
                  : Colors.white,
              border: Border.all(
                  color: controller.selectedOperator.value == operator['name']
                      ? Colors.blue
                      : Colors.grey),
            ),
            child: Image.asset(
              operator['image'],
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          )),
        );
      }).toList(),
    );
  }

  ///  Prepaid / Postpaid / Skitto Selection
  Widget _buildTypeSelectionPrepaidPostpaid() {
    List<String> types = ['Skitto', 'Prepaid', 'Postpaid'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Type",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align items at the start
          children: types.map((type) {
            return Obx(() => GestureDetector(
              onTap: () {
                controller.selectedType.value = type;
              },
              child: Container(
                margin: EdgeInsets.only(right: 10), // Add space between containers
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: controller.selectedType.value == type
                      ? Color(0xFFFCD434)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: controller.selectedType.value == type
                        ? Colors.grey.shade700
                        : Colors.grey,
                  ),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: controller.selectedType.value == type
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ));
          }).toList(),
        ),
      ],
    );
  }

  /// Tab Selection (Amount, Combo, Internet, Call Rate.)
  Widget _buildTabSelectionAmountComboInternet() {
    List<String> tabs = ['Amount', 'Combo', 'Minutes', 'Internet', 'Call Rate'];
    return Column(
      children: [
        Obx(() => Container(
          height: 40,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: tabs.map((tab) {
              return GestureDetector(
                onTap: () => controller.selectedTab.value = tab,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tab,
                      style: TextStyle(
                        fontWeight: controller.selectedTab.value == tab
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: controller.selectedTab.value == tab
                            ? Colors.black
                            : Colors.black,
                      ),
                    ),
                    if (controller.selectedTab.value == tab)
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 3,
                        width: 40,
                        color: Colors.black,
                      )
                  ],
                ),
              );
            }).toList(),
          ),
        )),
        SizedBox(height: 10),
        Obx(() {
          if (controller.selectedTab.value == 'Amount') {
            return AmountOptionsWidget(controller: controller);
          } else if (controller.selectedTab.value == 'Internet') {
            return InternetOptionsWidget(controller: controller,);
          }
          else if (controller.selectedTab.value == 'Minutes') {
            return MinutesOptionsWidget(controller: controller,);
          }
          else if (controller.selectedTab.value == 'Combo') {
            return ComboOptionsWidget(controller: controller,);
          }
          else if (controller.selectedTab.value == 'Call Rate') {
            return CallRateOptionsWidget(controller: controller,);
          }
          return SizedBox.shrink();
        }),
        SizedBox(height: 10),
      ],
    );
  }
  ///  Continue Button
  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFCD434),

        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // No rounded corners
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Tap To Continue",
              style: TextStyle(
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          Icon(Icons.arrow_forward_ios,color: Colors.black,)
        ],
      ),
    );
  }
}