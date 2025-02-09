import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMoneyPinController extends GetxController {
  var pin = ''.obs;

  void addDigit(String digit) {
    if (pin.value.length < 6) {
      pin.value += digit;
    }
  }

  void deleteDigit() {
    if (pin.value.isNotEmpty) {
      pin.value = pin.value.substring(0, pin.value.length - 1);
    }
  }
}



