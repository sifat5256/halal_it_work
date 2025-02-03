import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmountController extends GetxController {
  var amount = "0".obs;

  void addDigit(String digit) {
    if (amount.value == "0" && digit != ".") {
      amount.value = digit;
    } else {
      amount.value += digit;
    }
  }

  void removeDigit() {
    if (amount.value.length > 1) {
      amount.value = amount.value.substring(0, amount.value.length - 1);
    } else {
      amount.value = "0";
    }
  }
}


