import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Utils.white,
        body: Obx(
          () => GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              new TextEditingController().clear();
            },
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Utils().getWithPadding(
                    Utils().getText(
                      "Verify Phone",
                      fontSize: AppUIConst.baseFontSize * 4.5,
                    ),
                    left: AppUIConst.safeBlockHorizontal * 4,
                    right: AppUIConst.safeBlockHorizontal * 4,
                    top: AppUIConst.safeBlockVertical * 8,
                    bottom: AppUIConst.safeBlockVertical * 4,
                  ),
                  Utils().getWithPadding(
                    Utils().getText(
                      "Code is sent to " + _loginController.phoneController.text,
                      color: Utils.darkGrey,
                      textAlign: TextAlign.center,
                      fontSize: AppUIConst.baseFontSize * 4,
                    ),
                    left: AppUIConst.safeBlockHorizontal * 4,
                    right: AppUIConst.safeBlockHorizontal * 4,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: AppUIConst.safeBlockVertical * 4,
                    ),
                    child: Image.asset(
                      "assets/images/phoneNumber.png",
                      fit: BoxFit.fill,
                      height: AppUIConst.screenHeight / 5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Utils().getWithPadding(
                        Utils().getText(
                          "Didn't recieve code?",
                          color: Utils.darkGrey,
                          textAlign: TextAlign.center,
                          fontSize: AppUIConst.baseFontSize * 4,
                        ),
                        left: AppUIConst.safeBlockHorizontal * 4,
                      ),
                      InkWell(
                        onTap: () {
                          _loginController.seconds.value = 60;
                          _loginController.sendOTPMsg();
                        },
                        child: Utils().getWithPadding(
                          Utils().getText(
                            "Request again",
                            color: _loginController.seconds.value == 0 ? Utils.primaryColor : Utils.grey,
                            textAlign: TextAlign.center,
                            fontSize: AppUIConst.baseFontSize * 4,
                          ),
                          left: AppUIConst.safeBlockHorizontal * 1,
                          right: AppUIConst.safeBlockHorizontal * 4,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Utils.green.withOpacity(0.2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppUIConst.safeBlockHorizontal * 2,
                      vertical: AppUIConst.safeBlockVertical * 0.1,
                    ),
                    margin: EdgeInsets.only(
                      top: AppUIConst.safeBlockVertical * 2,
                    ),
                    child: Utils().getText(
                      _loginController.seconds.value == 60
                          ? "1:00"
                          : _loginController.seconds.value > 9
                              ? "00:${_loginController.seconds.value}"
                              : "00:0${_loginController.seconds.value}",
                      color: Utils.darkGrey,
                      textAlign: TextAlign.center,
                      fontSize: AppUIConst.baseFontSize * 4,
                    ),
                  ),
                  Utils().getWithPadding(
                    phoneField(),
                    top: AppUIConst.safeBlockVertical * 2,
                    left: AppUIConst.safeBlockHorizontal * 4,
                    right: AppUIConst.safeBlockHorizontal * 4,
                  ),
                  Utils().getWithPadding(
                    getButton(),
                    top: AppUIConst.safeBlockVertical * 4,
                    left: AppUIConst.screenWidth / 3.5,
                    right: AppUIConst.safeBlockHorizontal * 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget phoneField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Utils().getText(
          "Enter OTP:  ",
          color: Utils.grey,
          fontSize: AppUIConst.baseFontSize * 4,
        ),
        Expanded(
          child: TextField(
            controller: _loginController.otpController,
            cursorColor: Utils.primaryColor,
            keyboardType: TextInputType.phone,
            maxLength: 6,
            style: TextStyle(
              color: Utils.primaryColor,
              fontSize: AppUIConst.baseFontSize * 4,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppUIConst.safeBlockHorizontal * 4,
                vertical: AppUIConst.safeBlockVertical * 1.5,
              ),
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              fillColor: Utils.lightBgColor,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget getButton() {
    return InkWell(
      onTap: () async {
        // if (phoneController.text.length == 10) {
        //   AppRoutes.moveToScreenWithArguments("/otpScreen", arguments: phoneController.text);
        // } else {
        //   Utils().showWarningSnackbar("Please enter valid phone number");
        // }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          color: Utils.blue,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppUIConst.safeBlockHorizontal * 3,
          vertical: AppUIConst.safeBlockVertical * 1,
        ),
        child: Utils().getText(
          "Verify and Create Account",
          color: Utils.white,
          fontSize: AppUIConst.baseFontSize * 4.5,
        ),
      ),
    );
  }
}
