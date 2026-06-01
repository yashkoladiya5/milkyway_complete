import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/auth/ui/forgot_password_page.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/profile/provider/change_password_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constant/app_strings.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late double height;
  late double width;
  late ThemeController themeController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ChangePasswordController>(context, listen: false)
        .fetchPasswordData();
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
      body: Form(
        key: _formKey,
        child: Column(children: widgetList()),
      ),
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
                offset: Offset(0, 10),
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
            child: Center(child: Builder(builder: (context) {
              return Text(
                (AppStrings.changePassword).tr(),
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              );
            })),
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

  Widget _buildTextField(
      {required String hintText,
      Widget? suffixIcon,
      String? Function(String?)? validator,
      required TextEditingController controller,
      void Function(String)? onChanged,
      void Function()? onTap,
      bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.070, vertical: height * 0.010),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            contentPadding:
                EdgeInsets.only(left: width * 0.030, top: height * 0.010)),
      ),
    );
  }

  List<Widget> widgetList() {
    return [
      _buildHeaderContainer(),
      SizedBox(
        height: height * 0.020,
      ),
      Consumer<ChangePasswordController>(
        builder: (context, value, child) {
          return Builder(builder: (context) {
            return _buildTextField(
                controller: value.passwordController,
                onChanged: (p0) {
                  value.setPasswordFieldTouched();
                  if (_formKey.currentState != null) {
                    _formKey.currentState!.validate();
                  }
                },
                validator: (p0) {
                  if (value.isPasswordFieldTouched) {
                    return value.validateOldPassword(p0!);
                  } else {
                    return null;
                  }
                },
                hintText: (AppStrings.password).tr(),
                suffixIcon: SizedBox());
          });
        },
      ),
      Consumer<ChangePasswordController>(
        builder: (context, value, child) {
          return Builder(builder: (context) {
            return _buildTextField(
              controller: value.newPasswordController,
              onChanged: (p0) {
                value.setNewPasswordFieldTouched();

                if (_formKey.currentState != null) {
                  _formKey.currentState!.validate();
                }
              },
              validator: (p0) {
                if (value.isNewPasswordFieldTouched) {
                  return value.validateNewPassword(p0!);
                } else {
                  return null;
                }
              },
              obscureText: value.isVisible,
              hintText: "New Password".tr(),
              suffixIcon: InkWell(
                onTap: () {
                  value.changeVisibility();
                },
                child: Icon(
                  value.isVisible ? Icons.visibility : Icons.visibility_off,
                  color: themeController.isLight ? Colors.black : Colors.white,
                ),
              ),
            );
          });
        },
      ),
      Consumer<ChangePasswordController>(
        builder: (context, value, child) {
          return Builder(builder: (context) {
            return _buildTextField(
              onTap: () {},
              validator: (p0) {
                if (value.isConfirmPasswordFieldTouched) {
                  return value.validateConfirmPassword(p0!);
                } else {
                  return null;
                }
              },
              onChanged: (p0) {
                value.setConfirmPasswordFieldTouched();

                if (_formKey.currentState != null) {
                  _formKey.currentState!.validate();
                }
              },
              controller: value.confirmPasswordController,
              obscureText: value.isVisible,
              hintText: "Confirm Password".tr(),
              suffixIcon: InkWell(
                onTap: () {
                  value.changeVisibility();
                },
                child: Icon(
                  value.isVisible ? Icons.visibility : Icons.visibility_off,
                  color: themeController.isLight ? Colors.black : Colors.white,
                ),
              ),
            );
          });
        },
      ),
      Padding(
        padding: EdgeInsets.only(left: width * 0.50, top: height * 0.005),
        child: InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return ForgotPasswordPage();
              },
            ));
          },
          child: Builder(builder: (context) {
            return Text(
              (AppStrings.forgotPassword).tr(),
              style: TextStyle(
                  fontSize: 15,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor)),
            );
          }),
        ),
      ),
      SizedBox(
        height: height * 0.430,
      ),
      Consumer<ChangePasswordController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () {
              value.savePasswordToDatabase();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Pasword Updated Successfully")));
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              height: height * 0.050,
              width: width * 0.30,
              decoration: BoxDecoration(
                  color: HexColor(AppColorsLight.orangeColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Builder(builder: (context) {
                return Text(
                  (AppStrings.change).tr(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: HexColor(AppColorsDark.whiteColor)),
                );
              }),
            ),
          );
        },
      )
    ];
  }
}
