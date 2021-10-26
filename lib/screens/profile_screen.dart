import 'package:csc_picker/csc_picker.dart';
import 'package:e_lib_admin/Utils/size_config.dart';
import 'package:e_lib_admin/Utils/utils.dart';
import 'package:e_lib_admin/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());
  final _formKey = GlobalKey<FormState>();

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
          fontSize: SizeConfig.baseFontSize * 4.5,
        ),
      ),
      body: Obx(
        () => _profileController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 4,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                _profileController.openPickerOptions();
                              },
                              child: Container(
                                height: SizeConfig.screenHeight / 5,
                                width: SizeConfig.screenWidth / 2.5,
                                decoration: BoxDecoration(
                                  color: Utils.lightBgColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: _profileController.imageUrl.value.length > 0
                                    ? Image.network(_profileController.libraryModel.libraryImage!)
                                    : _profileController.image.value.path.length > 0
                                        ? Image.file(
                                            _profileController.image.value,
                                            fit: BoxFit.fill,
                                          )
                                        : Icon(
                                            Icons.photo_library,
                                            color: Utils.amber,
                                            size: SizeConfig.iconGeneralHeightAndWidth * 2,
                                          ),
                              ),
                            ),
                            Image.asset(
                              "assets/images/profile.png",
                              width: SizeConfig.screenWidth / 2,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        getTextFormField(
                          _profileController.libraryNameController,
                          "Library Name *",
                          (value) {
                            if (value!.isEmpty) {
                              return "Please enter library name";
                            } else
                              return null;
                          },
                        ),
                        SizedBox(height: 15),
                        getTextFormField(
                          _profileController.libraryEmailController,
                          "Email *",
                          (value) {
                            if (value!.isEmpty) {
                              return "Please enter email id";
                            } else
                              return null;
                          },
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15),
                        getTypeButton(),
                        SizedBox(height: 15),
                        getTextFormField(
                          _profileController.libraryPhoneController,
                          "Phone *",
                          (value) {
                            if (value!.isEmpty) {
                              return "Please enter phone number";
                            } else
                              return null;
                          },
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(height: 15),
                        getTextFormField(
                          _profileController.addressController,
                          "Address *",
                          (value) {
                            if (value!.isEmpty) {
                              return "Please enter address";
                            } else
                              return null;
                          },
                        ),
                        SizedBox(height: 15),
                        getCSCPicker(),
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            height: 45,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 20,
                            ),
                            color: Utils.blue,
                            elevation: 0,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_profileController.validate()) {
                                  _profileController.uploadProfileImage();
                                }
                              }
                            },
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
      ),
    );
  }

  TextFormField getTextFormField(
    TextEditingController controller,
    String labelText,
    var validator, {
    TextInputType textInputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      style: TextStyle(color: Utils.darkGrey),
      cursorColor: Utils.darkGrey,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 4,
          vertical: SizeConfig.safeBlockVertical * 2,
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
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Utils.red),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Utils.red),
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
          minWidth: SizeConfig.screenWidth / 2.5,
          minHeight: SizeConfig.screenHeight / 25,
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

  Widget getCSCPicker() {
    return CSCPicker(
      showStates: true,
      showCities: true,
      flagState: CountryFlag.DISABLE,
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

      currentCountry: _profileController.countryValue.value,
      currentState: _profileController.stateValue.value,
      currentCity: _profileController.cityValue.value,

      selectedItemStyle: TextStyle(
        color: Utils.darkGrey,
      ),
      dropdownHeadingStyle: TextStyle(
        color: Utils.black,
        fontSize: SizeConfig.baseFontSize * 5,
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
    );
  }
}
