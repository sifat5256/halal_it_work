import 'package:get/get.dart';

class MobileTopUpController extends GetxController {
  var selectedOperator = ''.obs;
  var selectedType = 'Prepaid'.obs;
  var selectedTab = 'Amount'.obs;
  var amount = ''.obs;
  var selectedInternetPackage = ''.obs;
  var selectedMinutesPackage = ''.obs;
  var callRatedMinutesPackage = ''.obs;
  var selectedComboPackage = ''.obs;
}
