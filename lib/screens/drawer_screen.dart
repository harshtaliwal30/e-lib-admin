import 'package:e_lib_admin/Utils/app_routes.dart';
import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Utils.blue,
                    backgroundImage: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/e-lib-e53d6.appspot.com/o/28828394_950086555154619_9137006216337597187_o.jpg?alt=media&token=dd2c5145-1e19-43d6-ace7-6bede86f7a7d",
                    ),
                  ),
                  Utils().getWithPadding(
                    Utils().getText(
                      "Maulana Azad",
                      fontWeight: FontWeight.bold,
                      fontSize: AppUIConst.baseFontSize * 4,
                    ),
                    top: AppUIConst.safeBlockVertical * 1,
                  ),
                  Utils().getText(
                    "Aligarh",
                    color: Utils.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: AppUIConst.baseFontSize * 3.5,
                  )
                ],
              ),
              decoration: BoxDecoration(),
            ),
            SizedBox(height: 10),
            getDrawerItem(
              "Home",
              Icons.home,
              "/homeScreen",
              () => {
                Get.back(),
                AppRoutes.moveOffAllScreen(
                  "/homeScreen",
                )
              },
            ),
            getDrawerItem(
              "Issue Requests",
              Icons.notifications_on_outlined,
              "/issueRequestsScreen",
              () => {
                Get.back(),
                AppRoutes.moveToScreen(
                  "/issueRequestsScreen",
                )
              },
              isTrailing: true,
            ),
            getDrawerItem(
              "Profile",
              Icons.person,
              "/profileScreen",
              () => {
                Get.back(),
                AppRoutes.moveToScreen(
                  "/profileScreen",
                )
              },
            ),
            getDrawerItem(
              "Logout",
              Icons.logout_rounded,
              "/loginScreen",
              () => {
                Get.back(),
                SharedPreferences.getInstance().then((onValue) {
                  onValue.setBool(Utils.KEY_ISLOGIN, false);
                  FirebaseAuth.instance.signOut();
                  AppRoutes.moveOffAllScreen(AppRoutes.loginScreenRoute);
                }),
              },
              color: Utils.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget getDrawerItem(
    String title,
    IconData leadingIcon,
    String route,
    Function()? onTap, {
    bool isTrailing = false,
    Color color = Utils.grey,
  }) {
    return Utils().getWithPadding(
      ListTile(
        leading: Icon(
          leadingIcon,
          color: Get.currentRoute == route ? Utils.white : color,
        ),
        trailing: isTrailing ? Utils().getChipView("22") : null,
        horizontalTitleGap: 0.0,
        title: Utils().getText(
          title,
          color: Get.currentRoute == route ? Utils.white : color,
          fontWeight:
              Get.currentRoute == route ? FontWeight.bold : FontWeight.normal,
        ),
        tileColor: Get.currentRoute == route ? Utils.blue : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        onTap: onTap,
      ),
      left: AppUIConst.safeBlockHorizontal * 3,
      right: AppUIConst.safeBlockHorizontal * 3,
    );
  }
}
