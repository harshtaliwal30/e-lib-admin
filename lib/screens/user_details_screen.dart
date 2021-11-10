import 'package:e_lib_admin/Utils/size_config.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/users_controller.dart';
import 'package:e_lib_admin/models/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel userModel;
  UserDetailsScreen({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
        vertical: SizeConfig.safeBlockVertical * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: SizeConfig.iconGeneralHeightAndWidth * 2.5,
            backgroundColor: Utils.blue,
            backgroundImage: userModel.userImage != null
                ? NetworkImage(
                    userModel.userImage!,
                  )
                : null,
          ),
          SizedBox(height: 10),
          Text(
            userModel.userName!,
            style: TextStyle(
              color: Utils.white,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.baseFontSize * 4.5,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.email_rounded,
                color: Utils.grey,
                size: SizeConfig.iconGeneralHeightAndWidth * 0.6,
              ),
              Text(
                "  " + userModel.userEmail!,
                style: TextStyle(
                  color: Utils.white,
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
                Icons.phone_rounded,
                color: Utils.grey,
                size: SizeConfig.iconGeneralHeightAndWidth * 0.6,
              ),
              Text(
                "  " + userModel.userPhone!,
                style: TextStyle(
                  color: Utils.white,
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
              Expanded(
                child: Text(
                  "  " + userModel.address! + ", " + userModel.city! + ", " + userModel.state! + ", " + userModel.country!,
                  style: TextStyle(
                    color: Utils.white,
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
