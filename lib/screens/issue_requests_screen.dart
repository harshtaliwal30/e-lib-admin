import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/issue_request_controller.dart';
import 'package:e_lib_admin/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssueRequestsScreen extends StatelessWidget {
  final IssueRequestController _issueRequestController = Get.put(IssueRequestController());

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
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: _issueRequestController.issueRequestList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => getBookItem(index),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerScreen(),
    );
  }

  Widget getBookItem(int index) {
    return Card(
      color: Utils.primaryColor,
      shadowColor: Utils.white,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.only(
        left: AppUIConst.safeBlockHorizontal * 2,
        right: AppUIConst.safeBlockHorizontal * 2,
        bottom: AppUIConst.safeBlockVertical * 0.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils().getWithPadding(
                Utils().getText(
                  _issueRequestController.issueRequestList[index].bookName,
                  color: Utils.white,
                  fontSize: AppUIConst.baseFontSize * 3.7,
                ),
                top: AppUIConst.safeBlockVertical * 1,
                right: AppUIConst.safeBlockHorizontal * 3,
                left: AppUIConst.safeBlockHorizontal * 3,
                bottom: AppUIConst.safeBlockVertical * 1,
              ),
              Utils().getWithPadding(
                Utils().getText(
                  _issueRequestController.issueRequestList[index].authorName,
                  color: Utils.grey,
                  fontSize: AppUIConst.baseFontSize * 3.2,
                ),
                top: AppUIConst.safeBlockVertical * 1,
                right: AppUIConst.safeBlockHorizontal * 3,
                bottom: AppUIConst.safeBlockVertical * 1,
              ),
            ],
          ),
          if (_issueRequestController.issueRequestList[index].status == "Pending") getStatusView("Pending"),
          if (_issueRequestController.issueRequestList[index].status == "Confirmed") ...[
            getStatusView("Pending"),
            getStatusView("Approved"),
          ],
          if (_issueRequestController.issueRequestList[index].status == "Issued") ...[
            getStatusView("Pending"),
            getStatusView("Approved"),
            getStatusView("Issued"),
          ],
          if (_issueRequestController.issueRequestList[index].status == "Returned") ...[
            getStatusView("Pending"),
            getStatusView("Approved"),
            getStatusView("Issued"),
            getStatusView("Returned"),
          ],
          Divider(
            height: 0,
            color: Utils.grey,
            thickness: 0.3,
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
                  color: Utils.green,
                  fontWeight: FontWeight.bold,
                  fontSize: AppUIConst.baseFontSize * 3.5,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getStatusView(String status) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils().getWithPadding(
          Utils().getChipView("◉", color: Utils.green),
          left: AppUIConst.safeBlockHorizontal * 3,
          right: AppUIConst.safeBlockHorizontal * 1,
          bottom: AppUIConst.safeBlockVertical * 1,
        ),
        Utils().getText(
          status,
          color: Utils.green,
          fontSize: AppUIConst.baseFontSize * 3,
        ),
      ],
    );
  }
}
