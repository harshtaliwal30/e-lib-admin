import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/add_book_controller.dart';
import 'package:e_lib_admin/controllers/home_page_controller.dart';
import 'package:e_lib_admin/screens/add_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Utils.white,
        title: getText(
          "Library Name",
          color: Utils.primaryColor,
          fontSize: AppUIConst.baseFontSize * 4.5,
        ),
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
                              left: AppUIConst.safeBlockHorizontal * 3,
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
                                  fontSize: AppUIConst.baseFontSize * 3.5,
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
                            var result = await Get.bottomSheet(
                              AddBookScreen(),
                              backgroundColor: Utils.white,
                              // isDismissible: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              elevation: 15,
                            );
                            Get.delete<AddBookController>();
                            if (result == "bookAdded ") {
                              _homePageController.fetchBooks();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Utils.crimson,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            margin: EdgeInsets.only(
                              left: AppUIConst.safeBlockHorizontal * 3,
                            ),
                            child: Row(
                              children: [
                                getWithPadding(
                                  Icon(
                                    Icons.add,
                                    color: Utils.white,
                                    size: AppUIConst.baseFontSize * 4.5,
                                  ),
                                  left: AppUIConst.safeBlockHorizontal * 3,
                                ),
                                getWithPadding(
                                  getText(
                                    "Add Book",
                                    color: Utils.white,
                                    fontSize: AppUIConst.baseFontSize * 3.5,
                                  ),
                                  top: AppUIConst.safeBlockVertical * 1,
                                  bottom: AppUIConst.safeBlockVertical * 1,
                                  left: AppUIConst.safeBlockHorizontal * 2,
                                  right: AppUIConst.safeBlockHorizontal * 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
    );
  }

  Widget getBookItem(int index) {
    return Container(
      margin: EdgeInsets.only(
        left: AppUIConst.safeBlockHorizontal * 2,
        right: AppUIConst.safeBlockHorizontal * 2,
        bottom: AppUIConst.safeBlockHorizontal * 3,
      ),
      child: Stack(
        children: [
          Card(
            shadowColor: Utils.white,
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            margin: EdgeInsets.only(
              right: AppUIConst.safeBlockHorizontal * 3.5,
            ),
            child: Container(
              height: AppUIConst.screenHeight / 5.5,
              child: Row(
                children: [
                  Container(
                    height: AppUIConst.screenHeight / 5.5,
                    width: AppUIConst.screenWidth / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
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
                        getWithPadding(
                          getText(
                            _homePageController.booksDataList[index].bookName,
                            fontSize: AppUIConst.baseFontSize * 4,
                          ),
                          top: AppUIConst.safeBlockVertical * 1,
                          right: AppUIConst.safeBlockHorizontal * 5,
                          left: AppUIConst.safeBlockHorizontal * 3,
                        ),
                        getWithPadding(
                          getText(
                            _homePageController.booksDataList[index].authorName,
                            color: Utils.grey,
                            fontSize: AppUIConst.baseFontSize * 3.5,
                          ),
                          left: AppUIConst.safeBlockHorizontal * 3,
                          right: AppUIConst.safeBlockHorizontal * 3,
                          bottom: AppUIConst.safeBlockHorizontal * 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Utils.amber,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          margin: EdgeInsets.only(
                            left: AppUIConst.safeBlockHorizontal * 3,
                          ),
                          child: getWithPadding(
                            getText(
                              "Quantity: " + _homePageController.booksDataList[index].quantity.toString(),
                              color: Utils.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: AppUIConst.baseFontSize * 3,
                            ),
                            top: AppUIConst.safeBlockVertical * 0.7,
                            bottom: AppUIConst.safeBlockVertical * 0.7,
                            left: AppUIConst.safeBlockHorizontal * 5,
                            right: AppUIConst.safeBlockHorizontal * 5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getWithPadding(
                              getText(
                                "₹" + _homePageController.booksDataList[index].price.toString(),
                                color: Utils.green,
                                fontWeight: FontWeight.bold,
                                fontSize: AppUIConst.baseFontSize * 3.5,
                              ),
                              left: AppUIConst.safeBlockHorizontal * 3,
                            ),
                            Container(
                              color: Utils.primaryColor,
                              child: getWithPadding(
                                getText(
                                  "Security: " + _homePageController.booksDataList[index].percentSecurity.toString() + "%",
                                  color: Utils.white,
                                  fontSize: AppUIConst.baseFontSize * 3.5,
                                ),
                                top: AppUIConst.safeBlockVertical * 0.5,
                                bottom: AppUIConst.safeBlockVertical * 0.5,
                                left: AppUIConst.safeBlockHorizontal * 3,
                                right: AppUIConst.safeBlockHorizontal * 2,
                              ),
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
                            left: AppUIConst.safeBlockHorizontal * 3,
                            bottom: AppUIConst.safeBlockVertical * 1,
                          ),
                          child: getWithPadding(
                            getText(
                              _homePageController.booksDataList[index].category ?? "Category",
                              fontSize: AppUIConst.baseFontSize * 3.5,
                            ),
                            top: AppUIConst.safeBlockVertical * 0.5,
                            bottom: AppUIConst.safeBlockVertical * 0.5,
                            left: AppUIConst.safeBlockHorizontal * 3,
                            right: AppUIConst.safeBlockHorizontal * 3,
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
                    var result = await Get.bottomSheet(
                      AddBookScreen(bookDataList: _homePageController.booksDataList[index]),
                      backgroundColor: Utils.white,
                      // isDismissible: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      elevation: 15,
                    );
                    Get.delete<AddBookController>();
                    if (result == "bookAdded ") {
                      _homePageController.fetchBooks();
                    }
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Utils.primaryColor,
                    child: Icon(
                      Icons.edit,
                      size: AppUIConst.iconExamHeightAndWidth * 0.6,
                      color: Utils.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Utils.red,
                  child: Icon(
                    Icons.delete,
                    size: AppUIConst.iconExamHeightAndWidth * 0.6,
                    color: Utils.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding getWithPadding(
    Widget child, {
    double left = 0.0,
    right = 0.0,
    top = 0.0,
    bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: child,
    );
  }

  Text getText(
    String content, {
    Color color = Utils.primaryColor,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Text(
      content,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
