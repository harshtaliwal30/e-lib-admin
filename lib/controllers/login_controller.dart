import 'dart:async';
import 'package:e_lib_admin/Utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController otpController = new TextEditingController();

  Timer timer = Timer(Duration(seconds: 0), () {});
  var seconds = 60.obs;
  String? verificationID;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value == 0) {
        timer.cancel();
      } else {
        seconds--;
      }
    });
  }

  sendOTPMsg() async {
    Get.defaultDialog(content: CircularProgressIndicator(), barrierDismissible: false);
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneController.text,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        print("calling verification completed");
        UserCredential result = await _auth.signInWithCredential(credential);
        User? user = result.user;
        if (user != null) {
          AppRoutes.moveToScreen("/homeScreen");
        } else {
          print("Error");
        }
        //This callback would gets called when verification is done automatically
      },
      verificationFailed: (Exception exception) {
        Get.back();
        startTimer();
        print("Exception - $exception");
      },
      codeSent: (String verificationId, [int? forceResendingToken]) {
        print("code send - $verificationId");

        Get.back();
        startTimer();
        this.verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verId) {
        Get.back();
        startTimer();
        print("Exception - TIMEOUT");
      },
    );
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
