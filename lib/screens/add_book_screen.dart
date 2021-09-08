import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:flutter/material.dart';

class AddBookScreen extends StatelessWidget {
  // const AddBookScreen({Key? key}) : super(key: key);

  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController securityPercentController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: getWithPadding(
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppUIConst.safeBlockVertical * 0.5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Utils.primaryColor,
                      ),
                    ),
                    child: Icon(
                      Icons.file_upload_outlined,
                      color: Utils.primaryColor,
                    ),
                  ),
                  left: AppUIConst.safeBlockHorizontal * 3,
                  right: AppUIConst.safeBlockHorizontal * 3,
                  top: AppUIConst.safeBlockVertical * 1.5,
                ),
              ),
            ],
          ),
          getWithPadding(
            getTextFormField(bookNameController, 'Book Name'),
            left: AppUIConst.safeBlockHorizontal * 3,
            right: AppUIConst.safeBlockHorizontal * 3,
            top: AppUIConst.safeBlockHorizontal * 3,
          ),
          getWithPadding(
            getTextFormField(authorNameController, 'Author Name'),
            left: AppUIConst.safeBlockHorizontal * 3,
            right: AppUIConst.safeBlockHorizontal * 3,
            top: AppUIConst.safeBlockVertical * 1.5,
          ),
          Row(
            children: [
              Expanded(
                child: getWithPadding(
                  getTextFormField(
                    priceController,
                    'Price',
                  ),
                  left: AppUIConst.safeBlockHorizontal * 3,
                  right: AppUIConst.safeBlockHorizontal * 3,
                  top: AppUIConst.safeBlockVertical * 1.5,
                ),
              ),
              Expanded(
                child: getWithPadding(
                  getTextFormField(
                    securityPercentController,
                    'Security % of Price',
                  ),
                  left: AppUIConst.safeBlockHorizontal * 3,
                  right: AppUIConst.safeBlockHorizontal * 3,
                  top: AppUIConst.safeBlockVertical * 1.5,
                ),
              ),
            ],
          ),
          getWithPadding(
            getTextFormField(quantityController, 'Quantity'),
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
                    onPressed: () {},
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
    );
  }

  TextFormField getTextFormField(TextEditingController controller, String labelText) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      cursorColor: Utils.primaryColor,
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
