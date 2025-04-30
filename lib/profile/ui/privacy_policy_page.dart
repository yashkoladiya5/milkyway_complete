import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constant/app_strings.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  late double height;
  late double width;
  late ThemeController themeController;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    return Scaffold(
      backgroundColor: HexColor(themeController.isLight
          ? AppColorsLight.backgroundColor
          : AppColorsDark.backgroundColor),
      body: Column(
        children: [
          _buildHeaderContainer(),
          Container(
              padding: EdgeInsets.all(20),
              height: height * 0.800,
              width: double.infinity,
              // color: Colors.red,
              child: Builder(builder: (context) {
                return Column(
                  children: [
                    Text(
                      (AppStrings.privacyPolicyIntro).tr(),
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      (AppStrings.privacyPolicyAgreement).tr(),
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      (AppStrings.privacyPolicyDataCollection).tr(),
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      (AppStrings.privacyPolicyDataSharing).tr(),
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      (AppStrings.privacyPolicySecurity).tr(),
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      (AppStrings.privacyPolicyUserRights).tr(),
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      (AppStrings.privacyPolicyAcceptance).tr(),
                      style: TextStyle(
                          fontSize: 18,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    )
                  ],
                );
              }))
        ],
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
            child: Center(child: Builder(builder: (context) {
              return Text(
                (AppStrings.privacyPolicy).tr(),
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
}
