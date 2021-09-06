import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Utils.white,
        title: getText(
          "Library Name",
          fontSize: AppUIConst.baseFontSize * 4.5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            getBookItem(),
            getBookItem(),
            getBookItem(),
            getBookItem(),
          ],
        ),
      ),
    );
  }

  Widget getBookItem() {
    return Container(
      margin: EdgeInsets.only(
        left: AppUIConst.safeBlockHorizontal * 2,
        right: AppUIConst.safeBlockHorizontal * 2,
        bottom: AppUIConst.safeBlockHorizontal * 4,
      ),
      child: Stack(
        children: [
          Card(
            color: Utils.linen,
            shadowColor: Utils.black54,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            margin: EdgeInsets.only(
              right: AppUIConst.safeBlockHorizontal * 3,
            ),
            child: Container(
              height: AppUIConst.screenHeight / 6,
              child: Row(
                children: [
                  Container(
                    height: AppUIConst.screenHeight / 6,
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
                            "Cracking the coding interview",
                            fontSize: AppUIConst.baseFontSize * 4.5,
                          ),
                          top: AppUIConst.safeBlockVertical * 1,
                          right: AppUIConst.safeBlockHorizontal * 3,
                          left: AppUIConst.safeBlockHorizontal * 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            getWithPadding(
                              getText(
                                "Author",
                                color: Utils.darkGrey,
                                fontSize: AppUIConst.baseFontSize * 4,
                              ),
                              left: AppUIConst.safeBlockHorizontal * 3,
                              right: AppUIConst.safeBlockHorizontal * 3,
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Utils.crimson,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          margin: EdgeInsets.only(
                            left: AppUIConst.safeBlockHorizontal * 3,
                          ),
                          child: getWithPadding(
                            getText(
                              "Quantity: 100",
                              color: Utils.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: AppUIConst.baseFontSize * 3.5,
                            ),
                            top: AppUIConst.safeBlockVertical * 0.5,
                            bottom: AppUIConst.safeBlockVertical * 0.5,
                            left: AppUIConst.safeBlockHorizontal * 4,
                            right: AppUIConst.safeBlockHorizontal * 4,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getWithPadding(
                              getText(
                                "Price",
                                color: Utils.green,
                                fontSize: AppUIConst.baseFontSize * 4,
                              ),
                              left: AppUIConst.safeBlockHorizontal * 3,
                            ),
                            Container(
                              color: Utils.whip,
                              child: getWithPadding(
                                getText(
                                  "Security %",
                                  color: Utils.darkGrey,
                                  fontSize: AppUIConst.baseFontSize * 4,
                                ),
                                top: AppUIConst.safeBlockVertical * 0.5,
                                bottom: AppUIConst.safeBlockVertical * 0.5,
                                left: AppUIConst.safeBlockHorizontal * 3,
                                right: AppUIConst.safeBlockHorizontal * 3,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        getWithPadding(
                          getText(
                            "Category",
                            color: Utils.darkGrey,
                            fontSize: AppUIConst.baseFontSize * 4,
                          ),
                          bottom: AppUIConst.safeBlockVertical * 1,
                          left: AppUIConst.safeBlockHorizontal * 3,
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
            child: Opacity(
              opacity: 0.4,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Utils.blue,
                child: Icon(
                  Icons.edit,
                  size: AppUIConst.iconExamHeightAndWidth * 0.6,
                  color: Colors.white,
                ),
              ),
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
    Color color = Utils.black,
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
