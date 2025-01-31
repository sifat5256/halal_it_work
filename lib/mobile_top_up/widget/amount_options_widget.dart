

import 'package:flutter/material.dart';

import '../controller/mobile_top_up_controller.dart';

class AmountOptionsWidget extends StatelessWidget {
  final MobileTopUpController controller;
   AmountOptionsWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          labelText: "Amount",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixText: "BDT",

        ),
        keyboardType: TextInputType.number,
        onChanged: (value) => controller.amount.value = value,
      ),
    );
  }
}
