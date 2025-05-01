import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/profile/provider/faq_page_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constant/app_strings.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({super.key});

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
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
          Builder(builder: (context) {
            return Container(
              height: height * 0.600,
              width: double.infinity,
              // color: Colors.red,
              child: Consumer<FaqPageController>(
                builder: (context, value, child) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: value.expandedList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.005,
                          ),
                          child: InkWell(
                            onTap: () {
                              value.changeIndex(index: index);
                            },
                            child: AnimatedContainer(
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 200),
                              height: value.expandedList[index]
                                  ? height * 0.170
                                  : height * 0.050,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 10,
                                        color: HexColor(themeController.isLight
                                            ? AppColorsLight.lightGreyColor
                                            : "#000000"))
                                  ],
                                  color: HexColor(themeController.isLight
                                      ? AppColorsLight.backgroundColor
                                      : AppColorsDark.backgroundColor)),
                              child: !value.expandedList[index]
                                  ? Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.050),
                                      child: Row(
                                        children: [
                                          Text(
                                            (index + 1).toString() + ".",
                                            style: TextStyle(
                                                color: HexColor(themeController
                                                        .isLight
                                                    ? AppColorsLight
                                                        .darkBlueColor
                                                    : AppColorsDark.whiteColor),
                                                fontSize: 17),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: width * 0.020),
                                            width: width * 0.720,
                                            height: height * 0.025,
                                            // color: Colors.red,
                                            child: Text(
                                              (AppLists().faqTitleList[index])
                                                  .tr(),
                                              style: TextStyle(
                                                  color: HexColor(
                                                      themeController.isLight
                                                          ? AppColorsLight
                                                              .darkBlueColor
                                                          : AppColorsDark
                                                              .whiteColor),
                                                  fontSize: 17),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: width * 0.080),
                                            height: height * 0.030,
                                            width: width * 0.070,
                                            // color: Colors.red,
                                            child: Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 30,
                                              color: HexColor(themeController
                                                      .isLight
                                                  ? AppColorsLight.darkBlueColor
                                                  : AppColorsDark.whiteColor),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 0.050,
                                          top: height * 0.020),
                                      child: SingleChildScrollView(
                                        child: Opacity(
                                          opacity: value.expandedList[index]
                                              ? 1.0
                                              : 0.0,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    (index + 1).toString() +
                                                        ".",
                                                    style: TextStyle(
                                                        color: HexColor(
                                                            themeController
                                                                    .isLight
                                                                ? AppColorsLight
                                                                    .darkBlueColor
                                                                : AppColorsDark
                                                                    .whiteColor),
                                                        fontSize: 17),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.020),
                                                    width: width * 0.720,
                                                    height: height * 0.025,
                                                    // color: Colors.red,
                                                    child: Text(
                                                      (AppLists().faqTitleList[
                                                              index])
                                                          .tr(),
                                                      style: TextStyle(
                                                          color: HexColor(themeController
                                                                  .isLight
                                                              ? AppColorsLight
                                                                  .darkBlueColor
                                                              : AppColorsDark
                                                                  .whiteColor),
                                                          fontSize: 17),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: width * 0.080),
                                                    height: height * 0.030,
                                                    width: width * 0.070,
                                                    // color: Colors.red,
                                                    child: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      size: 30,
                                                      color: HexColor(
                                                          themeController
                                                                  .isLight
                                                              ? AppColorsLight
                                                                  .darkBlueColor
                                                              : AppColorsDark
                                                                  .whiteColor),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.020),
                                                child: Text(
                                                  (AppLists().faqDescriptionList[
                                                          index])
                                                      .tr(),
                                                  style: TextStyle(
                                                      color: HexColor(
                                                          themeController
                                                                  .isLight
                                                              ? AppColorsLight
                                                                  .darkBlueColor
                                                              : AppColorsDark
                                                                  .whiteColor)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ));
                    },
                  );
                },
              ),
            );
          })
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
                (AppStrings.faqs).tr(),
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
