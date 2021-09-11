import 'package:cached_network_image/cached_network_image.dart';
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
                    // backgroundColor: Utils.blue,
                    backgroundImage: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/e-lib-e53d6.appspot.com/o/28828394_950086555154619_9137006216337597187_o.jpg?alt=media&token=dd2c5145-1e19-43d6-ace7-6bede86f7a7d",
                    ),
                    // child:
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
              "Add Book",
              Icons.add,
              "/homeRoutefd",
              () => {
                Get.back(),
                AppRoutes.openAddBookBottomSheet(),
              },
            ),
            getDrawerItem(
              "Add Book",
              Icons.add,
              "/homeRoutefd",
              () => {
                AppRoutes.openAddBookBottomSheet(),
              },
            ),
            getDrawerItem(
              "Add Book",
              Icons.add,
              "/homeRoutfdfdse",
              () => {
                AppRoutes.openAddBookBottomSheet(),
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getDrawerItem(String title, IconData leadingIcon, String route, Function()? onTap) {
    return Utils().getWithPadding(
      ListTile(
        leading: Icon(
          leadingIcon,
          color: Get.currentRoute == route ? Utils.white : Utils.grey,
        ),
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
        // onTap: () {
        //   Get.back();
        //   Get.offNamed('/home');
        // },
        onTap: onTap,
      ),
      left: AppUIConst.safeBlockHorizontal * 3,
      right: AppUIConst.safeBlockHorizontal * 3,
    );
  }
}
