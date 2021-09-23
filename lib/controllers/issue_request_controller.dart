import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/models/issue_request_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IssueRequestController extends GetxController {
  var issueRequestList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchIssueRequests();
    super.onInit();
  }

  void fetchIssueRequests() {
    issueRequestList.clear();
    SharedPreferences.getInstance().then((pref) {
      DatabaseHandler().fetchIssueRequests(pref.getString(Utils.KEY_LIBRARYID)).then((value) {
        value.docs.forEach((element) {
          Map<String, dynamic> docData = element.data() as dynamic;
          docData["bookDocId"] = element.id;
          IssueRequestModel issueRequestModel = IssueRequestModel.fromJson(docData);
          issueRequestList.add(issueRequestModel);
          isLoading(false);
        });
        isLoading(false);
      });
    });
  }
}
