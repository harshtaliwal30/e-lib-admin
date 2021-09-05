import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    AppUIConst.initOnStartUp(context);
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
                    top: AppUIConst.safeBlockVertical * 10,
                    left: AppUIConst.safeBlockHorizontal * 4,
                  ),
                  child: Text(
                    "Welcome\nto E-Lib Admin",
                    style: TextStyle(
                      color: Utils.darkBlue,
                      fontSize: AppUIConst.baseFontSize * 12,
                      fontFamily: "OpenSans-Bold",
                    ),
                  ),
                ),
                Center(
                  child: SvgPicture.asset(
                    "assets/images/bookshelf.svg",
                    height: AppUIConst.screenHeight / 4,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: AppUIConst.safeBlockVertical * 4,
                  ),
                  child: Image.asset(
                    "assets/images/splashBook.png",
                    fit: BoxFit.fill,
                    height: AppUIConst.screenHeight / 5,
                    width: AppUIConst.screenWidth,
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