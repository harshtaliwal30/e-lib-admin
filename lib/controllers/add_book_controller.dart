import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AddBookController extends GetxController {
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController securityPercentController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
}
