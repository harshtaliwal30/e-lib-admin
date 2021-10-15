import 'package:e_lib_admin/Utils/size_config.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController splashScreenController =
      Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.initOnStartUp(context);
    return Scaffold(
      backgroundColor: Utils.white,
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.safeBlockVertical * 10,
                    left: SizeConfig.safeBlockHorizontal * 4,
                  ),
                  child: Text(
                    "Welcome\nto E-Lib Admin",
                    style: TextStyle(
                      color: Utils.primaryColor,
                      fontSize: SizeConfig.baseFontSize * 12,
                      fontFamily: "OpenSans-Bold",
                    ),
                  ),
                ),
                Center(
                  child: SvgPicture.asset(
                    "assets/images/bookshelf.svg",
                    height: SizeConfig.screenHeight / 4,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 4,
                  ),
                  child: Image.asset(
                    "assets/images/splashBook.png",
                    fit: BoxFit.fill,
                    height: SizeConfig.screenHeight / 5,
                    width: SizeConfig.screenWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
