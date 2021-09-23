import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const lightBgColor = Color(0XFFEFF3F6);
  static const red = Colors.red;
  static const green = Color(0xFF66B032);
  static const lightGrey = Color(0xFFE0E0E0);
  static const darkGrey = Color(0XFF5b5b5b);
  static const errorColor = Color(0xFFFF0000);
  static const blue = Color(0xFF7894FF);
  static const primaryColor = Color(0XFF2C3848);
  static const whip = Color(0XFFF8E8CF);
  static const amber = Color(0XFFFFC500);

  static const String KEY_ISLOGIN = "isLogin";
  static const String KEY_LIBRARYID = "libraryId";
  static const String KEY_LIBRARYNAME = "libraryName";
  static const String KEY_LIBRARYEMAIL = "libraryEmail";
  static const String KEY_LIBRARYPHONE = "libraryPhone";
  static const String KEY_LIBRARYIMAGE = "libraryImage";

  // static const primaryColor = Color(0XFF085078);
  // static const secondaryColor = Color(0XFFEFF3F6);
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
      borderRadius: 5.0,
      padding: EdgeInsets.symmetric(
        vertical: AppUIConst.safeBlockVertical * 1,
      ),
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

  void showConfirmSnackbar(String msg) {
    Get.snackbar(
      "Success",
      msg,
      backgroundColor: Utils.green,
      borderRadius: 5.0,
      padding: EdgeInsets.symmetric(
        vertical: AppUIConst.safeBlockVertical * 1,
      ),
      colorText: Utils.white,
      duration: Duration(milliseconds: 2000),
      icon: Icon(
        Icons.emoji_emotions_rounded,
        color: Utils.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(
        bottom: AppUIConst.safeBlockVertical * 2,
        left: AppUIConst.safeBlockHorizontal * 3,
        right: AppUIConst.safeBlockHorizontal * 3,
      ),
    );
  }

  Future<dynamic> showDialog(
    String title,
    String msg,
    Function()? onConfirm,
  ) async {
    return await Get.defaultDialog(
      title: "Alert",
      middleText: "Are you sure you want to delete the book?",
      barrierDismissible: false,
      radius: 10,
      buttonColor: Utils.primaryColor,
      onCancel: null,
      onConfirm: onConfirm,
      textCancel: "No",
      textConfirm: "Yes",
      cancelTextColor: Utils.primaryColor,
      confirmTextColor: Utils.white,
    );
  }

  Future<dynamic> showLoader() async {
    return await Get.defaultDialog(
      title: "Loading...",
      titleStyle: TextStyle(fontSize: AppUIConst.baseFontSize * 4),
      radius: 10,
      content: Container(height: 30, width: 30, child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  Padding getWithPadding(
    Widget child, {
    double left = 0.0,
    right = 0.0,
    top = 0.0,
    bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: child,
    );
  }

  Text getText(
    String content, {
    Color color = Utils.primaryColor,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Text(
      content,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
