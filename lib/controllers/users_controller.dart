import 'package:e_lib_admin/models/user_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:get/state_manager.dart';

class UsersController extends GetxController {
  var usersList = [].obs;
  UserModel userModel = UserModel();
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<UserModel> fetchUserData(String userId) async {
    await DatabaseHandler().fetchUserData(userId).then((value) {
      Map<String, dynamic> docData = value.data() as dynamic;
      userModel = UserModel.fromJson(docData);
      userModel.userId = value.id;
    });
    return userModel;
  }

  Future<UserModel> fetchUsers() async {
    await DatabaseHandler().fetchUsers().then((value) {
      value.docs.forEach((element) {
        UserModel userDataModel = UserModel.fromJson(element.data() as dynamic);
        usersList.add(userDataModel);
      });
    });
    return userModel;
  }
}
