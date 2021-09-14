import 'package:e_lib_admin/models/book_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
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
    booksDataList.clear();
    await DatabaseHandler().fetchBooks().then((value) {
      value.docs.forEach((element) {
        Map<String, dynamic> docData = element.data() as dynamic;
        docData["bookDocId"] = element.id;
        BookModel bookModel = BookModel.fromJson(docData);
        booksDataList.add(bookModel);
        isLoading(false);
      });
    });
  }

  void deleteBook(String id) async {
    await DatabaseHandler().deleteBook(id);
  }
}
