import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController otpController = new TextEditingController();
  final phoneNumber;
  OTPScreen({@required this.phoneNumber});

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
                    "Code is sent to " + phoneNumber,
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
                Utils().getWithPadding(
                  Utils().getText(
                    "Didn't recieve code? Request again",
                    color: Utils.darkGrey,
                    textAlign: TextAlign.center,
                    fontSize: AppUIConst.baseFontSize * 4,
                  ),
                  left: AppUIConst.safeBlockHorizontal * 4,
                  right: AppUIConst.safeBlockHorizontal * 4,
                  bottom: AppUIConst.safeBlockVertical * 4,
                ),
                Utils().getWithPadding(
                  phoneField(),
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
    );
  }

  Widget phoneField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Utils().getText(
          "Enter OTP:  ",
          color: Utils.grey,
          fontSize: AppUIConst.baseFontSize * 4.5,
        ),
        Expanded(
          child: TextField(
            controller: otpController,
            cursorColor: Utils.primaryColor,
            keyboardType: TextInputType.phone,
            maxLength: 6,
            style: TextStyle(
              color: Utils.primaryColor,
              fontSize: AppUIConst.baseFontSize * 5.0,
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
          fontWeight: FontWeight.bold,
          fontSize: AppUIConst.baseFontSize * 4.5,
        ),
      ),
    );
  }
}
