import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static const white = Colors.white;
  static const black = Colors.black;
  static const black54 = Colors.black54;
  static const camouflageGreen = Color(0XFF78866B);
  static const grey = Colors.grey;
  static const red = Color(0xFFFF406C);
  static const green = Color(0xFF66B032);
  static const lightGrey = Color(0xFFE0E0E0);
  static const darkGrey = Color(0XFF5b5b5b);
  static const darkBlue = Color(0XFF202B3D);
  static const errorColor = Color(0xFFFF0000);
  static const blue = Color(0xFF00A2FE);
  static const linen = Color(0XFFFCF4E9);
  static const crimson = Color(0XFFED2736);
  static const aliceBlue = Color(0xFFEAF3FC);
  static const primaryColor = Color(0XFF2F3044);
  static const whip = Color(0XFFF8E8CF);
  static const amber = Color(0XFFFFC500);

  // static const primaryColor = Color(0XFF085078);
  static const secondaryColor = Color(0XFFEFF3F6);
  // static const fillColor = Color(0XFFEFF3F6);
  // static const green = Color(0xFF66B032);
  // static const aliceBlue = Color(0xFFCDEEFF);
  // static const antiFlashWhite = Color(0XFFF3F3F3);
  // static const bondiBlue = Color(0XFF4293B7);
  // static const white = Color(0xFFF2F2F2);
  // static const pureWhite = Color(0xFFFFFFFF);
  // static const red = Color(0xFFFF406C);
  // static const grey = Color(0xFF9B9B9B);
  // static const greyLight = Color(0xFFE0E0E0);
  // static const greyDark = Color(0xFF353B48);
  // static const black = Color(0xFF262628);
  // static const black54 = Colors.black54;
  // static const blackLight = Color(0xFF2B2F3A);
  // static const blue = Color(0xFF00A2FE);
  // static const blue_dark = Color(0xFF00358D);
  // static const inactive = Color(0xFF404040);
  // static const parrot = Color(0XFF7CE247);
  // static const primaryAccentColor = Color(0xFF000000);
  // static const primarySecondColor = Colors.black;
  // static const primaryDarkColor = Colors.black;
  // static const errorColor = Color(0xFFFF0000);

  void showWarningSnackbar(String msg) {
    Get.snackbar(
      "Warning",
      msg,
      backgroundColor: Utils.whip,
      duration: Duration(milliseconds: 1000),
      icon: Icon(Icons.warning_amber_rounded),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(
        bottom: AppUIConst.safeBlockVertical * 2,
        left: AppUIConst.safeBlockHorizontal * 3,
        right: AppUIConst.safeBlockHorizontal * 3,
      ),
    );
  }
}
