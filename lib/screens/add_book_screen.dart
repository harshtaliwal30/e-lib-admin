import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/add_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBookScreen extends StatelessWidget {
  final AddBookController _addBookController = Get.put(AddBookController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getWithPadding(
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: AppUIConst.safeBlockVertical * 0.5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Utils.primaryColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getText(
                      "Upload Image   ",
                      fontSize: AppUIConst.baseFontSize * 3.0,
                    ),
                    Icon(
                      Icons.file_upload_outlined,
                      color: Utils.primaryColor,
                    ),
                  ],
                ),
              ),
              left: AppUIConst.safeBlockHorizontal * 3,
              right: AppUIConst.safeBlockHorizontal * 3,
              top: AppUIConst.safeBlockVertical * 1.5,
            ),
            getWithPadding(
              getTextFormField(
                _addBookController.bookNameController,
                'Book Name',
                (value) {
                  if (value!.isEmpty) {
                    return "Please enter book name";
                  } else
                    return null;
                },
              ),
              left: AppUIConst.safeBlockHorizontal * 3,
              right: AppUIConst.safeBlockHorizontal * 3,
              top: AppUIConst.safeBlockHorizontal * 3,
            ),
            getWithPadding(
              getTextFormField(
                _addBookController.authorNameController,
                'Author Name',
                (value) {
                  if (value!.isEmpty) {
                    return "Please enter author name";
                  } else
                    return null;
                },
              ),
              left: AppUIConst.safeBlockHorizontal * 3,
              right: AppUIConst.safeBlockHorizontal * 3,
              top: AppUIConst.safeBlockVertical * 1.5,
            ),
            Row(
              children: [
                Expanded(
                  child: getWithPadding(
                    getTextFormField(
                      _addBookController.priceController,
                      'Price',
                      (value) {
                        if (value!.isEmpty) {
                          return "Please enter price";
                        } else
                          return null;
                      },
                      textInputType: TextInputType.number,
                    ),
                    left: AppUIConst.safeBlockHorizontal * 3,
                    right: AppUIConst.safeBlockHorizontal * 3,
                    top: AppUIConst.safeBlockVertical * 1.5,
                  ),
                ),
                Expanded(
                  child: getWithPadding(
                    getTextFormField(
                      _addBookController.securityPercentController,
                      '% Security',
                      (value) {
                        if (!value!.isEmpty && (double.parse(value) > 100 || double.parse(value) < 0)) {
                          return "0 < % < 100";
                        } else {
                          return null;
                        }
                      },
                      onChange: (value) {
                        var value = _addBookController.securityPercentController.text;
                        if (_addBookController.priceController.text.isEmpty) {
                          Utils().showWarningSnackbar("Enter price first");
                        } else if (value.isNotEmpty && !value.contains('-') && double.parse(value) <= 100.0 && double.parse(value) >= 0) {
                          _addBookController.securityMoneyController.text =
                              (double.parse(_addBookController.securityPercentController.text) * double.parse(_addBookController.priceController.text) / 100.0).round().toString();
                        } else {
                          Utils().showWarningSnackbar("Enter value between 0 and 100");
                        }
                      },
                      textInputType: TextInputType.number,
                    ),
                    left: AppUIConst.safeBlockHorizontal * 3,
                    right: AppUIConst.safeBlockHorizontal * 3,
                    top: AppUIConst.safeBlockVertical * 1.5,
                  ),
                ),
                Expanded(
                  child: getWithPadding(
                    getTextFormField(
                      _addBookController.securityMoneyController,
                      'Security Money',
                      (value) {
                        return null;
                      },
                      enabled: false,
                      textInputType: TextInputType.number,
                    ),
                    left: AppUIConst.safeBlockHorizontal * 3,
                    right: AppUIConst.safeBlockHorizontal * 3,
                    top: AppUIConst.safeBlockVertical * 1.5,
                  ),
                ),
              ],
            ),
            getWithPadding(
              getTextFormField(
                _addBookController.quantityController,
                'Quantity',
                (value) {
                  if (value!.isEmpty) {
                    return "Please enter quantity of book";
                  } else if (int.parse(value) < 0) {
                    return "Please enter valid value";
                  } else if (int.parse(value) == 0) {
                    return "Please add available books";
                  } else {
                    return null;
                  }
                },
                textInputType: TextInputType.number,
              ),
              left: AppUIConst.safeBlockHorizontal * 3,
              right: AppUIConst.safeBlockHorizontal * 3,
              top: AppUIConst.safeBlockVertical * 1.5,
              bottom: AppUIConst.safeBlockVertical * 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: getWithPadding(
                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                        vertical: AppUIConst.safeBlockVertical * 1.5,
                      ),
                      color: Utils.primaryColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addBookController.addBook();
                        }
                      },
                      child: Text(
                        'Add Book',
                        style: TextStyle(
                          color: Utils.white,
                        ),
                      ),
                    ),
                    left: AppUIConst.safeBlockHorizontal * 3,
                    right: AppUIConst.safeBlockHorizontal * 3,
                    bottom: AppUIConst.safeBlockVertical * 1.5,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField getTextFormField(
    TextEditingController controller,
    String labelText,
    var validator, {
    bool enabled = true,
    TextInputType textInputType = TextInputType.text,
    var onChange,
  }) {
    return TextFormField(
      enabled: enabled,
      autofocus: false,
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Utils.primaryColor,
      style: TextStyle(
        fontSize: AppUIConst.baseFontSize * 4.0,
      ),
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        filled: false,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Utils.primaryColor,
          fontSize: AppUIConst.baseFontSize * 3.5,
        ),
        hintText: 'Write here ...',
        hintStyle: TextStyle(
          fontSize: AppUIConst.baseFontSize * 3.0,
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
