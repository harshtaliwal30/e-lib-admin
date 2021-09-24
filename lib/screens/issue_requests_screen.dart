import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/issue_request_controller.dart';
import 'package:e_lib_admin/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
          Utils().getWithPadding(
            Utils().getText(
              _issueRequestController.issueRequestList[index].bookName,
              color: Utils.white,
              fontSize: AppUIConst.baseFontSize * 3.7,
            ),
            top: AppUIConst.safeBlockVertical * 1,
            right: AppUIConst.safeBlockHorizontal * 3,
            left: AppUIConst.safeBlockHorizontal * 3,
          ),
          Utils().getWithPadding(
            Utils().getText(
              _issueRequestController.issueRequestList[index].authorName,
              color: Utils.grey,
              fontSize: AppUIConst.baseFontSize * 3.2,
            ),
            right: AppUIConst.safeBlockHorizontal * 3,
            left: AppUIConst.safeBlockHorizontal * 3,
            bottom: AppUIConst.safeBlockVertical * 1,
          ),
          if (_issueRequestController.issueRequestList[index].status == "Pending") ...[
            getStatusView("Pending", _issueRequestController.issueRequestList[index].createdAt),
          ],
          if (_issueRequestController.issueRequestList[index].status == "Approved") ...[
            getStatusView("Pending", _issueRequestController.issueRequestList[index].createdAt),
            getStatusView("Approved", _issueRequestController.issueRequestList[index].approvedAt),
          ],
          if (_issueRequestController.issueRequestList[index].status == "Issued") ...[
            getStatusView("Pending", _issueRequestController.issueRequestList[index].createdAt),
            getStatusView("Approved", _issueRequestController.issueRequestList[index].approvedAt),
            getStatusView("Issued", _issueRequestController.issueRequestList[index].issuedAt),
          ],
          if (_issueRequestController.issueRequestList[index].status == "Returned") ...[
            getStatusView("Pending", _issueRequestController.issueRequestList[index].createdAt),
            getStatusView("Approved", _issueRequestController.issueRequestList[index].approvedAt),
            getStatusView("Issued", _issueRequestController.issueRequestList[index].issuedAt),
            getStatusView("Returned", _issueRequestController.issueRequestList[index].returnedAt),
          ],
          SizedBox(
            height: 5,
          ),
          Divider(
            height: 0,
            color: Utils.grey,
            thickness: 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (_issueRequestController.issueRequestList[index].status == "Pending") ...[
                MaterialButton(
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
              ],
              MaterialButton(
                onPressed: () async {
                  String status = _issueRequestController.getBtnText(_issueRequestController.issueRequestList[index].status);

                  var result = await Utils().showDialog(
                    "Alert",
                    "Are you sure you want to mark the book as \"$status\"",
                    () {
                      _issueRequestController.issueRequestList[index].status = status;
                      Get.back(result: "statusUpdated");
                    },
                  );
                  if (result != null && result == "statusUpdated") {
                    await _issueRequestController.updateIssueRequest(_issueRequestController.issueRequestList[index], index);
                    Utils().showConfirmSnackbar("Status updated successfully");
                  }
                },
                child: Utils().getText(
                  "Mark as " + _issueRequestController.getBtnText(_issueRequestController.issueRequestList[index].status),
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

  Widget getStatusView(String status, DateTime date) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils().getWithPadding(
          Column(
            children: [
              Utils().getChipView("◉", color: Utils.green),
              Container(
                color: Utils.green.withOpacity(0.6),
                width: 0.5,
                height: 8,
              ),
            ],
          ),
          left: AppUIConst.safeBlockHorizontal * 3,
          right: AppUIConst.safeBlockHorizontal * 1,
        ),
        Utils().getText(
          status + " - ",
          color: Utils.green,
          fontSize: AppUIConst.baseFontSize * 3,
        ),
        Utils().getText(
          DateFormat.yMMMEd().format(date).toString(),
          color: Utils.green,
          fontSize: AppUIConst.baseFontSize * 2.9,
        ),
      ],
    );
  }
}
