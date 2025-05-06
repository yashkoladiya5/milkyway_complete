import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/bill_pay/electricity/ui/electricity_bill_screen.dart';
import 'package:milkyway/bill_pay/gas/ui/gas_bill_screen.dart';

import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/home/ui/page_view.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';

import '../constant/app_strings.dart';
import '../home/ui/home_screen.dart';
import 'recharge/ui/mobile_recharge_screen.dart';

class BillPayScreen extends StatefulWidget {
  const BillPayScreen({super.key});

  @override
  State<BillPayScreen> createState() => _BillPayScreenState();
}

class _BillPayScreenState extends State<BillPayScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderContainer(),
            _buildHeadingText(),
            _buildCustomGridView(),
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
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor),
            ),
          ),
          SizedBox(
            width: width * 0.30,
          ),
          Builder(builder: (context) {
            return Text(
              (AppStrings.billPay).tr(),
              style: TextStyle(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            );
          })
        ],
      ),
    );
  }

  Widget _buildHeadingText() {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.030, top: height * 0.020),
      child: Builder(builder: (context) {
        return Text(
          (AppStrings.rechargeAndBill).tr(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor)),
        );
      }),
    );
  }

  Widget _buildCustomGridView() {
    return Container(
      height: height * 0.230,
      // color: Colors.blue,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4.5 / 2, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return _buildGridViewItem(index: index);
        },
      ),
    );
  }

  Widget _buildGridViewItem({required int index}) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (index == 0) {
          Navigator.push(context, CupertinoPageRoute(
            builder: (context) {
              return MobileRechargeScreen();
            },
          ));
        } else if (index == 1) {
          Navigator.push(context, CupertinoPageRoute(
            builder: (context) {
              return GasBillScreen();
            },
          ));
        } else {
          Navigator.push(context, CupertinoPageRoute(
            builder: (context) {
              return ElectricityBillScreen();
            },
          ));
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            top: height * 0.015, right: width * 0.020, left: width * 0.020),
        height: height * 0.030,
        width: width * 0.400,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 1,
                  color:
                      Color(themeController.isLight ? 0x665E5E5E : 0x80000000))
            ],
            color: HexColor(themeController.isLight
                ? AppColorsLight.lightGreyColor
                : AppColorsDark.darkGreyColor),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              height: height * 0.060,
              width: width * 0.160,
              // color: Colors.red,
              child: Image.asset(
                AppLists().billPayOptionsImageList[index],
                fit: BoxFit.contain,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: width * 0.005),
              height: height * 0.055,
              width: width * 0.290,
              // color: Colors.red,
              child: Builder(builder: (context) {
                return Text(
                  (AppLists().billPayOptionsNameList[index]).tr(),
                  style: TextStyle(
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor),
                      fontSize: 15),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
