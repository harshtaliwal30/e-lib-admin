import 'dart:convert';

import 'package:dio/dio.dart';

class CloudinaryManager {
  Dio dio = Dio();
  static const String CLOUDINARY_THUMB_IMAGE_HEIGHT = "h_400/";
  static const String CLOUDINARY_FULL_SIZE_IMAGE_QUALITY = "q_90/";
  static const String CLOUDINARY_UPLOAD_URL = "https://api.cloudinary.com/v1_1/dciyee0g5/image/upload";
  static const String CLOUDINARY_DELETE_URL = "https://api.cloudinary.com/v1_1/dciyee0g5/image/destroy";

  Future<String> uploadImage(FormData formData) async {
    try {
      Response response = await dio.post(CLOUDINARY_UPLOAD_URL, data: formData);

      var data = jsonDecode(response.toString());
      print(data['secure_url']);
      return data['secure_url'];
    } catch (e) {
      print(e);
      return "false";
    }
  }

  Future<String> deleteImageFromCloudinary(FormData formData) async {
    try {
      Response response = await dio.post(CLOUDINARY_DELETE_URL, data: formData);

      var data = jsonDecode(response.toString());
      // print(data['result']);
      return data['result'];
    } catch (e) {
      print(e);
      return "false";
    }
  }

  // String getThumbnailofCloudinaryImage(String productImage) {
  //   // print('Cloudinary Image - $productImage');
  //   List temp = productImage.split("upload/");
  //   String finalUrl = temp[0] + "upload/" + CLOUDINARY_THUMB_IMAGE_HEIGHT + temp[1];
  //   // print('Cloudinary Image thumb- $finalUrl');
  //   return finalUrl;
  // }

  // String getFullSizeImageOfCloudinary(String productImage) {
  //   // print('Cloudinary Image - $productImage');
  //   List temp = productImage.split("upload/");
  //   String finalUrl = temp[0] + "upload/" + CLOUDINARY_FULL_SIZE_IMAGE_QUALITY + temp[1];
  //   // print('Cloudinary Image thumb- $finalUrl');
  //   return finalUrl;
  // }

  // String getThumbnailOfFirebaseImage(String productImage) {
  //   String finalUrl = "https://res.cloudinary.com/nearst-app/image/fetch/" + CLOUDINARY_THUMB_IMAGE_HEIGHT + Uri.encodeComponent(productImage);
  //   // print('Cloudinary Image thumb- $finalUrl');
  //   return finalUrl;
  // }

  // String getFullSizeImageOfFirebase(String productImage) {
  //   String finalUrl = "https://res.cloudinary.com/nearst-app/image/fetch/" + CLOUDINARY_FULL_SIZE_IMAGE_QUALITY + Uri.encodeComponent(productImage);
  //   // print('Cloudinary Image thumb- $finalUrl');
  //   return finalUrl;
  // }
}
