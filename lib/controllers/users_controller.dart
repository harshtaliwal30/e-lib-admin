import 'package:e_lib_admin/models/user_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  UserModel userModel = UserModel();
  var isLoading = true.obs;

  Future<UserModel> fetchUserData(String userId) async {
    await DatabaseHandler().fetchUserData(userId).then((value) {
      Map<String, dynamic> docData = value.data() as dynamic;
      userModel = UserModel.fromJson(docData);
      userModel.userId = value.id;
    });
    return userModel;
  }
}
