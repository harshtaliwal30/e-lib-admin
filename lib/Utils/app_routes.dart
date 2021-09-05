import 'package:e_lib_admin/screens/home_screen.dart';
import 'package:e_lib_admin/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreenRoute = "/splashScreen";
  static const String homeScreenRoute = "/homeScreen";

  static routes() {
    GetPage<dynamic> _page(String route, var page) {
      return GetPage(name: route, page: page);
    }

    return [
      _page(splashScreenRoute, () => SplashScreen()),
      _page(homeScreenRoute, () => HomeScreen()),
      // GetPage(name: loginRoute, page: () => LoginScreen()),
      // GetPage(
      //     name: homeitemviewRoute,
      //     page: () => HomeItemView(homeItemViewScreenModel: Get.arguments)),
    ];
  }

  static void moveToScreen(String routeName) {
    Get.toNamed(routeName);
  }

  static void moveOffScreen(String routeName) {
    Get.offNamed(routeName);
  }

  static void moveOffAllScreen(String routeName) {
    Get.offAllNamed(routeName);
  }

  static void moveOffAllScreenWithArguments(String routeName, {@required var arguments}) {
    Get.offAll(routeName, arguments: arguments);
  }
}
