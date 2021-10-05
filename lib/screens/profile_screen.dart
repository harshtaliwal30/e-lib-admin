import 'package:csc_picker/csc_picker.dart';
import 'package:e_lib_admin/Utils/app_ui_constant.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());

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
          "Profile",
          color: Utils.primaryColor,
          fontSize: AppUIConst.baseFontSize * 4.5,
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppUIConst.safeBlockHorizontal * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                  height: AppUIConst.screenHeight / 5,
                  width: AppUIConst.screenWidth / 2.5,
                  decoration: BoxDecoration(
                    color: Utils.lightBgColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.image,
                    color: Utils.amber,
                    size: AppUIConst.iconGeneralHeightAndWidth * 2,
                  ),
                ),
                SizedBox(height: 15),
                getTextFormField(_profileController.libraryNameController, "Library Name *"),
                SizedBox(height: 15),
                getTextFormField(_profileController.libraryEmailController, "Email *", textInputType: TextInputType.emailAddress),
                SizedBox(height: 15),
                getTypeButton(),
                SizedBox(height: 15),
                getTextFormField(_profileController.libraryPhoneController, "Phone *", textInputType: TextInputType.phone),
                SizedBox(height: 15),
                getTextFormField(_profileController.addressController, "Address *"),
                SizedBox(height: 15),
                CSCPicker(
                  showStates: true,
                  showCities: true,
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Utils.lightBgColor,
                  ),
                  disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade300,
                  ),
                  //placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",
                  //labels for dropdown
                  countryDropdownLabel: "*Country",
                  stateDropdownLabel: "*State",
                  cityDropdownLabel: "*City",
                  defaultCountry: DefaultCountry.India,
                  selectedItemStyle: TextStyle(
                    color: Utils.darkGrey,
                  ),
                  dropdownHeadingStyle: TextStyle(
                    color: Utils.black,
                    fontSize: AppUIConst.baseFontSize * 5,
                    fontWeight: FontWeight.bold,
                  ),

                  dropdownItemStyle: TextStyle(
                    color: Utils.black,
                  ),
                  dropdownDialogRadius: 10.0,
                  searchBarRadius: 10.0,
                  onCountryChanged: (value) {
                    _profileController.countryValue.value = value;
                  },

                  onStateChanged: (value) {
                    _profileController.stateValue.value = value ?? "";
                  },

                  onCityChanged: (value) {
                    _profileController.cityValue.value = value ?? "";
                  },
                ),
                SizedBox(height: 15),
                Text(_profileController.countryValue.value + _profileController.stateValue.value + _profileController.cityValue.value),
                Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppUIConst.safeBlockHorizontal * 20,
                    ),
                    color: Utils.blue,
                    elevation: 0,
                    onPressed: () {},
                    child: Utils().getText(
                      "Save",
                      color: Utils.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField getTextFormField(
    TextEditingController controller,
    String labelText, {
    TextInputType textInputType = TextInputType.text,
    var onChange,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      style: TextStyle(color: Utils.darkGrey),
      cursorColor: Utils.darkGrey,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppUIConst.safeBlockHorizontal * 4,
          vertical: AppUIConst.safeBlockVertical * 2,
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: Utils.darkGrey),
        fillColor: Utils.lightBgColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Utils.lightBgColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Utils.lightBgColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        filled: true,
      ),
    );
  }

  Widget getTypeButton() {
    return Align(
      alignment: Alignment.center,
      child: ToggleButtons(
        constraints: BoxConstraints(
          minWidth: AppUIConst.screenWidth / 2.5,
          minHeight: AppUIConst.screenHeight / 25,
        ),
        fillColor: Utils.blue,
        borderColor: Utils.blue,
        selectedColor: Utils.white,
        selectedBorderColor: Utils.blue,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        children: <Widget>[
          Text("Private"),
          Text("Institutional"),
        ],
        onPressed: (int index) {
          for (int buttonIndex = 0; buttonIndex < _profileController.isSelected.length; buttonIndex++) {
            if (buttonIndex == index) {
              _profileController.isSelected[buttonIndex] = true;
            } else {
              _profileController.isSelected[buttonIndex] = false;
            }
          }
          print(_profileController.isSelected);
        },
        isSelected: _profileController.isSelected,
      ),
    );
  }
}
