import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halal_it/amount/ui/enter_amount_screen.dart';
import 'package:halal_it/halalPay/ui/halal_pay_screen.dart';
import 'package:halal_it/history/ui/transaction_history_screen.dart';
import 'package:halal_it/mobile_top_up/ui/mobile_top_up_screen.dart';

import 'sendMoney/ui/send_money_screen.dart';
import 'sign_in/ui/pin_entry_screen.dart';
import 'success/ui/payment_success_screen.dart';
import 'wallet/ui/wallet_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:  PinEntryScreen(),
    );
  }
}
