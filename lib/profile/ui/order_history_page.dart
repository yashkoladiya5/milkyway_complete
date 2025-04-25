import 'package:flutter/material.dart';
import 'package:milkyway/constant/app_colors.dart';
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
      body: Column(
        children: [
          _buildHeaderContainer(),
          _buildDateRow(),
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
            child: Center(
                child: Text(
              AppStrings.order,
              style: TextStyle(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
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
                  : AppColorsDark.greyColor),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                height: height * 0.030,
                width: width * 0.320,
                // color: Colors.yellow,
                child: Center(
                  child: Text(
                    "31/12/2025",
                    style: TextStyle(
                        fontSize: 17,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 25,
              )
            ],
          ),
        ),
        SizedBox(
          width: width * 0.080,
        ),
        Container(
          margin: EdgeInsets.only(
              left: width * 0.020, top: height * 0.020, right: width * 0.020),
          height: height * 0.025,
          width: width * 0.055,
          decoration: BoxDecoration(
              color: HexColor(AppColorsLight.greyColor),
              borderRadius: BorderRadius.circular(50)),
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
        Container(
          margin: EdgeInsets.only(
              left: width * 0.060, top: height * 0.020, right: width * 0.020),
          height: height * 0.025,
          width: width * 0.055,
          decoration: BoxDecoration(
              color: HexColor(AppColorsLight.greyColor),
              borderRadius: BorderRadius.circular(50)),
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
  }
}
