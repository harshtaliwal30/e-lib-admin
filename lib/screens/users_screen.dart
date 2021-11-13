import 'package:e_lib_admin/Utils/size_config.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/users_controller.dart';
import 'package:e_lib_admin/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersScreen extends StatelessWidget {
  final UsersController _usersController = Get.put(UsersController());

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
          "Members",
          color: Utils.primaryColor,
          fontSize: SizeConfig.baseFontSize * 4.5,
        ),
      ),
      body: Obx(
        () => ListView.separated(
          separatorBuilder: (_, __) => Divider(
            height: 0,
            color: Utils.primaryColor,
            endIndent: 20,
            indent: 20,
          ),
          itemCount: _usersController.usersList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => getUserItem(
            _usersController.usersList[index],
          ),
        ),
      ),
    );
  }

  Widget getUserItem(UserModel userModel) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
        vertical: SizeConfig.safeBlockVertical * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: SizeConfig.iconGeneralHeightAndWidth * 0.9,
                backgroundColor: Utils.blue,
                backgroundImage: userModel.userImage != null
                    ? NetworkImage(
                        userModel.userImage!,
                      )
                    : null,
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.userName!,
                    style: TextStyle(
                      color: Utils.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.baseFontSize * 4.5,
                    ),
                  ),
                  // SizedBox(height: 5),
                  Text(
                    userModel.userEmail!,
                    style: TextStyle(
                      color: Utils.primaryColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.baseFontSize * 3.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.phone_rounded,
                color: Utils.grey,
                size: SizeConfig.iconGeneralHeightAndWidth * 0.6,
              ),
              SizedBox(width: 10),
              Text(
                userModel.userPhone!,
                style: TextStyle(
                  color: Utils.primaryColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.baseFontSize * 3.8,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Utils.grey,
                size: SizeConfig.iconGeneralHeightAndWidth * 0.6,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  userModel.address! + ", " + userModel.city! + ", " + userModel.state! + ", " + userModel.country!,
                  style: TextStyle(
                    color: Utils.primaryColor,
                    fontSize: SizeConfig.baseFontSize * 4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
