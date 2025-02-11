

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepositController extends GetxController {
  var selectedTab = 'Mobile Banking'.obs;
  var selectedMethod = ''.obs;
  var amount = ''.obs; // Keep amount as observable
  final TextEditingController amountController = TextEditingController(); // Separate TextEditingController

  final mobileBankingMethods = [
    {'name': 'bKash', 'image': 'asset/images/bkash.png'},
    {'name': 'Nagad', 'image': 'asset/images/nagad.png'},

  ];

  final bankTransferMethods = [
    {'name': 'Bank 1', 'image': 'asset/images/dbbl.png'},
    {'name': 'Bank 2', 'image': 'asset/images/islamic.png'},
  ];
}