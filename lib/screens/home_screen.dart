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
        title: Text(
          "Library Name",
          style: TextStyle(
            color: Utils.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shadowColor: Utils.black,
              // elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(
                  color: Utils.black,
                  width: 0.5,
                ),
              ),
              margin: EdgeInsets.only(
                left: AppUIConst.safeBlockHorizontal * 2,
                right: AppUIConst.safeBlockHorizontal * 2,
                bottom: AppUIConst.safeBlockHorizontal * 2,
              ),
              child: Container(
                padding: EdgeInsets.all(
                  AppUIConst.safeBlockHorizontal * 2,
                ),
                height: AppUIConst.screenHeight / 6,
                child: Row(
                  children: [
                    Container(
                      height: AppUIConst.screenHeight / 6,
                      width: AppUIConst.screenWidth / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
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
                          Padding(
                            padding: EdgeInsets.only(
                              left: AppUIConst.safeBlockHorizontal * 3,
                              top: AppUIConst.safeBlockHorizontal * 4,
                            ),
                            child: Text(
                              "Cracking the coding interview",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                color: Utils.black,
                                fontWeight: FontWeight.bold,
                                fontSize: AppUIConst.safeBlockHorizontal * 4.5,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: AppUIConst.safeBlockHorizontal * 3,
                              top: AppUIConst.safeBlockHorizontal * 1,
                            ),
                            child: Text(
                              "Quantity",
                              style: TextStyle(
                                color: Utils.black,
                                fontSize: AppUIConst.safeBlockHorizontal * 4,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                              left: AppUIConst.safeBlockHorizontal * 3,
                              bottom: AppUIConst.safeBlockHorizontal * 2,
                            ),
                            child: Text(
                              "Price",
                              style: TextStyle(
                                color: Utils.black,
                                fontSize: AppUIConst.safeBlockHorizontal * 4,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
