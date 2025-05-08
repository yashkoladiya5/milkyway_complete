import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/model/location_model.dart';
import 'package:milkyway/auth/model/sign_up_model.dart';
import 'package:milkyway/auth/provider/log_in_page_controller.dart';
import 'package:milkyway/auth/provider/sign_up_page_controller.dart';

import 'package:milkyway/auth/widgets/custom_dropdown_button.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/home/ui/page_view.dart';
import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dbhelper/db_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  RegExp? regExp;
  var emailExistCheck;
  var numberExistCheck;
  String userId = "";

  late double height;
  late double width;
  late SignUpPageController signUpController;
  late LogInPageController obscureTextController;
  late ThemeController themeController;
  late LoadingController loadingController;

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "This field Is Required";
    }
    return null;
  }

  String? validateState(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    } else if (value.length < 6) {
      return "Please Enter 6 Digits Password";
    } else if (value.length > 6) {
      return "Please Enter Password of 6 digits";
    }
    return null;
  }

  String? numberValidate(String value) {
    if (value.isEmpty) {
      return "This Field is Required";
    } else if (value.length < 10) {
      return "Please Enter 10 Digits Number";
    } else if (value.length > 10) {
      return "Please Enter Valid Number";
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return "Please Enter Valid Password";
    }
    return null;
  }

  String? emailValidate(String value) {
    if (value.isEmpty) {
      return "This Field Is Required";
    } else if (!regExp!.hasMatch(value)) {
      return "Please Enter Valid Email";
    }
    return null;
  }

  String? validatePincode(String value) {
    if (value.isEmpty) {
      return "This field is required";
    } else if (value.length < 6) {
      return "Please Enter Valid Pincode";
    }
    return null;
  }

  void setFormValidation() {
    signUpController.setNameField();
    signUpController.setStateField();
    signUpController.setAddressField();
    signUpController.setPincodeField();
    signUpController.setNumberField();
    signUpController.setEmailField();
    signUpController.setPasswordField();
    signUpController.setConfirmPasswordField();
  }

  setUserDataToFirebase(BuildContext context) async {
    loadingController.changeLoad();
    final firestore = FirebaseFirestore.instance.collection("user");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // SharedPreferences.setMockInitialValues({});

    await FirebaseFirestore.instance
        .collection("user")
        .where("email", isEqualTo: _emailController.text)
        .get()
        .then(
      (value) async {
        if (value.docs.isNotEmpty) {
          emailExistCheck = value.docs.map(
            (e) => e.data(),
          );

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Email Is Already In Usage")));
        } else {
          emailExistCheck = null;
        }
      },
    );

    await FirebaseFirestore.instance
        .collection("user")
        .where("mobileNumber", isEqualTo: "+91${_mobileController.text}")
        .get()
        .then(
      (value) {
        if (value.docs.isNotEmpty) {
          numberExistCheck = value.docs;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Number Is Already In Use")));
        } else {
          numberExistCheck = null;
        }
      },
    );

    if (emailExistCheck == null && numberExistCheck == null) {
      await firestore
          .add(SignUpModel(
                  pincode: int.parse(_pincodeController.text),
                  mobileNumber: "+91${_mobileController.text}",
                  email: _emailController.text,
                  area: signUpController.stateValue,
                  address: _addressController.text,
                  password: _passwordController.text,
                  confirmPassword: _confirmPasswordController.text,
                  // products: AppLists().dairyProductList,
                  name: _nameController.text)
              .toJson())
          .then(
        (value) {
          print("DATA ADDED TO FIREBASE");
          CollectionReference userData =
              FirebaseFirestore.instance.collection("user");
          userData.get().then(
            (value) async {
              var userDataList = value.docs;

              List<SignUpModel> userList;
              userList = userDataList
                  .map(
                    (e) =>
                        SignUpModel.fromJson(e.data() as Map<String, dynamic>),
                  )
                  .toList();
              print("USER LIST TYPE ==== ${userList.runtimeType}");
              print("USER LIST ==== $userList");

              for (int i = 0; i < userList.length; i++) {
                if (userList[i].mobileNumber ==
                    "+91${_mobileController.text}") {
                  userId = value.docs[i].id;
                  break;
                } else {
                  userId = "";
                }
              }

              DbHelper dbHelper = DbHelper();

              await setTableAndSharedPrefData();

              print("TABLE WILL BE CREATED WITH ID ::: ${userId}");
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
              if (prefs.getString(SharedPreferenceKeys.userIdKey) != null) {
                userId = prefs.getString(SharedPreferenceKeys.userIdKey)!;
                print("USER FOUNDED ==== $userId");
                LocationModel userData;
                Map<String, dynamic> finalData = {};
                await FirebaseFirestore.instance
                    .collection("user")
                    .doc(userId)
                    .get()
                    .then(
                  (value) {
                    final data = value.data()!;

                    userData = LocationModel.fromJson(data);

                    finalData = userData.toJson();
                  },
                );

                await FirebaseFirestore.instance
                    .collection("user")
                    .doc(userId)
                    .collection("location")
                    .add(finalData)
                    .then(
                  (value) async {
                    final locationId = value.id;
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    print("LOCATION ID   ${locationId}");
                    prefs.setString(
                        SharedPreferenceKeys.locationIdKey, locationId);
                  },
                );
                signUpController.setDefaultToAllFields();
                signUpController.setDefault();
                loadingController.changeLoad();
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return PageViewScreen();
                  },
                ));
              } else {
                print("NO USER CREATED");
              }
            },
          );
        },
      ).onError(
        (error, stackTrace) {
          print("ERROR === ${error.toString()}");
        },
      );
    }
  }

  Future setTableAndSharedPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferenceKeys.autoPayId =
        "${userId}.${SharedPreferenceKeys.autoPayId}";
    SharedPreferenceKeys.autoPayBalanceId =
        "${userId}.${SharedPreferenceKeys.autoPayBalanceId}";
    SharedPreferenceKeys.dailyProductIdKey =
        "${userId}.${SharedPreferenceKeys.dailyProductIdKey}";
    SharedPreferenceKeys.locationIdKey =
        "${userId}.${SharedPreferenceKeys.locationIdKey}";
    SharedPreferenceKeys.userDataKey =
        "${userId}.${SharedPreferenceKeys.userDataKey}";
    SharedPreferenceKeys.planKey = "${userId}.${SharedPreferenceKeys.planKey}";
    DatabaseDailyTableStrings.tableName =
        "${DatabaseDailyTableStrings.tableName}_${userId}";
    DatabaseElectricityTableStrings.tableName =
        "${DatabaseElectricityTableStrings.tableName}_${userId}";
    DatabaseGasBookingTableStrings.tableName =
        "${DatabaseGasBookingTableStrings.tableName}_${userId}";
    DatabaseIncomeExpenseTableStrings.tableName =
        "${DatabaseIncomeExpenseTableStrings.tableName}_${userId}";
    DatabasePayGasBillTableStrings.tableName =
        "${DatabasePayGasBillTableStrings.tableName}_${userId}";
    DatabaseProductTableStrings.tableName =
        "${DatabaseProductTableStrings.tableName}_${userId}";
    DatabaseRechargeTableStrings.tableName =
        "${DatabaseRechargeTableStrings.tableName}_${userId}";
    print("DATABASE TABLE NAME ::: ${DatabaseProductTableStrings.tableName}");

    prefs.setString(SharedPreferenceKeys.lastLogInUserId, userId);
    prefs.setString(SharedPreferenceKeys.userIdKey, userId);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await obscureTextController.setDefault();
        regExp = RegExp(emailPattern);
        signUpController.stateController.text =
            signUpController.stateValue ?? "";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    obscureTextController = Provider.of<LogInPageController>(context);
    signUpController = Provider.of<SignUpPageController>(context);
    themeController = Provider.of<ThemeController>(context);
    loadingController = Provider.of<LoadingController>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return NetworkChecker(
      child: Scaffold(
        backgroundColor: HexColor(themeController.isLight
            ? AppColorsLight.backgroundColor
            : AppColorsDark.backgroundColor),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.050,
                  ),
                  _buildHeader(),
                  SizedBox(
                    height: height * 0.040,
                  ),
                  Builder(builder: (context) {
                    return _buildTextField(
                        onChanged: (value) {
                          signUpController.setNameField();
                          if (_formKey.currentState != null) {
                            _formKey.currentState!.validate();
                          }
                        },
                        validator: (value) {
                          if (signUpController.isNameFieldTouched) {
                            return validateName(value!);
                          } else {
                            return null;
                          }
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.080,
                            vertical: height * 0.015),
                        contentPadding: EdgeInsets.only(left: width * 0.030),
                        hintText: (AppStrings.signUpName).tr(),
                        controller: _nameController);
                  }),
                  Builder(builder: (context) {
                    return _buildTextField(
                      onChanged: (value) {
                        signUpController.setStateField();
                        if (_formKey.currentState != null) {
                          _formKey.currentState!.validate();
                        }
                      },
                      validator: (value) {
                        if (signUpController.isStateFieldTouched) {
                          return validateState(
                              signUpController.stateValue ?? "");
                        } else {
                          return null;
                        }
                      },
                      padding: EdgeInsets.only(
                          left: width * 0.080,
                          right: width * 0.080,
                          top: height * 0.005,
                          bottom: height * 0.010),
                      suffixIcon: CustomDropdownButton(
                        formKey: _formKey,
                      ),
                      hintText: (AppStrings.signUpState).tr(),
                      contentPadding: EdgeInsets.only(left: width * 0.030),
                      controller: signUpController.stateController,
                    );
                  }),
                  Builder(builder: (context) {
                    return _buildTextField(
                        onChanged: (value) {
                          signUpController.setAddressField();
                          if (_formKey.currentState != null) {
                            _formKey.currentState!.validate();
                          }
                        },
                        validator: (value) {
                          if (signUpController.isAddressFieldTouched) {
                            return validateAddress(value!);
                          } else {
                            return null;
                          }
                        },
                        padding: EdgeInsets.only(
                            left: width * 0.080,
                            right: width * 0.080,
                            top: height * 0.010,
                            bottom: height * 0.010),
                        controller: _addressController,
                        contentPadding: EdgeInsets.only(left: width * 0.030),
                        hintText: (AppStrings.signUpAddress).tr());
                  }),
                  Row(
                    children: [
                      Expanded(
                        child: Builder(builder: (context) {
                          return _buildTextField(
                            onChanged: (value) {
                              signUpController.setPincodeField();
                              if (_formKey.currentState != null) {
                                _formKey.currentState!.validate();
                              }
                            },
                            validator: (value) {
                              if (signUpController.isPincodeFieldTouched) {
                                return validatePincode(value!);
                              } else {
                                return null;
                              }
                            },
                            padding: EdgeInsets.only(
                                left: width * 0.080, top: height * 0.010),
                            hintText: (AppStrings.signUpPincode).tr(),
                            keyboardType: TextInputType.number,
                            controller: _pincodeController,
                            contentPadding:
                                EdgeInsets.only(left: width * 0.030),
                          );
                        }),
                      ),
                      _buildCurrentLocationButton()
                    ],
                  ),
                  Builder(builder: (context) {
                    return _buildTextField(
                        onChanged: (value) {
                          signUpController.setNumberField();
                          if (_formKey.currentState != null) {
                            _formKey.currentState!.validate();
                          }
                        },
                        validator: (value) {
                          if (signUpController.isNumberFieldTouched) {
                            return numberValidate(value!);
                          } else {
                            return null;
                          }
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.080,
                            vertical: height * 0.010),
                        contentPadding: EdgeInsets.only(left: width * 0.030),
                        controller: _mobileController,
                        hintText: (AppStrings.signUpMobileNo).tr(),
                        keyboardType: TextInputType.number);
                  }),
                  Builder(builder: (context) {
                    return _buildTextField(
                      onChanged: (value) {
                        signUpController.setEmailField();
                        if (_formKey.currentState != null) {
                          _formKey.currentState!.validate();
                        }
                      },
                      validator: (value) {
                        if (signUpController.isEmailFieldTouched) {
                          return emailValidate(value!);
                        } else {
                          return null;
                        }
                      },
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.080, vertical: height * 0.010),
                      controller: _emailController,
                      contentPadding: EdgeInsets.only(left: width * 0.030),
                      hintText: (AppStrings.signUpEmail).tr(),
                    );
                  }),
                  Builder(builder: (context) {
                    return _buildTextField(
                        onChanged: (value) {
                          signUpController.setPasswordField();
                          if (_formKey.currentState != null) {
                            _formKey.currentState!.validate();
                          }
                        },
                        validator: (value) {
                          if (signUpController.isPasswordFieldTouched) {
                            return validatePassword(value!);
                          } else {
                            return null;
                          }
                        },
                        obscureText: obscureTextController.isVisible,
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.080,
                            vertical: height * 0.015),
                        contentPadding: EdgeInsets.only(
                            top: height * 0.010, left: width * 0.030),
                        controller: _passwordController,
                        hintText: (AppStrings.signUpPassword).tr(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscureTextController.setPasswordIcon();
                            },
                            icon: Icon(
                              obscureTextController.isVisible == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: HexColor(AppColorsLight.darkBlueColor),
                            )));
                  }),
                  Builder(builder: (context) {
                    return _buildTextField(
                        onChanged: (value) {
                          signUpController.setConfirmPasswordField();
                          if (_formKey.currentState != null) {
                            _formKey.currentState!.validate();
                          }
                        },
                        validator: (value) {
                          if (signUpController.isConfirmPasswordFieldTouched) {
                            return validateConfirmPassword(value!);
                          } else {
                            return null;
                          }
                        },
                        controller: _confirmPasswordController,
                        obscureText: obscureTextController.isVisible,
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.080,
                            vertical: height * 0.010),
                        contentPadding: EdgeInsets.only(
                            top: height * 0.010, left: width * 0.030),
                        hintText: (AppStrings.signUpConfirmPassword).tr(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscureTextController.setPasswordIcon();
                            },
                            icon: Icon(
                              obscureTextController.isVisible == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: HexColor(AppColorsLight.darkBlueColor),
                            )));
                  }),
                  SizedBox(
                    height: height * 0.040,
                  ),
                  _buildTermsAndConditionRow(),
                  SizedBox(
                    height: height * 0.030,
                  ),
                  _buildSignUpButton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {TextEditingController? controller,
      String? hintText,
      String? Function(String?)? validator,
      Widget? suffixIcon,
      void Function(String)? onChanged,
      bool obscureText = false,
      TextInputType? keyboardType,
      required EdgeInsetsGeometry padding,
      EdgeInsetsGeometry? contentPadding}) {
    return Padding(
        padding: padding,
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          style: TextStyle(
              color: themeController.isLight
                  ? Colors.black
                  : HexColor(AppColorsDark.whiteColor)),
          cursorColor: themeController.isLight ? Colors.black : Colors.white,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  // borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: themeController.isLight
                          ? Colors.black
                          : Colors.white)),
              suffixIconColor: themeController.isLight
                  ? Colors.black
                  : HexColor(AppColorsDark.whiteColor),
              hintStyle: TextStyle(
                  color: themeController.isLight
                      ? Colors.black
                      : HexColor(AppColorsDark.whiteColor)),
              suffixIcon: suffixIcon,
              hintText: hintText,
              contentPadding: contentPadding),
        ));
  }

  Widget _buildCurrentLocationButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return PageViewScreen();
          },
        ));
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.050, right: width * 0.085, top: height * 0.010),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          // padding: EdgeInsets.all(5),
          height: height * 0.055,
          width: width * 0.450,
          decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  color: HexColor(AppColorsLight.greyColor), width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.my_location,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
              ),
              Builder(builder: (context) {
                return Text(
                  (AppStrings.signUpCurrentLocation).tr(),
                  style: TextStyle(
                      color: themeController.isLight
                          ? Colors.black
                          : HexColor(AppColorsDark.whiteColor)),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.035),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                signUpController.setDefault();
                _nameController.clear();
                obscureTextController.setDefault();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 40,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
              )),
          SizedBox(
            width: width * 0.160,
          ),
          Builder(builder: (context) {
            return Text(
              (AppStrings.signUpHeading).tr(),
              style: TextStyle(
                  color: themeController.isLight
                      ? Colors.black
                      : HexColor(AppColorsDark.whiteColor),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return InkWell(
      onTap: () async {
        setFormValidation();
        if (_formKey.currentState!.validate() &&
            obscureTextController.isChecked == true) {
          print("All Done");
          await setUserDataToFirebase(context);
        } else {
          print("ERROR");
        }
      },
      child: Container(
        height: height * 0.058,
        width: width * 0.350,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: HexColor(AppColorsLight.orangeColor),
                  spreadRadius: 3,
                  offset: Offset(0, 0),
                  blurRadius: 8)
            ],
            color: HexColor(AppColorsLight.orangeColor),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: loadingController.isLoading == false
              ? Builder(builder: (context) {
                  return Text(
                    (AppStrings.signUpButton).tr(),
                    style: TextStyle(
                        color: HexColor(AppColorsLight.backgroundColor),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  );
                })
              : CircularProgressIndicator(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Checkbox(
            activeColor: HexColor(AppColorsLight.orangeColor),
            side: BorderSide(color: HexColor(AppColorsLight.orangeColor)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: obscureTextController.isChecked,
            onChanged: (value) {
              obscureTextController.setIsChecked();
            },
          ),
        ),
        Builder(builder: (context) {
          return Text(
            (AppStrings.agreeToThe).tr(),
            style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor)),
          );
        }),
        SizedBox(
          width: width * 0.010,
        ),
        Builder(builder: (context) {
          return Text(
            (AppStrings.signUpTermsAndConditions).tr(),
            style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
                decoration: TextDecoration.underline,
                decorationColor: themeController.isLight
                    ? Colors.black
                    : HexColor(AppColorsDark.whiteColor),
                fontWeight: FontWeight.bold),
          );
        })
      ],
    );
  }
}
