import 'package:e_lib_admin/Utils/app_routes.dart';
import 'package:get/state_manager.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    splashWait();
    super.onInit();
  }

  void splashWait() {
    Future.delayed(Duration(seconds: 2)).then((onValue) {
      print("Splash done");
      AppRoutes.moveOffAllScreen("/homeScreen");
    });
  }
}
