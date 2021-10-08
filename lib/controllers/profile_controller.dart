import 'dart:io';
import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  TextEditingController libraryNameController = TextEditingController();
  TextEditingController libraryEmailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController libraryPhoneController = TextEditingController();
  var isSelected = [true, false].obs;
  var countryValue = "".obs;
  var stateValue = "".obs;
  var cityValue = "".obs;
  var address = "".obs;
  var image = File("").obs;

  _imgFromCamera() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    file != null ? image.value = File(file.path) : image.value = File("");
  }

  _imgFromGallery() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    file != null ? image.value = File(file.path) : image.value = File("");
  }

  Future<dynamic> openPickerOptions() {
    return Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(AppUIConst.safeBlockVertical * 2),
        child: new Wrap(
          children: <Widget>[
            new ListTile(
              leading: new Icon(
                Icons.photo_library,
                color: Utils.white,
              ),
              title: Utils().getText(
                "Photo Library",
                color: Utils.white,
              ),
              onTap: () {
                _imgFromGallery();
                Get.back();
              },
            ),
            Divider(
              color: Utils.white,
              height: 0,
            ),
            new ListTile(
              leading: new Icon(
                Icons.photo_camera,
                color: Utils.white,
              ),
              title: Utils().getText(
                "Camera",
                color: Utils.white,
              ),
              onTap: () {
                _imgFromCamera();
                Get.back();
              },
            ),
            if (image.value.path.length > 0) ...[
              Divider(
                color: Utils.white,
                height: 0,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.hide_image_outlined,
                  color: Utils.white,
                ),
                title: Utils().getText(
                  "Remove",
                  color: Utils.white,
                ),
                onTap: () {
                  image.value = File("");
                  Get.back();
                },
              ),
            ],
          ],
        ),
      ),
      backgroundColor: Utils.primaryColor,
    );
  }
}
