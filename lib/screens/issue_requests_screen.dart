import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/home_screen_controller.dart';
import 'package:e_lib_admin/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssueRequestsScreen extends StatelessWidget {
  final HomeScreenController _homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Utils.primaryColor),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Utils.white,
        title: Utils().getText(
          "Issue Requests",
          color: Utils.primaryColor,
          fontSize: AppUIConst.baseFontSize * 4.5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => getBookItem(index),
            ),
          ],
        ),
      ),
      drawer: DrawerScreen(),
    );
  }

  Widget getBookItem(int index) {
    return Container(
      margin: EdgeInsets.only(
        left: AppUIConst.safeBlockHorizontal * 2,
        right: AppUIConst.safeBlockHorizontal * 2,
        bottom: AppUIConst.safeBlockVertical * 0.5,
      ),
      child: Card(
        shadowColor: Utils.white,
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils().getWithPadding(
                  Utils().getText(
                    _homePageController.booksDataList[index].bookName,
                    fontSize: AppUIConst.baseFontSize * 4,
                  ),
                  top: AppUIConst.safeBlockVertical * 1,
                  right: AppUIConst.safeBlockHorizontal * 3,
                  left: AppUIConst.safeBlockHorizontal * 3,
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
                    right: AppUIConst.safeBlockHorizontal * 3,
                    top: AppUIConst.safeBlockVertical * 1,
                  ),
                  child: Utils().getText(
                    "₹" + _homePageController.booksDataList[index].price.toString(),
                    color: Utils.green,
                    fontWeight: FontWeight.bold,
                    fontSize: AppUIConst.baseFontSize * 3.2,
                  ),
                ),
              ],
            ),
            Utils().getWithPadding(
              Utils().getText(
                _homePageController.booksDataList[index].authorName,
                color: Utils.grey,
                fontSize: AppUIConst.baseFontSize * 3.2,
              ),
              right: AppUIConst.safeBlockHorizontal * 3,
              left: AppUIConst.safeBlockHorizontal * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Utils().getWithPadding(
                  Utils().getText(
                    "Quantity: " + _homePageController.booksDataList[index].quantity.toString(),
                    color: Utils.primaryColor,
                    fontSize: AppUIConst.baseFontSize * 3,
                  ),
                  top: AppUIConst.safeBlockVertical * 0.3,
                  left: AppUIConst.safeBlockHorizontal * 3,
                ),
                Utils().getWithPadding(
                  Utils().getText(
                    "Security: " + _homePageController.booksDataList[index].percentSecurity.toString() + "%",
                    color: Utils.primaryColor,
                    fontSize: AppUIConst.baseFontSize * 3.2,
                  ),
                  right: AppUIConst.safeBlockHorizontal * 3,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Utils.primaryColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              margin: EdgeInsets.only(
                left: AppUIConst.safeBlockHorizontal * 3,
                top: AppUIConst.safeBlockVertical * 0.5,
                bottom: AppUIConst.safeBlockVertical * 1,
              ),
              child: Utils().getWithPadding(
                Utils().getText(
                  _homePageController.booksDataList[index].category ?? "Category",
                  fontSize: AppUIConst.baseFontSize * 3.0,
                ),
                top: AppUIConst.safeBlockVertical * 0.2,
                bottom: AppUIConst.safeBlockVertical * 0.2,
                left: AppUIConst.safeBlockHorizontal * 2,
                right: AppUIConst.safeBlockHorizontal * 2,
              ),
            ),
            Divider(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    var result = await Utils().showDialog(
                      "Alert",
                      "Are you sure you want to decline the request",
                      // () {
                      //   // Get.back();
                      // },
                      () {
                        // Get.back();
                      },
                    );
                  },
                  child: Utils().getText(
                    "Decline",
                    color: Utils.red,
                    fontWeight: FontWeight.bold,
                    fontSize: AppUIConst.baseFontSize * 3.5,
                  ),
                ),
                Container(
                  color: Utils.grey,
                  width: 0.5,
                  height: 25,
                ),
                MaterialButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  color: Utils.blue,
                  onPressed: () async {
                    var result = await Utils().showDialog(
                      "Alert",
                      "Are you sure you want to approve the request",
                      () {
                        Get.back();
                      },
                    );
                  },
                  child: Utils().getText(
                    "Approve",
                    color: Utils.white,
                    fontSize: AppUIConst.baseFontSize * 3.5,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
