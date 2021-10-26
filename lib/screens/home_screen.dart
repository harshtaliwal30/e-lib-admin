import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_lib_admin/Utils/app_routes.dart';
import 'package:e_lib_admin/Utils/size_config.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/home_screen_controller.dart';
import 'package:e_lib_admin/controllers/profile_controller.dart';
import 'package:e_lib_admin/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController _homePageController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.white,
      appBar: PreferredSize(
        preferredSize: const Size(0, 60),
        child: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (profileController) {
              return AppBar(
                iconTheme: IconThemeData(color: Utils.primaryColor),
                elevation: 0.0,
                centerTitle: true,
                backgroundColor: Utils.white,
                title: Utils().getText(
                  profileController.libraryModel.libraryName ?? "",
                  color: Utils.primaryColor,
                  fontSize: SizeConfig.baseFontSize * 4.5,
                ),
              );
            }),
      ),
      body: Obx(
        () => _homePageController.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 3,
                            ),
                            child: TextFormField(
                              autofocus: false,
                              cursorColor: Utils.primaryColor,
                              decoration: InputDecoration(
                                filled: false,
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Utils.grey,
                                ),
                                hintText: 'Search for libraries',
                                hintStyle: TextStyle(
                                  fontSize: SizeConfig.baseFontSize * 3.5,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Utils.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Utils.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Utils.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            _homePageController.addBookBottomSheet();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Utils.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            margin: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 3,
                            ),
                            child: Row(
                              children: [
                                Utils().getWithPadding(
                                  Icon(
                                    Icons.add,
                                    color: Utils.white,
                                    size: SizeConfig.baseFontSize * 4.5,
                                  ),
                                  left: SizeConfig.safeBlockHorizontal * 3,
                                ),
                                Utils().getWithPadding(
                                  Utils().getText(
                                    "Add Book",
                                    color: Utils.white,
                                    fontSize: SizeConfig.baseFontSize * 3.5,
                                  ),
                                  top: SizeConfig.safeBlockVertical * 1,
                                  bottom: SizeConfig.safeBlockVertical * 1,
                                  left: SizeConfig.safeBlockHorizontal * 2,
                                  right: SizeConfig.safeBlockHorizontal * 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Utils.primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 2,
                        vertical: SizeConfig.safeBlockVertical * 1.5,
                      ),
                      padding: EdgeInsets.all(
                        SizeConfig.safeBlockHorizontal * 4,
                      ),
                      height: SizeConfig.screenHeight / 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  _homePageController.addBookBottomSheet();
                                },
                                child: Row(
                                  children: [
                                    Utils().getChipView("+", color: Colors.purple.shade300),
                                    SizedBox(width: 5),
                                    Utils().getText(
                                      "Add Book",
                                      color: Colors.purple.shade300,
                                      fontSize: SizeConfig.baseFontSize * 4,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              InkWell(
                                onTap: () {
                                  AppRoutes.moveToScreen(
                                    "/issueRequestsScreen",
                                  );
                                },
                                child: Row(
                                  children: [
                                    Utils().getChipView("22", color: Colors.blue.shade300),
                                    SizedBox(width: 5),
                                    Utils().getText(
                                      "Issue Requests",
                                      color: Colors.blue,
                                      fontSize: SizeConfig.baseFontSize * 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.asset(
                              "assets/images/home.png",
                              height: SizeConfig.screenHeight / 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_homePageController.booksDataList.length == 0)
                      NoBooksView()
                    else
                      ListView.builder(
                        itemCount: _homePageController.booksDataList.length,
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
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 2,
        right: SizeConfig.safeBlockHorizontal * 2,
        bottom: SizeConfig.safeBlockHorizontal * 6,
      ),
      child: Stack(
        children: [
          Card(
            shadowColor: Utils.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            margin: EdgeInsets.only(
              right: SizeConfig.safeBlockHorizontal * 3.5,
            ),
            child: Container(
              height: SizeConfig.screenHeight / 5.5,
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.screenHeight / 5.5,
                    width: SizeConfig.screenWidth / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/e-lib-e53d6.appspot.com/o/28828394_950086555154619_9137006216337597187_o.jpg?alt=media&token=dd2c5145-1e19-43d6-ace7-6bede86f7a7d",
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Utils().getWithPadding(
                          Utils().getText(
                            _homePageController.booksDataList[index].bookName,
                            fontSize: SizeConfig.baseFontSize * 4,
                          ),
                          top: SizeConfig.safeBlockVertical * 1,
                          right: SizeConfig.safeBlockHorizontal * 5,
                          left: SizeConfig.safeBlockHorizontal * 3,
                        ),
                        Utils().getWithPadding(
                          Utils().getText(
                            _homePageController.booksDataList[index].authorName,
                            color: Utils.grey,
                            fontSize: SizeConfig.baseFontSize * 3.2,
                          ),
                          left: SizeConfig.safeBlockHorizontal * 3,
                          right: SizeConfig.safeBlockHorizontal * 3,
                          bottom: SizeConfig.safeBlockHorizontal * 2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Utils.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          margin: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 3,
                          ),
                          child: Utils().getWithPadding(
                            Utils().getText(
                              "Quantity: " + _homePageController.booksDataList[index].quantity.toString(),
                              color: Utils.white,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.baseFontSize * 2.9,
                            ),
                            top: SizeConfig.safeBlockVertical * 0.3,
                            bottom: SizeConfig.safeBlockVertical * 0.3,
                            left: SizeConfig.safeBlockHorizontal * 2,
                            right: SizeConfig.safeBlockHorizontal * 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Utils().getWithPadding(
                              Utils().getText(
                                "₹" + _homePageController.booksDataList[index].price.toString(),
                                color: Utils.green,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.baseFontSize * 3.2,
                              ),
                              top: SizeConfig.safeBlockVertical * 1,
                              left: SizeConfig.safeBlockHorizontal * 3,
                            ),
                            Utils().getWithPadding(
                              Utils().getText(
                                "Security: " + _homePageController.booksDataList[index].percentSecurity.toString() + "%",
                                color: Utils.primaryColor,
                                fontSize: SizeConfig.baseFontSize * 3.2,
                              ),
                              top: SizeConfig.safeBlockVertical * 1,
                              right: SizeConfig.safeBlockHorizontal * 2,
                            ),
                          ],
                        ),
                        Spacer(),
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
                            left: SizeConfig.safeBlockHorizontal * 3,
                            bottom: SizeConfig.safeBlockVertical * 1,
                          ),
                          child: Utils().getWithPadding(
                            Utils().getText(
                              _homePageController.booksDataList[index].category ?? "Category",
                              fontSize: SizeConfig.baseFontSize * 3.0,
                            ),
                            top: SizeConfig.safeBlockVertical * 0.2,
                            bottom: SizeConfig.safeBlockVertical * 0.2,
                            left: SizeConfig.safeBlockHorizontal * 2,
                            right: SizeConfig.safeBlockHorizontal * 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    _homePageController.editBookBottomSheet(index);
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Utils.blue,
                    child: Icon(
                      Icons.edit,
                      size: SizeConfig.iconExamHeightAndWidth * 0.5,
                      color: Utils.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () async {
                    var result = await Utils().showDialog(
                      "Alert",
                      "Are you sure you want to delete the book?",
                      () {
                        _homePageController.deleteBook(_homePageController.booksDataList[index].bookDocId);
                        Get.back(result: "deleted");
                      },
                    );
                    if (result != null && result == "deleted") {
                      Utils().showConfirmSnackbar("Book deleted successfully");
                      _homePageController.booksDataList.removeAt(index);
                    }
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Utils.red,
                    child: Icon(
                      Icons.delete,
                      size: SizeConfig.iconExamHeightAndWidth * 0.5,
                      color: Utils.white,
                    ),
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

class NoBooksView extends HomeScreen {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/noBookAdded.png",
          height: SizeConfig.screenWidth / 1.5,
        ),
        Utils().getWithPadding(
          Utils().getText(
            "Add your first book",
            color: Utils.darkGrey,
            fontWeight: FontWeight.bold,
          ),
          top: SizeConfig.safeBlockVertical * 2,
          bottom: SizeConfig.safeBlockVertical * 2,
        ),
        InkWell(
          onTap: () async {
            _homePageController.addBookBottomSheet();
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Utils.green,
            child: Icon(
              Icons.add,
              color: Utils.white,
            ),
          ),
        )
      ],
    );
  }
}
