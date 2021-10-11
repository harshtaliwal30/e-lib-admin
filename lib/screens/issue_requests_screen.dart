import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/issue_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum SortBy { all, pending, approved, issued, returned, declined }

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
        () => _issueRequestController.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppUIConst.safeBlockHorizontal * 2,
                      ),
                      child: PopupMenuButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Utils.primaryColor,
                            width: 0.5,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Utils.primaryColor),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppUIConst.safeBlockHorizontal * 3,
                            vertical: AppUIConst.safeBlockVertical * 0.5,
                          ),
                          child: Utils().getText("Sort by:"),
                        ),
                        onSelected: (result) {
                          print(result);
                          if (result == "All") {
                            _issueRequestController.fetchIssueRequests();
                          } else if (result == "Pending") {
                            _issueRequestController.fetchIssueRequestsByStatus("Pending");
                          } else if (result == "Approved") {
                            _issueRequestController.fetchIssueRequestsByStatus("Approved");
                          } else if (result == "Issued") {
                            _issueRequestController.fetchIssueRequestsByStatus("Issued");
                          } else if (result == "Returned") {
                            _issueRequestController.fetchIssueRequestsByStatus("Returned");
                          } else {
                            _issueRequestController.fetchIssueRequestsByStatus("Declined");
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          const PopupMenuItem(
                            value: "All",
                            child: Text('All'),
                          ),
                          const PopupMenuItem(
                            value: "Pending",
                            child: Text('Pending'),
                          ),
                          const PopupMenuItem(
                            value: "Approved",
                            child: Text('Approved'),
                          ),
                          const PopupMenuItem(
                            value: "Issued",
                            child: Text('Issued'),
                          ),
                          const PopupMenuItem(
                            value: "Returned",
                            child: Text('Returned'),
                          ),
                          const PopupMenuItem(
                            value: "Declined",
                            child: Text('Declined'),
                          ),
                        ],
                      ),
                    ),
                    _issueRequestController.issueRequestList.length == 0
                        ? NoIssueRequestsView()
                        : ListView.builder(
                            itemCount: _issueRequestController.issueRequestList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => getBookItem(index),
                          ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget getBookItem(int index) {
    return Card(
      color: Utils.white,
      shadowColor: Utils.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(
          color: Utils.darkGrey,
          width: 0.5,
        ),
      ),
      margin: EdgeInsets.only(
        left: AppUIConst.safeBlockHorizontal * 2,
        right: AppUIConst.safeBlockHorizontal * 2,
        top: AppUIConst.safeBlockVertical * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils().getWithPadding(
            Utils().getText(
              _issueRequestController.issueRequestList[index].bookName,
              color: Utils.primaryColor,
              fontWeight: FontWeight.bold,
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
              fontWeight: FontWeight.bold,
              fontSize: AppUIConst.baseFontSize * 3.2,
            ),
            right: AppUIConst.safeBlockHorizontal * 3,
            left: AppUIConst.safeBlockHorizontal * 3,
            bottom: AppUIConst.safeBlockVertical * 1,
          ),
          if (_issueRequestController.issueRequestList[index].status == "Declined") ...[
            getStatusView("Declined", _issueRequestController.issueRequestList[index].declinedAt, color: Utils.red),
          ],
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
            color: Utils.darkGrey,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (_issueRequestController.issueRequestList[index].status == "Pending" || _issueRequestController.issueRequestList[index].status == "Declined") ...[
                Expanded(
                  child: MaterialButton(
                    onPressed: () async {
                      if (_issueRequestController.issueRequestList[index].status != "Declined") {
                        var result = await Utils().showDialog(
                          "Alert",
                          "Are you sure you want to decline this request",
                          () {
                            _issueRequestController.issueRequestList[index].status = "Declined";
                            _issueRequestController.issueRequestList[index].declinedAt = DateTime.now();
                            Get.back(result: "statusUpdated");
                          },
                        );
                        if (result != null && result == "statusUpdated") {
                          await _issueRequestController.updateIssueRequest(_issueRequestController.issueRequestList[index], index);
                          Utils().showConfirmSnackbar("Status updated successfully");
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Utils().getText(
                      _issueRequestController.issueRequestList[index].status == "Declined" ? "Request Declined" : "Decline",
                      color: Utils.red,
                      fontWeight: FontWeight.bold,
                      fontSize: AppUIConst.baseFontSize * 3.5,
                    ),
                  ),
                ),
                if (_issueRequestController.issueRequestList[index].status == "Pending")
                  Container(
                    color: Utils.grey,
                    width: 0.5,
                    height: 25,
                  ),
              ],
              if (_issueRequestController.issueRequestList[index].status != "Declined")
                Expanded(
                  child: MaterialButton(
                    onPressed: () async {
                      String status = _issueRequestController.getStatus(_issueRequestController.issueRequestList[index].status);
                      if (status != "Book Returned") {
                        var result = await Utils().showDialog(
                          "Alert",
                          "Are you sure you want to mark the book as \"$status\"",
                          () {
                            _issueRequestController.issueRequestList[index].status = status;
                            if (status == "Approved")
                              _issueRequestController.issueRequestList[index].approvedAt = DateTime.now();
                            else if (status == "Issued")
                              _issueRequestController.issueRequestList[index].issuedAt = DateTime.now();
                            else if (status == "Returned") _issueRequestController.issueRequestList[index].returnedAt = DateTime.now();
                            Get.back(result: "statusUpdated");
                          },
                        );
                        if (result != null && result == "statusUpdated") {
                          await _issueRequestController.updateIssueRequest(_issueRequestController.issueRequestList[index], index);
                          Utils().showConfirmSnackbar("Status updated successfully");
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Utils().getText(
                      (_issueRequestController.issueRequestList[index].status != "Returned" ? "Mark as " : "") +
                          _issueRequestController.getStatus(_issueRequestController.issueRequestList[index].status),
                      color: Utils.green,
                      fontWeight: FontWeight.bold,
                      fontSize: AppUIConst.baseFontSize * 3.5,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget getStatusView(
    String status,
    DateTime date, {
    Color color = Utils.green,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils().getWithPadding(
          Column(
            children: [
              Utils().getChipView("◉", color: color),
              Container(
                color: color.withOpacity(0.6),
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
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: AppUIConst.baseFontSize * 3,
        ),
        Utils().getText(
          DateFormat.yMMMEd().format(date).toString(),
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: AppUIConst.baseFontSize * 2.9,
        ),
      ],
    );
  }
}

class NoIssueRequestsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Utils().getWithPadding(
            Utils().getText(
              "No issue Requests",
              color: Utils.darkGrey,
              fontWeight: FontWeight.bold,
            ),
            top: AppUIConst.safeBlockVertical * 2,
            bottom: AppUIConst.safeBlockVertical * 2,
          ),
          Image.asset(
            "assets/images/issue.png",
            height: AppUIConst.screenWidth / 1.5,
          ),
        ],
      ),
    );
  }
}
