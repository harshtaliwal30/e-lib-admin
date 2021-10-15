import 'package:e_lib_admin/Utils/app_routes.dart';
import 'package:e_lib_admin/Utils/size_config.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Utils.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            new TextEditingController().clear();
          },
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils().getWithPadding(
                  Utils().getText(
                    "Please enter your Phone Number",
                    fontSize: SizeConfig.baseFontSize * 4.5,
                  ),
                  left: SizeConfig.safeBlockHorizontal * 4,
                  right: SizeConfig.safeBlockHorizontal * 4,
                  top: SizeConfig.safeBlockVertical * 8,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 4,
                  ),
                  child: Image.asset(
                    "assets/images/phoneNumber.png",
                    fit: BoxFit.fill,
                    height: SizeConfig.screenHeight / 5,
                  ),
                ),
                Utils().getWithPadding(
                  Utils().getText(
                    "You'll recieve a 6 digit code\nto verify next.",
                    color: Utils.darkGrey,
                    textAlign: TextAlign.center,
                    fontSize: SizeConfig.baseFontSize * 4,
                  ),
                  left: SizeConfig.safeBlockHorizontal * 4,
                  right: SizeConfig.safeBlockHorizontal * 4,
                ),
                Row(
                  children: [
                    Utils().getWithPadding(
                      Utils().getText(
                        "Enter your phone",
                        color: Utils.darkGrey,
                        fontSize: SizeConfig.baseFontSize * 3.6,
                      ),
                      left: SizeConfig.safeBlockHorizontal * 4,
                      right: SizeConfig.safeBlockHorizontal * 4,
                      top: SizeConfig.safeBlockVertical * 2,
                      bottom: SizeConfig.safeBlockVertical * 1,
                    ),
                  ],
                ),
                Utils().getWithPadding(
                  phoneField(),
                  left: SizeConfig.safeBlockHorizontal * 4,
                  right: SizeConfig.safeBlockHorizontal * 4,
                ),
                Utils().getWithPadding(
                  getButton(),
                  top: SizeConfig.safeBlockVertical * 4,
                  left: SizeConfig.screenWidth / 2.5,
                  right: SizeConfig.safeBlockHorizontal * 4,
                ),
              ],
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
          "+91",
          color: Utils.grey,
          fontSize: SizeConfig.baseFontSize * 4.5,
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _loginController.phoneController,
            cursorColor: Utils.primaryColor,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            style: TextStyle(
              color: Utils.primaryColor,
              fontSize: SizeConfig.baseFontSize * 4.5,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
                vertical: SizeConfig.safeBlockVertical * 1.5,
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
        if (_loginController.phoneController.text.length == 10) {
          AppRoutes.moveToScreen("/otpScreen");
          _loginController.sendOTPMsg();
        } else {
          Utils().showWarningSnackbar("Please enter valid phone number");
        }
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
          horizontal: SizeConfig.safeBlockHorizontal * 3,
          vertical: SizeConfig.safeBlockVertical * 1,
        ),
        child: Utils().getText(
          "Get OTP",
          color: Utils.white,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.baseFontSize * 4.5,
        ),
      ),
    );
  }
}
