import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/models/book_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  var booksDataList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  void fetchBooks() {
    booksDataList.clear();
    SharedPreferences.getInstance().then((pref) {
      DatabaseHandler().fetchBooks(pref.getString(Utils.KEY_LIBRARYID)).then((value) {
        value.docs.forEach((element) {
          Map<String, dynamic> docData = element.data() as dynamic;
          docData["bookDocId"] = element.id;
          BookModel bookModel = BookModel.fromJson(docData);
          booksDataList.add(bookModel);
          isLoading(false);
        });
        isLoading(false);
      });
    });
  }

  void deleteBook(String id) async {
    await DatabaseHandler().deleteBook(id);
  }
}
