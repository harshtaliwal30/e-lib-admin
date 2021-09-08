import 'package:e_lib_admin/models/book_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:get/state_manager.dart';

class HomePageController extends GetxController {
  var booksDataList = [].obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  fetchBooks() {
    DatabaseHandler().fetchBooks().then((value) {
      value.docs.forEach((element) {
        BookModel bookModel = BookModel.fromJson(element.data() as dynamic);
        booksDataList.add(bookModel);
      });
    });
  }
}
