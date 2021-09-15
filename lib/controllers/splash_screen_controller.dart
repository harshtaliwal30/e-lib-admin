import 'package:e_lib_admin/Utils/app_routes.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    splashWait();
    super.onInit();
  }

  void splashWait() {
    Future.delayed(Duration(seconds: 2)).then((onValue) {
      print("Splash done");
      SharedPreferences.getInstance().then((pref) {
        bool? isLogin = pref.getBool(Utils.KEY_ISLOGIN) != null ? pref.getBool(Utils.KEY_ISLOGIN) : false;
        if (isLogin!) {
          AppRoutes.moveOffAllScreen("/homeScreen");
        } else {
          AppRoutes.moveOffAllScreen("/loginScreen");
        }
      });
    });
  }
}
