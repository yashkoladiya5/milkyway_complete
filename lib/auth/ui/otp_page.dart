import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/ui/create_new_password_page.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';

import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  String? email;
  String? mobileNumber;
  String isEmailOrMobile;
  String otp;
  OtpPage(
      {super.key,
      required this.isEmailOrMobile,
      required this.otp,
      this.email,
      this.mobileNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late double height;
  late double width;
  late String otp;
  var themeController = ThemeController();

  submitOTP() {
    if (widget.isEmailOrMobile == "Email") {
      print("Email OTP CODE === ${widget.otp}, AND EMAIL === ${widget.email}");
    } else {
      print(
          "Mobile OTP CODE ====${widget.otp} , AND MOBILE NUMBER === ${widget.mobileNumber}");
    }
  }

  _buildDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: AlertDialog(
            insetPadding: EdgeInsets.all(5),
            contentPadding:
                EdgeInsets.only(left: 15, top: 20, bottom: 40, right: 10),
            backgroundColor: HexColor(AppColorsLight.darkBlueColor),
            title: Center(
              child: Builder(builder: (context) {
                return Text(
                  (AppStrings.oopsMessage).tr(),
                  style: TextStyle(
                      color: HexColor(AppColorsLight.redColor), fontSize: 22),
                );
              }),
            ),
            content: Builder(builder: (context) {
              return Text(
                (AppStrings.otpDialogErrorContent).tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: HexColor(AppColorsLight.backgroundColor),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    submitOTP();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
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
                fit: BoxFit.cover)),
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
                        Navigator.pop(context, "refresh");
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        size: 40,
                      )),
                  SizedBox(
                    height: height * 0.060,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Builder(builder: (context) {
                          return Text(
                            (AppStrings.enterOTP).tr(),
                            style: TextStyle(
                                fontSize: 25,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.whiteColor),
                                fontWeight: FontWeight.w500),
                          );
                        }),
                        SizedBox(
                          height: height * 0.080,
                        ),
                        Builder(builder: (context) {
                          return Text(
                            (AppStrings.otpDescription).tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.silverColor
                                    : AppColorsDark.greyColor)),
                          );
                        }),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        _buildPinPut(),
                        SizedBox(
                          height: height * 0.070,
                        ),
                        _buildVerifyButton(),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Builder(builder: (context) {
                              return Text(
                                (AppStrings.doNotGetCode).tr(),
                                style: TextStyle(
                                    color: HexColor(
                                      themeController.isLight
                                          ? AppColorsLight.silverColor
                                          : AppColorsDark.greyColor,
                                    ),
                                    fontSize: 12),
                              );
                            }),
                            SizedBox(
                              width: width * 0.010,
                            ),
                            InkWell(
                              onTap: () {
                                _buildDialog();
                              },
                              child: Builder(builder: (context) {
                                return Text(
                                  (AppStrings.resendButton).tr(),
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: HexColor(
                                          themeController.isLight
                                              ? AppColorsLight.darkBlueColor
                                              : AppColorsDark.whiteColor),
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor),
                                      fontSize: 14),
                                );
                              }),
                            )
                          ],
                        )
                      ],
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

  Widget _buildVerifyButton() {
    return InkWell(
      onTap: () {
        if (widget.otp == otp) {
          if (widget.email != null) {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CreateNewPasswordPage(
                    email: widget.email,
                  ),
                ));
          } else {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CreateNewPasswordPage(
                    mobileNumber: widget.mobileNumber,
                  ),
                ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds: 200),
              content: Text("Wrong PIN. Try Again!")));
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
          child: Builder(builder: (context) {
            return Text(
              (AppStrings.verifyButton).tr(),
              style: TextStyle(
                  color: HexColor(AppColorsLight.backgroundColor),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildPinPut() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Pinput(
        onChanged: (value) {
          otp = value;
          print(otp);
        },
        length: 4,
        defaultPinTheme: PinTheme(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: themeController.isLight
                    ? Colors.black
                    : HexColor(AppColorsDark.whiteColor)),
            margin: EdgeInsets.all(5),
            height: height * 0.080,
            width: width * 0.15,
            decoration: BoxDecoration(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.backgroundColor
                    : AppColorsDark.backgroundColor),
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: HexColor(AppColorsLight.orangeColor)))),
      ),
    );
  }
}
