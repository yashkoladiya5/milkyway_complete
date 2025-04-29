import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/model/sign_up_model.dart';
import 'package:milkyway/auth/provider/log_in_page_controller.dart';
import 'package:milkyway/auth/ui/forgot_password_page.dart';
import 'package:milkyway/auth/ui/sign_up_page.dart';
import 'package:milkyway/auth/widgets/custom_bottom_sheet.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/ui/page_view.dart';
import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late double height;
  late double width;
  final _formKey = GlobalKey<FormState>();
  var logInPageController = LogInPageController();
  var themeController = ThemeController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late LoadingController loadingController;
  List<SignUpModel> userList = [];
  int userCheck = 0;
  String? userId;

  String? _validateMobileNumber(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    } else if (value.length > 10) {
      return "Please Enter Valid Number";
    } else if (value.length < 10) {
      return "Too Short Number";
    } else {
      return null;
    }
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    } else if (value.length < 6) {
      return "Password Should Be Of 6 Characters";
    } else if (value.length > 6) {
      return "Password Must be of 6 Characters";
    } else {
      return null;
    }
  }

  setDefault() {
    logInPageController.setDefault();
    _passwordController.clear();
    _contactController.clear();
  }

  logInUser() async {
    loadingController.changeLoad();
    final firestore = FirebaseFirestore.instance.collection("user");

    try {
      final value = await firestore.get();

      userList = value.docs.map((e) => SignUpModel.fromJson(e.data())).toList();

      print(userList.map((e) => e.toJson()));

      for (int i = 0; i < userList.length; i++) {
        if (userList[i].mobileNumber == "+91${_contactController.text}" &&
            userList[i].password == _passwordController.text) {
          userId = value.docs[i].id;
          userCheck = 1;
          break;
        }
      }

      if (userCheck == 1) {
        print(userId);
        await rememberEmailAndPassword();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 200),
            content: Text("Successfully Logged In User")));

        DbHelper dbHelper = DbHelper();

        for (int i = 0; i < AppLists().dairyProductList.length; i++) {
          await dbHelper.insertData(AppLists().dairyProductList[i]);
        }
        print("Data Successfully ADDED");
        await dbHelper.insertPlansData();
        print("Plans Data ADDED");
        await dbHelper.insertGasData();
        print("Gas Data ADDED");
        await dbHelper.insertElectricityData();
        print("Electricity Data ADDED");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PageViewScreen(),
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please Enter Valid Number Or Password")));
        userCheck = 0;
      }
    } catch (e) {
      print("Error during login: $e");

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("An error occurred: $e")));
    }
    loadingController.changeLoad();
  }

  rememberEmailAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (logInPageController.isChecked == true) {
      Map<String, dynamic> userData = {
        "number": _contactController.text,
        "password": _passwordController.text
      };

      String userEncodedData = jsonEncode(userData);
      prefs.setString(SharedPreferenceKeys.userDataKey, userEncodedData);
      prefs.setString(SharedPreferenceKeys.userIdKey, userId!);

      print("Email password setted");
    } else {
      prefs.remove(SharedPreferenceKeys.userDataKey);
    }
  }

  userDataSnackBar() async {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: height * 0.870),
        dismissDirection: DismissDirection.none,
        content: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  "You can LogIn by Your saved number and password",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    var userData =
                        prefs.getString(SharedPreferenceKeys.userDataKey);
                    var decode = jsonDecode(userData!);
                    var userNumber = decode["number"];
                    var password = decode["password"];
                    print("USER DATA TYPE === ${decode.runtimeType}");
                    print("USER DATA === $decode");
                    BottomSheetLogInPage().customBottomSheet(
                        userNumber,
                        password,
                        context,
                        _contactController,
                        _passwordController,
                        logInPageController,
                        height,
                        width);
                  },
                  child: Container(
                    height: height * 0.040,
                    width: width * 0.150,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: HexColor(AppColorsLight.orangeColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "SHOW",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }

  userDataNotFoundSnackBar() {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sorry!! You don't have any saved number or password")));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logInPageController.setDefault();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logInPageController = Provider.of<LogInPageController>(context);
    loadingController = Provider.of<LoadingController>(context);
    themeController = Provider.of<ThemeController>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    if (context.locale.languageCode == 'gu') {
      print("Gujarati");
    } else if (context.locale.languageCode == 'en') {
      print("English");
    } else if (context.locale.languageCode == 'mr') {
      print("Marathi");
    } else {
      print("English");
    }
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
          body: SizedBox(
            height: height,
            width: width,
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(builder: (context) {
                        return Text(
                          (AppStrings.logIn).tr(),
                          style: TextStyle(
                              fontSize: 35,
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.darkBlueColor
                                  : AppColorsDark.whiteColor)),
                        );
                      }),
                      SizedBox(
                        height: height * 0.030,
                      ),
                      Builder(builder: (context) {
                        return _buildTextField(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.050,
                                vertical: height * 0.030),
                            controller: _contactController,
                            hintText: (AppStrings.contactNo).tr(),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              logInPageController.setIsContactFieldTouched();
                              if (_formKey.currentState != null) {
                                _formKey.currentState!.validate();
                              }
                            },
                            validator: (value) {
                              if (logInPageController.isContactFieldTouched) {
                                return _validateMobileNumber(value!);
                              } else {
                                return null;
                              }
                            },
                            contentPadding: const EdgeInsets.only(left: 10));
                      }),
                      Builder(builder: (context) {
                        return _buildTextField(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.050),
                          contentPadding:
                              const EdgeInsets.only(left: 10, top: 12),
                          validator: (value) {
                            if (logInPageController.isPasswordFieldTouched) {
                              return _validatePassword(value!);
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            logInPageController.setIsPasswordFieldTouched();
                            if (_formKey.currentState != null) {
                              _formKey.currentState!.validate();
                            }
                          },
                          keyboardType: TextInputType.text,
                          hintText: (AppStrings.password).tr(),
                          controller: _passwordController,
                          obscureText: logInPageController.isVisible,
                          suffixIcon: InkWell(
                              onTap: () {
                                logInPageController.setPasswordIcon();
                              },
                              child: Icon(logInPageController.isVisible == false
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildCheckBox(),
                            InkWell(onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              var userData = prefs
                                  .getString(SharedPreferenceKeys.userDataKey);

                              if (userData != null) {
                                userDataSnackBar();
                                print("There is some data");
                              } else {
                                userDataNotFoundSnackBar();
                              }
                            }, child: Builder(builder: (context) {
                              return Text(
                                (AppStrings.rememberMe).tr(),
                                style: TextStyle(
                                    color: themeController.isLight
                                        ? Colors.black
                                        : HexColor(AppColorsDark.whiteColor)),
                              );
                            })),
                            SizedBox(
                              width: context.locale.languageCode == 'gu'
                                  ? width * 0.400
                                  : context.locale.languageCode == 'hi'
                                      ? width * 0.350
                                      : context.locale.languageCode == 'mr'
                                          ? width * 0.300
                                          : width * 0.200,
                            ),
                            InkWell(onTap: () {
                              FocusScope.of(context).unfocus();

                              setDefault();
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const ForgotPasswordPage();
                                },
                              )).then(
                                (value) {
                                  setDefault();
                                },
                              );
                            }, child: Builder(builder: (context) {
                              return Text(
                                (AppStrings.forgotPassword).tr(),
                                style: TextStyle(
                                    color: themeController.isLight
                                        ? Colors.black
                                        : HexColor(AppColorsDark.whiteColor)),
                              );
                            }))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.050,
                      ),
                      _buildLogInButton(),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(builder: (context) {
                            return Text(
                              (AppStrings.createNewAccount).tr(),
                              style: TextStyle(
                                  color: themeController.isLight
                                      ? HexColor("#5E5E5E")
                                      : HexColor(AppColorsDark.greyColor)),
                            );
                          }),
                          SizedBox(
                            width: width * 0.010,
                          ),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const SignUpPage();
                                },
                              )).then(
                                (value) => setDefault(),
                              );
                            },
                            child: Text(
                              (AppStrings.clickHere).tr(),
                              style: TextStyle(
                                color: themeController.isLight
                                    ? HexColor("#5E5E5E")
                                    : HexColor(AppColorsDark.whiteColor),
                                decoration: TextDecoration.underline,
                                decorationColor: themeController.isLight
                                    ? HexColor("#5E5E5E")
                                    : HexColor(AppColorsDark.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {String? Function(String?)? validator,
      void Function(String)? onChanged,
      TextInputType? keyboardType,
      TextEditingController? controller,
      String? hintText,
      Widget? suffixIcon,
      void Function()? onTap,
      bool obscureText = false,
      EdgeInsetsGeometry? contentPadding,
      required EdgeInsetsGeometry padding}) {
    return Padding(
      padding: padding,
      child: TextFormField(
        onTap: onTap,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        style: TextStyle(
            color: themeController.isLight
                ? Colors.black
                : HexColor(AppColorsDark.whiteColor)),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                color: themeController.isLight
                    ? Colors.black
                    : HexColor(AppColorsDark.whiteColor)),
            suffixIconColor: themeController.isLight
                ? Colors.black
                : HexColor(AppColorsDark.whiteColor),
            suffixIcon: suffixIcon,
            hintText: hintText,
            contentPadding: contentPadding),
      ),
    );
  }

  Widget _buildCheckBox() {
    return SizedBox(
      child: Checkbox(
        side: BorderSide(
            color: themeController.isLight
                ? Colors.black
                : HexColor(AppColorsDark.whiteColor)),
        activeColor: HexColor(AppColorsLight.orangeColor),
        value: logInPageController.isChecked,
        onChanged: (value) {
          logInPageController.setIsChecked();
        },
      ),
    );
  }

  Widget _buildLogInButton() {
    return InkWell(
      onTap: () async {
        if (_formKey.currentState!.validate() &&
            logInPageController.isChecked == true) {
          await logInUser();

          print("Success");
        } else {
          print("fail");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Enter Contact Number and Password")));
        }
      },
      child: Container(
          height: height * 0.058,
          width: width * 0.350,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: HexColor(AppColorsLight.orangeColor),
                    spreadRadius: 0.5,
                    offset: const Offset(0, 0),
                    blurRadius: 2)
              ],
              color: HexColor(AppColorsLight.orangeColor),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: loadingController.isLoading == false
                ? Builder(builder: (context) {
                    return Text(
                      (AppStrings.logInButton).tr(),
                      style: TextStyle(
                          color: HexColor(AppColorsLight.backgroundColor),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    );
                  })
                : CircularProgressIndicator(
                    color: Colors.white,
                  ),
          )),
    );
  }
}
