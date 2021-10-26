import 'package:e_lib_admin/Utils/app_routes.dart';
import 'package:e_lib_admin/Utils/size_config.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GetBuilder<ProfileController>(builder: (profileController) {
              return DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Utils.blue,
                      backgroundImage: NetworkImage(
                        profileController.libraryModel.libraryImage!,
                      ),
                    ),
                    Utils().getWithPadding(
                      Utils().getText(
                        profileController.libraryModel.libraryName!,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.baseFontSize * 4,
                      ),
                      top: SizeConfig.safeBlockVertical * 1,
                    ),
                    Utils().getText(
                      profileController.libraryModel.city!,
                      color: Utils.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.baseFontSize * 3.5,
                    )
                  ],
                ),
                decoration: BoxDecoration(),
              );
            }),
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
          fontWeight: Get.currentRoute == route ? FontWeight.bold : FontWeight.normal,
        ),
        tileColor: Get.currentRoute == route ? Utils.blue : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        onTap: onTap,
      ),
      left: SizeConfig.safeBlockHorizontal * 3,
      right: SizeConfig.safeBlockHorizontal * 3,
    );
  }
}
