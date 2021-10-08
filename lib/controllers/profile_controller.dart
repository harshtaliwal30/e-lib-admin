import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/cloudinary_manager.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/models/library_model.dart';
import 'package:e_lib_admin/services/database_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  LibraryModel libraryModel = LibraryModel();
  TextEditingController libraryNameController = TextEditingController();
  TextEditingController libraryEmailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController libraryPhoneController = TextEditingController();
  var isLoading = true.obs;
  var isSelected = [true, false].obs;
  var countryValue = "".obs;
  var stateValue = "".obs;
  var cityValue = "".obs;
  var address = "".obs;
  var image = File("").obs;

  @override
  void onInit() {
    fetchLibraryData();
    super.onInit();
  }

  void fetchLibraryData() {
    SharedPreferences.getInstance().then((pref) {
      DatabaseHandler().fetchLibraryData(pref.getString(Utils.KEY_LIBRARYID)).then((value) {
        Map<String, dynamic> docData = value.data() as dynamic;
        docData["libraryId"] = value.id;
        libraryModel = LibraryModel.fromJson(docData);
        libraryNameController.text = libraryModel.libraryName ?? "";
        libraryEmailController.text = libraryModel.libraryEmail ?? "";
        libraryPhoneController.text = libraryModel.libraryPhone!;
        addressController.text = libraryModel.address ?? "";
        cityValue.value = libraryModel.city ?? "";
        if (libraryModel.type != null) {
          if (libraryModel.type == "Private") {
            isSelected[0] = true;
            isSelected[1] = false;
          } else {
            isSelected[0] = false;
            isSelected[1] = true;
          }
        }
        isLoading(false);
      });
    });
  }

  uploadProfileImage() async {
    if (image.value.path.length > 0) {
      dio.FormData formData = new dio.FormData.fromMap({
        "file": await dio.MultipartFile.fromFile(
          image.value.path,
          contentType: new MediaType("image", "jpeg"),
        ),
        "upload_preset": "upload_preset",
        "folder": "Profile_Images",
        "cloud_name": "dciyee0g5",
      });
      CloudinaryManager().uploadImage(formData);
    } else {
      Utils().showWarningSnackbar("Please select library image");
    }
  }

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
