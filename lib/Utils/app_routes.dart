import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/models/book_model.dart';
import 'package:e_lib_admin/models/user_model.dart';
import 'package:e_lib_admin/screens/add_book_screen.dart';
import 'package:e_lib_admin/screens/home_screen.dart';
import 'package:e_lib_admin/screens/issue_requests_screen.dart';
import 'package:e_lib_admin/screens/login_screen.dart';
import 'package:e_lib_admin/screens/otp_screen.dart';
import 'package:e_lib_admin/screens/profile_screen.dart';
import 'package:e_lib_admin/screens/splash_screen.dart';
import 'package:e_lib_admin/screens/user_details_screen.dart';
import 'package:e_lib_admin/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreenRoute = "/splashScreen";
  static const String loginScreenRoute = "/loginScreen";
  static const String otpScreenRoute = "/otpScreen";
  static const String homeScreenRoute = "/homeScreen";
  static const String issueRequestsScreenRoute = "/issueRequestsScreen";
  static const String profileScreenRoute = "/profileScreen";
  static const String userScreenRoute = "/userScreen";
  static const String userDetailsScreenRoute = "/userDetailsScreen";

  static routes() {
    GetPage<dynamic> _page(String route, var page) {
      return GetPage(name: route, page: page);
    }

    return [
      _page(splashScreenRoute, () => SplashScreen()),
      _page(loginScreenRoute, () => LoginScreen()),
      _page(otpScreenRoute, () => OTPScreen()),
      _page(homeScreenRoute, () => HomeScreen()),
      _page(issueRequestsScreenRoute, () => IssueRequestsScreen()),
      _page(profileScreenRoute, () => ProfileScreen()),
      _page(userScreenRoute, () => UsersScreen()),
      GetPage(name: userDetailsScreenRoute, page: () => UserDetailsScreen(userModel: Get.arguments)),
      // GetPage(name: loginRoute, page: () => LoginScreen()),
      // GetPage(
      //     name: homeitemviewRoute,
      //     page: () => HomeItemView(homeItemViewScreenModel: Get.arguments)),
    ];
  }

  static void moveToScreen(String routeName) {
    Get.toNamed(routeName);
  }

  static void moveToScreenWithArguments(String routeName, {@required var arguments}) {
    Get.toNamed(routeName, arguments: arguments);
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

  static Future<dynamic> openAddBookBottomSheet({BookModel? bookData}) {
    return Get.bottomSheet(
      AddBookScreen(
        bookData: bookData,
      ),
      backgroundColor: Utils.white,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 15,
    );
  }

  static Future<dynamic> openUserDetailsBottomSheet({required UserModel userModel}) {
    return Get.bottomSheet(
      UserDetailsScreen(
        userModel: userModel,
      ),
      backgroundColor: Utils.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 15,
    );
  }
}
