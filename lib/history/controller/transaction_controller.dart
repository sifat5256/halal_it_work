import 'package:get/get.dart';

class TransactionController extends GetxController {
  var selectedTab = "All".obs;

  var transactions = [
    {"type": "Deposit", "date": "2023-09-05", "time": "10:01:59", "amount": "+1500000 BDT", "status": "Successful", "icon": "lock"},
    {"type": "Deposit", "date": "2023-09-23", "time": "10:01:59", "amount": "+500000 BDT", "status": "Successful", "icon": "lock"},
    {"type": "Received - Sagor Ali", "date": "2023-09-23", "time": "10:01:59", "amount": "+700000 BDT", "status": "Successful", "icon": "received"},
    {"type": "Received - Hridoy Khan", "date": "2023-09-23", "time": "10:01:59", "amount": "+35000 BDT", "status": "Successful", "icon": "received"},
    {"type": "Received - Shamima", "date": "2023-09-23", "time": "10:01:59", "amount": "+5000 BDT", "status": "Successful", "icon": "received"},
    {"type": "Received - Hridita", "date": "2023-09-23", "time": "10:01:59", "amount": "+25000 BDT", "status": "Successful", "icon": "received"},
    {"type": "Received - Shohan", "date": "2023-09-23", "time": "10:01:59", "amount": "+45000 BDT", "status": "Successful", "icon": "received"},
    {"type": "Deposit", "date": "2023-09-23", "time": "10:01:59", "amount": "+5000 BDT", "status": "Successful", "icon": "lock"},
  ].obs;

  List<Map<String, String>> get filteredTransactions => transactions
      .where((tx) =>
  selectedTab.value == "All" ||
      (selectedTab.value == "Paid" && tx["type"]!.contains("Deposit")) ||
      (selectedTab.value == "Received" && tx["type"]!.contains("Received")))
      .toList();
}
