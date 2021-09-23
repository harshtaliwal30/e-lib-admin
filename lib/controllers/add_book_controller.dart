import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/models/book_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBookController extends GetxController {
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController securityPercentController = TextEditingController();
  final TextEditingController securityMoneyController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  Future<void> addBook() async {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    await SharedPreferences.getInstance().then((pref) async {
      BookModel bookModel = new BookModel(
        bookName: bookNameController.text,
        authorName: authorNameController.text,
        price: double.parse(priceController.text),
        percentSecurity: double.parse(securityPercentController.text),
        quantity: int.parse(quantityController.text),
        libraryId: pref.getString(Utils.KEY_LIBRARYID),
        createdAt: DateTime.now(),
      );
      var data = bookModel.toJson();
      String? bookDocId = await DatabaseHandler().addBook(data);
      bookModel.bookDocId = bookDocId;
      Get.back();
      Get.back(result: {
        "status": "bookAdded",
        "bookData": bookModel,
      });
    });
  }

  Future<void> updateBook(BookModel bookData) async {
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
      libraryId: bookData.libraryId,
      createdAt: bookData.createdAt,
    );

    var data = bookModel.toJson();
    DatabaseHandler().updateBook(data, bookData.bookDocId).then((value) {
      Get.back();
      Get.back(result: {
        "status": "bookUpdated",
        "bookData": bookModel,
      });
    });
  }
}
