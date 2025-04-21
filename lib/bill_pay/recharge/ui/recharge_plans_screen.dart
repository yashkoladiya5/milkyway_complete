import 'package:flutter/material.dart';

import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/app_strings.dart';
import '../provider/recharge_plan_controller.dart';

class RechargePlansScreen extends StatefulWidget {
  String operator;
  String state;
  RechargePlansScreen({super.key, required this.operator, required this.state});

  @override
  State<RechargePlansScreen> createState() => _RechargePlansScreenState();
}

class _RechargePlansScreenState extends State<RechargePlansScreen> {
  late double height;
  late double width;
  late ThemeController themeController;
  final List<String> categoryList = AppLists().rechargePlansCategoryList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        Provider.of<RechargePlanController>(context, listen: false)
            .fetchPopularPlanData(operator: widget.operator);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context, listen: false);

    print("PLANS SCREEN BUILD");

    return NetworkChecker(
      child: Scaffold(
              backgroundColor: HexColor(themeController.isLight
        ? AppColorsLight.backgroundColor
        : AppColorsDark.backgroundColor),
              body: Column(
      children: [
        _buildHeaderContainer(),
        _buildCategoryList(),
        _buildPlansListView(),
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
            BoxShadow(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.greyColor
                    : AppColorsDark.darkGreyColor),
                blurRadius: 10,
                spreadRadius: 5)
          ]),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.030,
          ),
          Consumer<RechargePlanController>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  if (value.selectedPlan != -1) {
                    for (int i = 0; i < value.plansList.length; i++) {
                      if (value.selectedPlan == value.plansList[i]["id"]) {
                        Navigator.pop(context, value.plansList[i]["price"]);
                        break;
                      }
                    }
                  } else {
                    Navigator.pop(context, "");
                  }
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                ),
              );
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                "${widget.operator},${widget.state}",
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: height * 0.070,
      child: Consumer<RechargePlanController>(
        builder: (context, value, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: width * 0.030),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    value.updateCategory(index: index);
                    await value.fetchOtherPlansData(
                        category: AppLists()
                            .rechargePlansCategoryList[value.selectedCategory],
                        operator: widget.operator);
                  },
                  child: Container(
                    height: height * 0.030,
                    width: categoryList[index].length * 10.300,
                    // color: Colors.red,
                    child: Center(
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                            color: HexColor(themeController.isLight
                                ? value.selectedCategory == index
                                    ? AppColorsLight.orangeColor
                                    : AppColorsLight.darkBlueColor
                                : value.selectedCategory == index
                                    ? AppColorsDark.whiteColor
                                    : AppColorsDark.whiteColor),
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPlansListView() {
    return Expanded(
      child: Container(
        color: HexColor(AppColorsLight.greyColor),
        child: Consumer<RechargePlanController>(
          builder: (context, value, child) {
            return ListView.builder(

              padding: EdgeInsets.zero,
              itemCount: value.plansList.length,
              itemBuilder: (context, index) {
                int id = value.plansList[index]["id"];
                String price = value.plansList[index]["price"];
                String validity = value.plansList[index]["validity"];
                String data = value.plansList[index]["data"];
                String voice = value.plansList[index]["voice"];
                String sms = value.plansList[index]["sms"];
                String subscription = value.plansList[index]["subscription"];
                String offer = value.plansList[index]["offer"];
                return Padding(
                  padding: EdgeInsets.only(top: height * 0.001),
                  child: InkWell(
                    onTap: () async {
                      value.updatePlanIndex(id: id);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      prefs.setInt(SharedPreferenceKeys.planKey, id);
                      print("PLAN KEY SETTED : $id");
                      Navigator.pop(context, price);
                    },
                    child: Container(
                      height: height * 0.220,
                      width: double.infinity,
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.backgroundColor
                          : AppColorsDark.backgroundColor),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            height: height * 0.150,
                            width: width * 0.300,
                            // color: Colors.red,
                            child: Container(
                              margin: EdgeInsets.only(top: height * 0.010),
                              height: height * 0.05,
                              width: width * 0.250,
                              decoration: BoxDecoration(
                                  color: HexColor(themeController.isLight
                                      ? value.selectedPlan == id
                                          ? AppColorsLight.orangeColor
                                          : AppColorsLight.lightGreyColor
                                      : value.selectedPlan == id
                                          ? AppColorsLight.orangeColor
                                          : AppColorsDark.greyColor),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                        color: HexColor(themeController.isLight
                                            ? "#5E5E5E5"
                                            : AppColorsDark.darkGreyColor))
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: HexColor(themeController.isLight
                                          ? value.selectedPlan == id
                                              ? AppColorsDark.whiteColor
                                              : AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(

                                    textAlign: TextAlign.start,
                                    text: TextSpan(

                                        style: TextStyle(
                                            fontSize: 16,
                                            color: HexColor(themeController
                                                    .isLight
                                                ? AppColorsLight.darkBlueColor
                                                : AppColorsDark.whiteColor)),
                                        children: [
                                          TextSpan(text: "Validity : "),
                                          TextSpan(
                                              text: validity,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: HexColor(themeController
                                                    .isLight
                                                ? AppColorsLight.darkBlueColor
                                                : AppColorsDark.whiteColor)),
                                        children: [
                                      TextSpan(
                                          text: "Data : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: data,
                                      ),
                                      TextSpan(
                                          text: " Voice : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: voice,
                                      )
                                    ])),
                                RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: HexColor(themeController
                                                    .isLight
                                                ? AppColorsLight.darkBlueColor
                                                : AppColorsDark.whiteColor)),
                                        children: [
                                      TextSpan(
                                          text: "SMS : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: sms,
                                      ),
                                      TextSpan(
                                          text: " Validity : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: validity,
                                      )
                                    ])),
                                RichText(
                                    text: TextSpan(
                                        text: subscription,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: HexColor(themeController
                                                    .isLight
                                                ? AppColorsLight.darkBlueColor
                                                : AppColorsDark.whiteColor)))),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: HexColor(
                                        themeController.isLight
                                            ? AppColorsLight.darkBlueColor
                                            : AppColorsDark.whiteColor,
                                      ),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "offer : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: offer,
                                      ),
                                    ],
                                  ),
                                  // This ensures that the text wraps when it exceeds the available space
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
