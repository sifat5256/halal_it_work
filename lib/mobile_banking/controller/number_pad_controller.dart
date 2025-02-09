import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

class NumberPadController extends GetxController {
  RxString countryCode = '+880'.obs;
  var phoneNumber = ''.obs;
  var amount = ''.obs;

  void addDigit(String digit) {
    if (amount.value.length < 6) {
      amount.value += digit;
    }
  }

  void deleteDigit() {
    if (amount.value.isNotEmpty) {
      amount.value = amount.value.substring(0, amount.value.length - 1);
    }
  }
}
