import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/payee_model.dart';

class SendMoneyController extends GetxController {
  // Sample list of recent payees
  var recentPayees = [
    Payee("724495911 (Halal ID)", "Mt_15"),
    Payee("724495942 (Halal ID)", "Md Noyon H"),
  ].obs;

  // Controllers for different input fields
  var emailPhoneController = TextEditingController();
  var payIDController = TextEditingController();
  var halalIDController = TextEditingController();

  // Track selected method
  var selectedMethod = "Email / Phone".obs;

  // Getters for selection checks
  bool get isEmailPhoneSelected => selectedMethod.value == "Email / Phone";
  bool get isPayIDSelected => selectedMethod.value == "Pay ID";
  bool get isHalalIDSelected => selectedMethod.value == "Halal ID";

  // Method to set selected method
  void setSelectedMethod(String method) {
    selectedMethod.value = method;
  }
}