import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/profile/provider/order_history_page_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constant/app_strings.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
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
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            _buildHeaderContainer(),
            _buildDateRow(),
            SizedBox(
              height: height * 0.010,
            ),
            Consumer<OrderHistoryPageController>(
              builder: (context, value, child) {
                return SizedBox(
                  height: height * 0.730,
                  // color: Colors.blue,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount:
                        value.orderList.isEmpty ? 1 : value.orderList.length,
                    itemBuilder: (context, index) {
                      if (value.orderList.isEmpty) {
                        return Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Builder(builder: (context) {
                            return Text(
                              "No Order".tr(),
                              style: TextStyle(color: Colors.red, fontSize: 25),
                            );
                          }),
                        ));
                      }

                      String? image = value.orderList[index].image;
                      String? name = value.orderList[index].name;
                      String? weight = value.orderList[index].weightValue +
                          " " +
                          value.orderList[index].weightUnit;
                      String? price = value.orderList[index].price;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          height: height * 0.170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.backgroundColor
                                  : AppColorsLight.darkBlueColor),
                              boxShadow: [
                                if (themeController.isLight)
                                  BoxShadow(
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.lightGreyColor
                                          : AppColorsDark.darkGreyColor),
                                      blurRadius: 10,
                                      spreadRadius: 0.5)
                                else
                                  const BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 10,
                                      spreadRadius: 0.5)
                              ]),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: width * 0.030),
                                height: height * 0.140,
                                width: width * 0.280,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: width * 0.030),
                                        height: height * 0.025,
                                        width: width * 0.540,
                                        // color: Colors.grey,
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                              color: HexColor(themeController
                                                      .isLight
                                                  ? AppColorsLight.darkBlueColor
                                                  : AppColorsDark.whiteColor),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: width * 0.030),
                                    height: height * 0.025,
                                    width: width * 0.300,
                                    // color: Colors.grey,
                                    child: Text(
                                      weight,
                                      style: TextStyle(
                                          color: HexColor(
                                              themeController.isLight
                                                  ? AppColorsLight.darkBlueColor
                                                  : AppColorsDark.whiteColor),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: height * 0.005,
                                            left: width * 0.030),
                                        height: height * 0.025,
                                        width: width * 0.120,
                                        // color: Colors.grey,
                                        child: Text(
                                          "MRP.",
                                          style: TextStyle(
                                              color: HexColor(
                                                  AppColorsLight.silverColor),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: height * 0.005,
                                        ),
                                        height: height * 0.025,
                                        width: width * 0.250,
                                        // color: Colors.grey,
                                        child: Text(
                                          price,
                                          style: TextStyle(
                                              color: HexColor(
                                                  AppColorsLight.darkBlueColor),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
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
                (AppStrings.order).tr(),
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

  Widget _buildDateRow() {
    return Consumer<OrderHistoryPageController>(
      builder: (context, value, child) {
        if (value.picked != null) {
          String? date = value.picked?.toString().substring(0, 10);
          DateTime convertedDate = DateTime.parse(date!);
          String formattedDate = DateFormat('dd/MM/yyyy').format(convertedDate);
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.020, left: width * 0.050),
              height: height * 0.050,
              width: width * 0.400,
              decoration: BoxDecoration(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.lightGreyColor
                      : AppColorsDark.darkGreyColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      value.updateDateSelection(context: context);
                    },
                    child: Container(
                      height: height * 0.030,
                      width: width * 0.320,
                      // color: Colors.yellow,
                      child: Center(
                        child: Text(
                          value.picked != null
                              ? DateFormat('dd/MM/yyyy').format(DateTime.parse(
                                  value.picked.toString().substring(0, 10)))
                              : "select Date",
                          style: TextStyle(
                              fontSize: 17,
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.darkBlueColor
                                  : AppColorsDark.whiteColor)),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    size: 25,
                  )
                ],
              ),
            ),
            SizedBox(
              width: width * 0.080,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                value.updateIndex(index: 0);
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: width * 0.020,
                    top: height * 0.020,
                    right: width * 0.020),
                height: height * 0.025,
                width: width * 0.055,
                decoration: BoxDecoration(
                    color: HexColor(AppColorsLight.darkGreyColor),
                    borderRadius: BorderRadius.circular(50)),
                child: value.selectedIndex == 0
                    ? Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black),
                            color: HexColor(AppColorsLight.orangeColor)),
                      )
                    : SizedBox(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.020),
              child: Text(
                "Past",
                style: TextStyle(
                    fontSize: 15,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor)),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                value.updateIndex(index: 1);
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: width * 0.020,
                    top: height * 0.020,
                    right: width * 0.020),
                height: height * 0.025,
                width: width * 0.055,
                decoration: BoxDecoration(
                    color: HexColor(AppColorsLight.darkGreyColor),
                    borderRadius: BorderRadius.circular(50)),
                child: value.selectedIndex == 1
                    ? Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black),
                            color: HexColor(AppColorsLight.orangeColor)),
                      )
                    : SizedBox(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.020),
              child: Text(
                "Future",
                style: TextStyle(
                    fontSize: 15,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor)),
              ),
            )
          ],
        );
      },
    );
  }
}
