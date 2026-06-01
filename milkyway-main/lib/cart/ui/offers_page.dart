import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';

class OffersPage extends StatefulWidget {
  final String amount;
  const OffersPage({super.key, required this.amount});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  late double height;
  late double width;
  late ThemeController themeController;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    themeController = Provider.of<ThemeController>(context);
    return NetworkChecker(
      child: Scaffold(
        backgroundColor: HexColor(themeController.isLight
            ? AppColorsLight.backgroundColor
            : AppColorsDark.backgroundColor),
        body: Column(
          children: [
            _buildHeaderContainer(),
            _buildListViewContainer(),
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
            BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 10)
          else
            BoxShadow(color: Colors.black, spreadRadius: 1, blurRadius: 10)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
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
                (AppStrings.offers).tr(),
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

  Widget _buildOffersListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 3,
      itemBuilder: (context, index) {
        String price = AppLists.offerCategoryList[index].substring(5, 12);
        int first =
            int.parse(AppLists.offerPercentageList[index].substring(0, 2));
        int last =
            int.parse(AppLists.offerPercentageList[index].substring(6, 8));

        Random random = Random();
        int percentage = first + random.nextInt(last - first + 1);

        print(price);
        print(first);
        print(last);
        print(percentage);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () async {
              if (widget.amount.isNotEmpty) {
                double bagPrice = double.parse(widget.amount);
                double offerPrice = double.parse(price);

                if (bagPrice < offerPrice) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text(
                          "This offer will not be applied to your order")));
                } else {
                  print("OFFER APPLIED");

                  AppLists.offerCategoryList[index].substring(5, 12);
                  int first = int.parse(
                      AppLists.offerPercentageList[index].substring(0, 2));
                  int last = int.parse(
                      AppLists.offerPercentageList[index].substring(6, 8));

                  Random random = Random();
                  int percentage = first + random.nextInt(last - first + 1);
                  await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text(
                          "Congratulations!!You get $percentage% Discount On Order")));
                  double percentagePrice = bagPrice * percentage / 100;
                  print("PERCENTAGE PRICE ::::: $percentagePrice");
                  Navigator.pop(context, "PERCENTAGE : ${percentagePrice}0");
                }
              }
            },
            child: Container(
              height: height * 0.150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.lightGreyColor
                      : AppColorsDark.darkGreyColor),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  Container(
                    height: height * 0.050,
                    decoration: BoxDecoration(
                        color: HexColor(AppColorsLight.orangeColor),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Center(
                      child: Builder(builder: (context) {
                        return Text(
                          (AppStrings.milkywayWebsite).tr(),
                          style: TextStyle(
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.darkBlueColor
                                  : AppColorsDark.whiteColor),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.015),
                    height: height * 0.045,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Center(
                      child: Text(
                        AppLists.offerPercentageList[index],
                        style: TextStyle(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.025,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Center(
                      child: Text(
                        AppLists.offerCategoryList[index],
                        style: TextStyle(
                            fontSize: 14,
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.silverColor
                                : AppColorsLight.greyColor)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildListViewContainer() {
    return Container(
      margin: EdgeInsets.only(top: height * 0.020),
      height: height * 0.550,
      width: double.infinity,
      // color: Colors.red,
      child: _buildOffersListView(),
    );
  }
}
