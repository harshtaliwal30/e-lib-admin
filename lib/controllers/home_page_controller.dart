import 'package:e_lib_admin/models/book_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var booksDataList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  void fetchBooks() async {
    await DatabaseHandler().fetchBooks().then((value) {
      value.docs.forEach((element) {
        BookModel bookModel = BookModel.fromJson(element.data() as dynamic);
        booksDataList.add(bookModel);
        isLoading(false);
      });
      // Get.back();
    });
  }
}
