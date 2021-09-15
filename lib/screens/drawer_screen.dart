import 'package:e_lib_admin/Utils/app_routes.dart';
import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  }) {
    return Utils().getWithPadding(
      ListTile(
        leading: Icon(
          leadingIcon,
          color: Get.currentRoute == route ? Utils.white : Utils.grey,
        ),
        trailing: isTrailing
            ? Container(
                decoration: BoxDecoration(
                  color: Utils.red.withOpacity(0.2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppUIConst.safeBlockHorizontal * 2,
                  vertical: AppUIConst.safeBlockVertical * 0.1,
                ),
                child: Utils().getText(
                  "23",
                  color: Utils.red,
                  fontWeight: FontWeight.bold,
                  fontSize: AppUIConst.baseFontSize * 2.9,
                ),
              )
            : null,
        horizontalTitleGap: 0.0,
        title: Utils().getText(
          title,
          color: Get.currentRoute == route ? Utils.white : Utils.grey,
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
      left: AppUIConst.safeBlockHorizontal * 3,
      right: AppUIConst.safeBlockHorizontal * 3,
    );
  }
}
