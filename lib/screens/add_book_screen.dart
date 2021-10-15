import 'package:e_lib_admin/Utils/size_config.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/add_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBookScreen extends StatelessWidget {
  final AddBookController _addBookController = Get.put(AddBookController());
  final _formKey = GlobalKey<FormState>();
  final bookData;
  AddBookScreen({this.bookData});

  @override
  Widget build(BuildContext context) {
    if (bookData != null) {
      _addBookController.bookNameController.text = bookData.bookName;
      _addBookController.authorNameController.text = bookData.authorName;
      _addBookController.priceController.text = bookData.price.toString();
      _addBookController.securityPercentController.text =
          bookData.percentSecurity.toString();
      _addBookController.securityMoneyController.text =
          (double.parse(_addBookController.securityPercentController.text) *
                  double.parse(_addBookController.priceController.text) /
                  100.0)
              .round()
              .toString();
      _addBookController.quantityController.text = bookData.quantity.toString();
    }
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils().getWithPadding(
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 0.5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Utils.primaryColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Utils().getText(
                      "Upload Image   ",
                      fontSize: SizeConfig.baseFontSize * 3.0,
                    ),
                    Icon(
                      Icons.file_upload_outlined,
                      color: Utils.primaryColor,
                    ),
                  ],
                ),
              ),
              left: SizeConfig.safeBlockHorizontal * 3,
              right: SizeConfig.safeBlockHorizontal * 3,
              top: SizeConfig.safeBlockVertical * 1.5,
            ),
            Utils().getWithPadding(
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
              left: SizeConfig.safeBlockHorizontal * 3,
              right: SizeConfig.safeBlockHorizontal * 3,
              top: SizeConfig.safeBlockHorizontal * 3,
            ),
            Utils().getWithPadding(
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
              left: SizeConfig.safeBlockHorizontal * 3,
              right: SizeConfig.safeBlockHorizontal * 3,
              top: SizeConfig.safeBlockVertical * 1.5,
            ),
            Row(
              children: [
                Expanded(
                  child: Utils().getWithPadding(
                    getTextFormField(
                      _addBookController.priceController,
                      'Price',
                      (value) {
                        if (value!.isEmpty) {
                          return "Please enter price";
                        } else
                          return null;
                      },
                      onChange: (value) {
                        _addBookController.securityPercentController.text = "";
                      },
                      textInputType: TextInputType.number,
                    ),
                    left: SizeConfig.safeBlockHorizontal * 3,
                    right: SizeConfig.safeBlockHorizontal * 3,
                    top: SizeConfig.safeBlockVertical * 1.5,
                  ),
                ),
                Expanded(
                  child: Utils().getWithPadding(
                    getTextFormField(
                      _addBookController.securityPercentController,
                      '% Security',
                      (value) {
                        if (value!.isEmpty) {
                          return "Enter 0 < % < 100";
                        } else if (!value!.isEmpty &&
                            (double.parse(value) > 100 ||
                                double.parse(value) < 0)) {
                          return "0 < % < 100";
                        } else {
                          return null;
                        }
                      },
                      onChange: (value) {
                        var value =
                            _addBookController.securityPercentController.text;
                        if (_addBookController.priceController.text.isEmpty) {
                          Utils().showWarningSnackbar("Enter price first");
                        } else if (value.isNotEmpty &&
                            !value.contains('-') &&
                            double.parse(value) <= 100.0 &&
                            double.parse(value) >= 0) {
                          _addBookController.securityMoneyController
                              .text = (double.parse(_addBookController
                                      .securityPercentController.text) *
                                  double.parse(
                                      _addBookController.priceController.text) /
                                  100.0)
                              .round()
                              .toString();
                        } else {
                          Utils().showWarningSnackbar(
                              "Enter value between 0 and 100");
                        }
                      },
                      textInputType: TextInputType.number,
                    ),
                    left: SizeConfig.safeBlockHorizontal * 3,
                    right: SizeConfig.safeBlockHorizontal * 3,
                    top: SizeConfig.safeBlockVertical * 1.5,
                  ),
                ),
                Expanded(
                  child: Utils().getWithPadding(
                    getTextFormField(
                      _addBookController.securityMoneyController,
                      'Security Money',
                      (value) {
                        return null;
                      },
                      enabled: false,
                      textInputType: TextInputType.number,
                    ),
                    left: SizeConfig.safeBlockHorizontal * 3,
                    right: SizeConfig.safeBlockHorizontal * 3,
                    top: SizeConfig.safeBlockVertical * 1.5,
                  ),
                ),
              ],
            ),
            Utils().getWithPadding(
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
              left: SizeConfig.safeBlockHorizontal * 3,
              right: SizeConfig.safeBlockHorizontal * 3,
              top: SizeConfig.safeBlockVertical * 1.5,
              bottom: SizeConfig.safeBlockVertical * 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Utils().getWithPadding(
                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 1.5,
                      ),
                      color: Utils.primaryColor,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (bookData != null) {
                            await _addBookController.updateBook(bookData);
                          } else {
                            await _addBookController.addBook();
                          }
                        }
                      },
                      child: Text(
                        bookData != null ? 'Update' : 'Add Book',
                        style: TextStyle(
                          color: Utils.white,
                        ),
                      ),
                    ),
                    left: SizeConfig.safeBlockHorizontal * 3,
                    right: SizeConfig.safeBlockHorizontal * 3,
                    bottom: SizeConfig.safeBlockVertical * 1.5,
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
        fontSize: SizeConfig.baseFontSize * 4.0,
      ),
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        filled: false,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Utils.primaryColor,
          fontSize: SizeConfig.baseFontSize * 3.5,
        ),
        hintText: 'Write here ...',
        hintStyle: TextStyle(
          fontSize: SizeConfig.baseFontSize * 3.0,
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
}
