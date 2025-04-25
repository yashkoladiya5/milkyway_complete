import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/model/sign_up_model.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/profile/provider/profile_edit_screen_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constant/app_strings.dart';

class ProfileEditScreen extends StatefulWidget {
  Map<String, dynamic> userData;
  ProfileEditScreen({super.key, required this.userData});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late double height;
  late double width;
  late ThemeController themeController;
  TextEditingController dummyController = TextEditingController();
  File? selectedImage;
  final _formKey = GlobalKey<FormState>();

  void showImageSelectBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.250,
          width: double.infinity,
          color: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  Provider.of<ProfileEditScreenController>(context,
                          listen: false)
                      .getImage(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.050),
                  alignment: Alignment.center,
                  height: height * 0.070,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1, blurRadius: 10, color: Colors.grey)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : AppColorsDark.greyColor),
                  ),
                  child: Text(
                    "Select From Camera",
                    style: TextStyle(
                        fontSize: 18,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.020),
                child: InkWell(
                  onTap: () async {
                    Provider.of<ProfileEditScreenController>(context,
                            listen: false)
                        .getGalleryImage(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.050),
                    alignment: Alignment.center,
                    height: height * 0.070,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1, blurRadius: 10, color: Colors.grey)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.lightGreyColor
                          : AppColorsDark.greyColor),
                    ),
                    child: Text(
                      "Select From Gallery",
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ProfileEditScreenController>(context, listen: false)
            .fetchAndFillData(widget.userData);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);

    return Scaffold(
      backgroundColor: HexColor(themeController.isLight
          ? AppColorsLight.backgroundColor
          : AppColorsDark.backgroundColor),
      body: Form(key: _formKey, child: Column(children: widgetList())),
    );
  }

  Widget _buildHeaderContainer() {
    return Container(
      padding: EdgeInsets.only(top: height * 0.050),
      height: height * 0.150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor(themeController.isLight
            ? AppColorsLight.backgroundColor
            : AppColorsLight.darkBlueColor),
        boxShadow: [
          if (themeController.isLight)
            const BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromRGBO(128, 128, 128, 0.25),
                spreadRadius: 0.5,
                blurRadius: 10)
          else
            const BoxShadow(
                color: Colors.black, spreadRadius: 1, blurRadius: 10)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.maybePop(context, "walletPage");
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
              )),
          SizedBox(
            height: height * 0.050,
            width: width * 0.700,
            // color: Colors.red,
            child: Center(
                child: Text(
              AppStrings.editProfile,
              style: TextStyle(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
              ))
        ],
      ),
    );
  }

  Widget _buildProfileContainerView() {
    return Stack(
      children: [
        Consumer<ProfileEditScreenController>(
          builder: (context, value, child) {
            return InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                showImageSelectBottomSheet();
              },
              child: Container(
                  margin: EdgeInsets.only(top: height * 0.050),
                  height: height * 0.110,
                  width: width * 0.240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey,
                  ),
                  child: value.imageUrl.isEmpty
                      ? Icon(
                          Icons.person,
                          size: 50,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(value.imageUrl))),
            );
          },
        ),
        Positioned(
          top: height * 0.120,
          left: width * 0.165,
          child: Container(
            height: height * 0.035,
            width: width * 0.075,
            decoration: BoxDecoration(
                color: HexColor(AppColorsLight.orangeColor),
                borderRadius: BorderRadius.circular(40)),
            child: Icon(
              Icons.edit,
              size: 17,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextField(
      {required String hintText,
      required bool readOnly,
      required TextEditingController controller,
      String? Function(String?)? validator,
      void Function()? onTap,
      void Function(String)? onChanged}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.10, vertical: height * 0.008),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: width * 0.030, top: height * 0.010),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 13)),
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor)),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Consumer<ProfileEditScreenController>(
      builder: (context, value, child) {
        return InkWell(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              if (value.selectedFile != null) {
                Map<String, dynamic> updatedData = {};
                print("NOT NULL");
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? userId =
                    prefs.getString(SharedPreferenceKeys.userIdKey);

                final firestore = FirebaseFirestore.instance.collection("user");

                await firestore.doc(userId).get().then(
                  (v) {
                    final userData = v.data();

                    updatedData = {
                      "name": value.nameController.text,
                      "lastName": value.lastNameController.text,
                      "address": userData!["address"],
                      "area": userData["area"],
                      "confirmPassword": userData["confirmPassword"],
                      "email": value.emailController.text,
                      "mobileNumber": value.mobileController.text,
                      "password": userData["password"],
                      "pincode": userData["pincode"],
                      "image": value.imageUrl ?? "",
                    };

                    print("UPDATED DATA TYPE : ${updatedData}");
                  },
                );
                await firestore.doc(userId).set(updatedData);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Data Updated Sucessfully")));

                Navigator.pop(context, "refresh");
              } else {
                print("NULL IMAGE");

                Map<String, dynamic> updatedData = {};

                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? userId =
                    prefs.getString(SharedPreferenceKeys.userIdKey);

                final firestore = FirebaseFirestore.instance.collection("user");

                await firestore.doc(userId).get().then(
                  (v) {
                    final userData = v.data();

                    updatedData = {
                      "name": value.nameController.text,
                      "lastName": value.lastNameController.text,
                      "address": userData!["address"],
                      "area": userData["area"],
                      "confirmPassword": userData["confirmPassword"],
                      "email": value.emailController.text,
                      "mobileNumber": value.mobileController.text,
                      "password": userData["password"],
                      "pincode": userData["pincode"],
                    };

                    print("UPDATED DATA TYPE : ${updatedData}");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Data Updated Sucessfully")));
                    Navigator.pop(context);
                  },
                );

                await firestore.doc(userId).set(updatedData);
              }
              print("VALID FORM");
            } else {
              print("INVALID FORM");
            }
          },
          child: Container(
            height: height * 0.055,
            width: width * 0.320,
            decoration: BoxDecoration(
                color: HexColor(AppColorsLight.orangeColor),
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                AppStrings.save,
                style: TextStyle(
                    fontSize: 18,
                    color: HexColor(AppColorsDark.whiteColor),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> widgetList() {
    return [
      _buildHeaderContainer(),
      _buildProfileContainerView(),
      SizedBox(
        height: height * 0.020,
      ),
      Consumer<ProfileEditScreenController>(
        builder: (context, value, child) {
          return _buildTextField(
              readOnly: false,
              onChanged: (p0) {
                if (_formKey.currentState != null) {
                  _formKey.currentState!.validate();
                }
              },
              validator: (p0) {
                return value.nameValidation(p0!);
              },
              hintText: "Name",
              controller: value.nameController);
        },
      ),
      Consumer<ProfileEditScreenController>(
        builder: (context, value, child) {
          return _buildTextField(
              readOnly: false,
              onChanged: (p0) {
                if (_formKey.currentState != null) {
                  _formKey.currentState!.validate();
                }
              },
              validator: (p0) {
                return value.lastNameValidation(p0!);
              },
              hintText: "Last Name",
              controller: value.lastNameController);
        },
      ),
      Consumer<ProfileEditScreenController>(
        builder: (context, value, child) {
          return _buildTextField(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text("You cannot change this Field")));
              },
              readOnly: true,
              validator: (p0) {
                return value.emailValidation(p0!);
              },
              onChanged: (p0) {
                if (_formKey.currentState != null) {
                  _formKey.currentState!.validate();
                }
              },
              hintText: "E-mail ID",
              controller: value.emailController);
        },
      ),
      Consumer<ProfileEditScreenController>(
        builder: (context, value, child) {
          return _buildTextField(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text("You cannot change this Field")));
              },
              readOnly: true,
              onChanged: (p0) {
                if (_formKey.currentState != null) {
                  _formKey.currentState!.validate();
                }
              },
              validator: (p0) {
                return value.mobileValidation(p0!);
              },
              hintText: "Mobile Number",
              controller: value.mobileController);
        },
      ),
      SizedBox(
        height: height * 0.220,
      ),
      _buildSaveButton()
    ];
  }
}
