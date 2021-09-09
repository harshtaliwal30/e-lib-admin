import 'package:e_lib_admin/models/book_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBookController extends GetxController {
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController securityPercentController = TextEditingController();
  final TextEditingController securityMoneyController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  void addBook() {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    BookModel bookModel = new BookModel(
      bookName: bookNameController.text,
      authorName: authorNameController.text,
      price: double.parse(priceController.text),
      percentSecurity: double.parse(securityPercentController.text),
      quantity: int.parse(quantityController.text),
      libraryID: "m6PGEiB3niFyQi75uRHI",
    );

    var data = bookModel.toJson();
    DatabaseHandler().addBook(data).then((value) {
      Get.back();
      Get.back(result: "bookAdded");
    });
  }
}
