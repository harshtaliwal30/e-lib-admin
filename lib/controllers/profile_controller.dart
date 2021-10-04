import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  TextEditingController libraryNameController = TextEditingController();
  TextEditingController libraryEmailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController libraryPhoneController = TextEditingController();
  var isSelected = [true, false].obs;
  var countryValue = "".obs;
  var stateValue = "".obs;
  var cityValue = "".obs;
  var address = "".obs;
}
