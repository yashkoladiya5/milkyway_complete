import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/profile/provider/profile_screen_controller.dart';
import 'package:milkyway/profile/ui/change_password_page.dart';
import 'package:milkyway/profile/ui/faqs_page.dart';
import 'package:milkyway/profile/ui/favourite_page.dart';
import 'package:milkyway/profile/ui/location_page.dart';
import 'package:milkyway/profile/ui/privacy_policy_page.dart';
import 'package:milkyway/profile/ui/profile_edit_screen.dart';
import 'package:milkyway/profile/ui/terms_and_condition_page.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constant/app_strings.dart';
import 'cancellation_policy_page.dart';
import 'language_page.dart';
import 'order_history_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late double height;
  late double width;
  late ThemeController themeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ProfileScreenController>(context, listen: false)
            .fetchData();
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
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            _buildHeaderContainer(),
            _buildDetailsContainer(),
            _buildListView(),
          ],
        ),
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
            : AppColorsDark.backgroundColor),
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
                (AppStrings.profile).tr(),
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

  Widget _buildDetailsContainer() {
    return Consumer<ProfileScreenController>(
      builder: (context, value, child) {
        return Container(
          height: height * 0.150,
          width: double.infinity,
          // color: Colors.red,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 10,
                  color:
                      HexColor(themeController.isLight ? "#E5E5E5" : "#000000"))
            ],
            color: HexColor(themeController.isLight
                ? "#EEEEEE"
                : AppColorsDark.backgroundColor),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: width * 0.070),
                height: height * 0.110,
                width: width * 0.235,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50)),
                child: value.userData.containsKey("image") == false
                    ? Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 70,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(value.userData["image"])),
              ),
              Container(
                padding: EdgeInsets.only(left: width * 0.050),
                height: height * 0.150,
                width: width * 0.600,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.030,
                      width: width * 0.600,
                      // color: Colors.blue,
                      child: Row(
                        children: [
                          Text(
                            value.userData["name"] ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.whiteColor)),
                          ),
                          Text(
                            value.userData.containsKey("lastName") == true
                                ? " " + value.userData["lastName"]
                                : "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.whiteColor)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height * 0.005),
                      height: height * 0.025,
                      width: width * 0.600,
                      // color: Colors.blue,
                      child: Text(
                        value.userData["email"] ?? "",
                        style: TextStyle(
                            fontSize: 14,
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height * 0.002),
                      height: height * 0.030,
                      width: width * 0.600,
                      child: Text(
                        value.userData["mobileNumber"] ?? "",
                        style: TextStyle(
                            fontSize: 14,
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor)),
                      ),
                      // color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return Container(
      height: height * 0.990,
      width: double.infinity,
      // color: Colors.red,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: AppLists().profileOptionLightList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Consumer<ProfileScreenController>(
              builder: (context, value, child) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () async {
                    if (index == 1) {
                      String refresh =
                          await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ProfileEditScreen(
                            userData: value.userData,
                          );
                        },
                      ));

                      if (refresh.isNotEmpty) {
                        value.fetchData();
                      }
                    } else if (index == 2) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ChangePasswordPage();
                        },
                      ));
                    } else if (index == 3) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LocationPage();
                        },
                      ));
                    } else if (index == 4) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return OrderHistoryPage();
                        },
                      ));
                    } else if (index == 5) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return FavouritePage();
                        },
                      ));
                    } else if (index == 6) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LanguagePage();
                        },
                      ));
                    } else if (index == 8) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TermsAndConditionPage();
                        },
                      ));
                    } else if (index == 9) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return PrivacyPolicyPage();
                        },
                      ));
                    } else if (index == 10) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CancellationPolicyPage();
                        },
                      ));
                    } else if (index == 12) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return FaqsPage();
                        },
                      ));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.020),
                    height: height * 0.065,
                    width: double.infinity,
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.greyColor
                                    : "#484848")))),
                    child: Row(
                      children: [
                        Container(
                          height: height * 0.030,
                          width: width * 0.160,
                          // color: Colors.red,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            themeController.isLight
                                ? AppLists().profileOptionLightList[index]
                                    ["image"]
                                : AppLists().profileOptionDarkList[index]
                                    ["image"],
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width * 0.020),
                          alignment: Alignment.bottomLeft,
                          height: height * 0.040,
                          width: width * 0.500,
                          // color: Colors.red,
                          child: Builder(builder: (context) {
                            return Text(
                              (AppLists()
                                      .profileOptionLightList[index]["name"]
                                      .toString())
                                  .tr(),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: HexColor(themeController.isLight
                                      ? AppColorsLight.darkBlueColor
                                      : AppColorsDark.whiteColor)),
                            );
                          }),
                        ),
                        index == 0
                            ? Padding(
                                padding: EdgeInsets.only(left: width * 0.080),
                                child: Consumer<ProfileScreenController>(
                                  builder: (context, value, child) {
                                    return CupertinoSwitch(
                                      thumbColor: Colors.black,
                                      focusColor: Colors.red,
                                      activeTrackColor: Colors.grey,
                                      value: value.isSelected,
                                      onChanged: (v) {
                                        value.updateSelected();
                                        Provider.of<ThemeController>(context,
                                                listen: false)
                                            .changeTheme();
                                      },
                                    );
                                  },
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
