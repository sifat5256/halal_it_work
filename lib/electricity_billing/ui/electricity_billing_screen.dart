import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/pay_bill_successfull/ui/pay_bill_successfull_screen.dart';

class ElectricityBillScreen extends StatefulWidget {
  @override
  _ElectricityBillScreenState createState() => _ElectricityBillScreenState();
}

class _ElectricityBillScreenState extends State<ElectricityBillScreen> {
  String selectedType = 'Postpaid';
  String selectedMonth = 'February';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Palli Bidyut ($selectedType)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Choice Chip for Prepaid & Postpaid
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: Text('Prepaid'),
                      selected: selectedType == 'Prepaid',
                      onSelected: (selected) {
                        setState(() {
                          selectedType = 'Prepaid';
                        });
                      },
                      selectedColor: Colors.yellow.shade700,
                      backgroundColor: Colors.grey.shade200,
                    ),
                    SizedBox(width: 10),
                    ChoiceChip(
                      label: Text('Postpaid'),
                      selected: selectedType == 'Postpaid',
                      onSelected: (selected) {
                        setState(() {
                          selectedType = 'Postpaid';
                        });
                      },
                      selectedColor: Colors.yellow.shade700,
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Select Billing Month
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Billing Month',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedMonth,
                        underline: SizedBox(),
                        items: ['January', 'February', 'March',"April","May","June","july"]
                            .map((month) => DropdownMenuItem(
                                  child: Text(month),
                          value: month,
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMonth = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Input Fields
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'SMS Account Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Amount',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16),

                    // Watch Video Button
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.play_arrow, color: Colors.yellow),
                        label: Text('Click to watch video',
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 60),

              GestureDetector(
                onTap: () {
                  Get.to(PayBillSuccessScreen());
                },
                child: Container(
                  color: Colors.yellow.shade700,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Proceed to Pay Bill',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

      // Bottom Payment Button

    );
  }
}
