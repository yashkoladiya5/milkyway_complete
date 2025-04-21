import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/model/sign_up_model.dart';
import 'package:milkyway/auth/provider/log_in_page_controller.dart';
import 'package:milkyway/auth/provider/new_password_page_controller.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';

import 'package:milkyway/home/ui/page_view.dart';
import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateNewPasswordPage extends StatefulWidget {
  String? email;
  String? mobileNumber;
  CreateNewPasswordPage({super.key, this.email, this.mobileNumber});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  LogInPageController obscureTextController = LogInPageController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late NewPasswordPageController newPasswordPageController;
  late ThemeController themeController;
  late LoadingController loadingController;

  late double width;
  late double height;
  final _formKey = GlobalKey<FormState>();

  String? passwordValidation(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    } else if (value.length < 6) {
      return "password must be of 6 characters";
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    } else if (value != _passwordController.text) {
      return "Password Mismatched!!";
    } else {
      return null;
    }
  }

  setPasswordToFirebase() async {
    loadingController.changeLoad();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("user");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool emailExist = false;
    bool mobileExist = false;

    if (widget.email != null) {
      emailExist = true;
    } else {
      mobileExist = true;
    }

    if (mobileExist) {
      List<SignUpModel> userData = [];
      String? userId;
      await collectionReference
          .where("mobileNumber", isEqualTo: "${widget.mobileNumber}")
          .get()
          .then(
        (value) {
          userId = value.docs[0].id;
          for (var data in value.docs) {
            var map = data.data();
            userData.add(SignUpModel.fromJson(map as Map<String, dynamic>));
          }
        },
      );

      final firestore = FirebaseFirestore.instance.collection("user");
      await firestore
          .doc(userId)
          .set(SignUpModel(
                  name: userData[0].name,
                  address: userData[0].address,
                  area: userData[0].area,
                  email: userData[0].email,
                  mobileNumber: userData[0].mobileNumber,
                  pincode: userData[0].pincode,
                  password: _passwordController.text,
                  // products: AppLists().dairyProductList,
                  confirmPassword: _confirmPasswordController.text)
              .toJson())
          .then(
        (value) {
          prefs.setString(SharedPreferenceKeys.userIdKey, userId!);
          print("DATA SENDED TO FIREBASE");
        },
      );
      print("MOBILE FUNCTION COMPLETED");
      loadingController.changeLoad();
      return;
    } else {
      List<SignUpModel> userData = [];
      String? userId;
      await collectionReference
          .where("email", isEqualTo: "${widget.email}")
          .get()
          .then(
        (value) {
          userId = value.docs[0].id;
          for (var data in value.docs) {
            var map = data.data();
            userData.add(SignUpModel.fromJson(map as Map<String, dynamic>));
          }
        },
      );

      final firestore = FirebaseFirestore.instance.collection("user");
      await firestore
          .doc(userId)
          .set(SignUpModel(
                  name: userData[0].name,
                  address: userData[0].address,
                  area: userData[0].area,
                  email: userData[0].email,
                  mobileNumber: userData[0].mobileNumber,
                  pincode: userData[0].pincode,
                  password: _passwordController.text,
                  // products: AppLists().dairyProductList,
                  confirmPassword: _confirmPasswordController.text)
              .toJson())
          .then(
        (value) {
          print("DATA SENDED TO FIREBASE");
          prefs.setString(SharedPreferenceKeys.userIdKey, userId!);
        },
      );
      print("EMAIL FUNCTION COMPLETED");
      loadingController.changeLoad();
      return;
    }
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    obscureTextController = Provider.of<LogInPageController>(context);
    newPasswordPageController = Provider.of<NewPasswordPageController>(context);
    themeController = Provider.of<ThemeController>(context);
    loadingController = Provider.of<LoadingController>(context);
    return NetworkChecker(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: HexColor(themeController.isLight
                ? AppColorsLight.backgroundColor
                : AppColorsDark.backgroundColor),
            image: DecorationImage(
                image: AssetImage(themeController.isLight
                    ? "assets/images/Auth/Auth_light_image/img-03 3.png"
                    : "assets/images/Auth/Auth_dark_image/img-03 2.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.080,
                  ),
                  IconButton(
                      onPressed: () {
                        newPasswordPageController.setDefault();
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                      )),
                  SizedBox(
                    height: height * 0.080,
                  ),
                  Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              AppStrings.createNewPasswordHeading,
                              style: TextStyle(
                                  color: HexColor(themeController.isLight
                                      ? AppColorsLight.darkBlueColor
                                      : AppColorsDark.whiteColor),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.070,
                          ),
                          _buildTextField(
                              onTap: () {
                                newPasswordPageController
                                    .setPasswordFieldTouched();
                              },
                              onChanged: (value) {
                                if (_formKey.currentState != null) {
                                  _formKey.currentState!.validate();
                                }
                              },
                              validator: (value) {
                                if (newPasswordPageController
                                    .isPasswordFieldTouched) {
                                  return passwordValidation(value!);
                                } else {
                                  return null;
                                }
                              },
                              controller: _passwordController,
                              obscureText: obscureTextController.isVisible,
                              hintText: AppStrings.createNewPasswordTextField,
                              contentPadding: EdgeInsets.only(left: 15)),
                          _buildTextField(
                              onTap: () {
                                newPasswordPageController
                                    .setConfirmPasswordFieldTouched();
                              },
                              onChanged: (value) {
                                newPasswordPageController
                                    .setConfirmPasswordFieldTouched();
                                if (_formKey.currentState != null) {
                                  _formKey.currentState!.validate();
                                }
                              },
                              validator: (value) {
                                if (newPasswordPageController
                                    .isConfirmPasswordFieldTouched) {
                                  return confirmPasswordValidation(value!);
                                } else {
                                  return null;
                                }
                              },
                              controller: _confirmPasswordController,
                              hintText:
                                  AppStrings.createConfirmNewPasswordTextField,
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 12),
                              obscureText: obscureTextController.isVisible,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    obscureTextController.setPasswordIcon();
                                  },
                                  icon: Icon(obscureTextController.isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.030,
                              ),
                              _buildCheckBox(),
                              Text(
                                AppStrings.rememberMe,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.greyColor)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.040,
                          ),
                          Center(
                            child: _buildUpdateButton(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpdateButton() {
    return InkWell(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          await setPasswordToFirebase();
          print("SUCCESS");
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return PageViewScreen();
            },
          ));
        } else {
          print("FAIL");
        }
      },
      child: Container(
        height: height * 0.06,
        width: width * 0.280,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: HexColor(AppColorsLight.orangeColor),
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                  blurRadius: 2)
            ],
            color: HexColor(AppColorsLight.orangeColor),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: loadingController.isLoading == false
              ? Text(
                  AppStrings.updateButton,
                  style: TextStyle(
                      color: HexColor(AppColorsLight.backgroundColor),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              : CircularProgressIndicator(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }

  Widget _buildCheckBox() {
    return Checkbox(
      value: obscureTextController.isChecked,
      side: BorderSide(
          color: themeController.isLight
              ? Colors.black
              : HexColor(AppColorsDark.greyColor)),
      activeColor: HexColor(AppColorsLight.orangeColor),
      onChanged: (value) {
        obscureTextController.setIsChecked();
      },
    );
  }

  Widget _buildTextField(
      {String? hintText,
      Widget? suffixIcon,
      void Function()? onTap,
      String? Function(String?)? validator,
      bool obscureText = false,
      void Function(String)? onChanged,
      TextEditingController? controller,
      EdgeInsetsGeometry? contentPadding}) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
            color: themeController.isLight
                ? Colors.black
                : HexColor(AppColorsDark.greyColor)),
        decoration: InputDecoration(
            suffixIconColor: themeController.isLight
                ? Colors.black
                : HexColor(AppColorsDark.whiteColor),
            hintStyle: TextStyle(
                color: themeController.isLight
                    ? Colors.black
                    : HexColor(AppColorsDark.whiteColor)),
            suffixIcon: suffixIcon,
            contentPadding: contentPadding,
            hintText: hintText),
      ),
    );
  }
}
