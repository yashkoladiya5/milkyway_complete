import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/bill_pay/recharge/ui/recharge_payment_screen.dart';
import 'package:milkyway/bill_pay/recharge/ui/recharge_plans_screen.dart';

import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../provider/recharge_list_controller.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({super.key});

  @override
  State<MobileRechargeScreen> createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  late ThemeController themeController;
  late RechargeListController rechargeListController;
  late double height;
  late double width;
  TextEditingController stateController = TextEditingController();

  void showStateBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.440,
          decoration: BoxDecoration(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.backgroundColor
                  : AppColorsDark.backgroundColor),
              borderRadius: BorderRadius.circular(20)),
          child: Consumer<RechargeListController>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: AppLists().mobileRechargeStateList.length,
                itemBuilder: (context, index) {
                  print("LISTVIEW BUILDED $index");
                  return Padding(
                    padding: index != 0
                        ? EdgeInsets.only(top: 8.0)
                        : EdgeInsets.only(top: height * 0.020),
                    child: InkWell(
                      onTap: () {
                        rechargeListController.updateSelectedStateIndex(
                            index: index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: height * 0.050,
                        width: width * 0.700,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            value.stateSelectedIndex != index
                                ? Container(
                                    margin:
                                        EdgeInsets.only(left: width * 0.070),
                                    height: height * 0.030,
                                    width: width * 0.065,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  )
                                : Container(
                                    margin:
                                        EdgeInsets.only(left: width * 0.070),
                                    height: height * 0.030,
                                    width: width * 0.065,
                                    decoration: BoxDecoration(
                                        color:
                                            HexColor(AppColorsLight.greyColor),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Container(
                                      margin: EdgeInsets.all(5.0),
                                      height: height * 0.030,
                                      width: width * 0.065,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                          color: HexColor(
                                              AppColorsLight.orangeColor),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                            Container(
                              margin: EdgeInsets.only(left: width * 0.050),
                              height: height * 0.030,
                              width: width * 0.500,
                              // color: Colors.red,
                              child: Text(
                                AppLists().mobileRechargeStateList[index],
                                style: TextStyle(
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor),
                                    fontSize: 17),
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
        );
      },
    ).then(
      (value) {
        print("BOTTOM SHEET CLOSED");
      },
    );
  }

  void showOperatorBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.250,
          decoration: BoxDecoration(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.backgroundColor
                  : AppColorsDark.backgroundColor),
              borderRadius: BorderRadius.circular(20)),
          child: Consumer<RechargeListController>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: AppLists().mobileRechargeOperatorList.length,
                itemBuilder: (context, index) {
                  print("LISTVIEW BUILDED $index");
                  return Padding(
                    padding: index != 0
                        ? EdgeInsets.only(top: 8.0)
                        : EdgeInsets.only(top: height * 0.020),
                    child: InkWell(
                      onTap: () {
                        rechargeListController.updateSelectedOperatorIndex(
                            index: index);
                        rechargeListController.priceController.text = "";
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: height * 0.050,
                        width: width * 0.700,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            value.operatorSelectedIndex != index
                                ? Container(
                                    margin:
                                        EdgeInsets.only(left: width * 0.070),
                                    height: height * 0.030,
                                    width: width * 0.065,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  )
                                : Container(
                                    margin:
                                        EdgeInsets.only(left: width * 0.070),
                                    height: height * 0.030,
                                    width: width * 0.065,
                                    decoration: BoxDecoration(
                                        color:
                                            HexColor(AppColorsLight.greyColor),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Container(
                                      margin: EdgeInsets.all(5.0),
                                      height: height * 0.030,
                                      width: width * 0.065,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                          color: HexColor(
                                              AppColorsLight.orangeColor),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                            Container(
                              margin: EdgeInsets.only(left: width * 0.050),
                              height: height * 0.030,
                              width: width * 0.300,
                              // color: Colors.red,
                              child: Text(
                                AppLists().mobileRechargeOperatorList[index],
                                style: TextStyle(
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor),
                                    fontSize: 17),
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
        );
      },
    ).then(
      (value) {
        print("BOTTOM SHEET CLOSED");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    rechargeListController = Provider.of<RechargeListController>(context);
    print("RECHARGE SCREEEN BUILD");
    return NetworkChecker(
      child: Scaffold(
        backgroundColor: HexColor(themeController.isLight
            ? AppColorsLight.backgroundColor
            : AppColorsDark.backgroundColor),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderContainer(),
              _buildTextFieldHeading(text: AppStrings.enterMobileNumber),
              _buildTextField(),
              _buildOperatorAndStateRow(),
              _buildTextFieldHeading(text: AppStrings.enterPlanAmount),
              _buildPlanAmountTextField(),
              SizedBox(
                height: height * 0.300,
              ),
              _buildContinueButton()
            ],
          ),
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
            width: width * 0.200,
          ),
          Text(
            AppStrings.mobileRecharge,
            style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget _buildTextFieldHeading({required String text}) {
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.070, top: height * 0.030, bottom: height * 0.010),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 17,
            color: HexColor(themeController.isLight
                ? "#484848"
                : AppColorsLight.greyColor)),
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.050),
      child: Consumer<RechargeListController>(
        builder: (context, value, child) {
          return TextFormField(
            controller: value.mobileController,
            style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor)),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(
                        color: HexColor(themeController.isLight
                            ? "#484848"
                            : AppColorsLight.greyColor)))),
          );
        },
      ),
    );
  }

  Widget _buildDropDownTextField(
      {required TextEditingController controller, required String fieldName}) {
    return GestureDetector(
      onTap: () {
        if (fieldName == "operator") {
          showOperatorBottomSheet(context);
          if (rechargeListController.operatorSelectedIndex != -1) {
            rechargeListController.operatorController.text =
                AppLists().mobileRechargeOperatorList[
                    rechargeListController.operatorSelectedIndex];

            // Navigator.pop(context);
          } else {
            rechargeListController.operatorController.text = "";
          }
        } else {
          showStateBottomSheet(context);
          if (rechargeListController.stateSelectedIndex != -1) {
            rechargeListController.stateController.text =
                AppLists().mobileRechargeStateList[
                    rechargeListController.stateSelectedIndex];
          } else {
            rechargeListController.stateController.text = "";
          }
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          style: TextStyle(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor)),
          decoration: InputDecoration(
              suffixIconColor:
                  themeController.isLight ? Colors.black : Colors.white,
              suffixIcon: InkWell(
                onTap: () {
                  showOperatorBottomSheet(context);
                },
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 35,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide(
                      color: HexColor(themeController.isLight
                          ? "#484848"
                          : AppColorsLight.greyColor)))),
        ),
      ),
    );
  }

  Widget _buildOperatorAndStateRow() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextFieldHeading(text: AppStrings.operator),
            Padding(
              padding:
                  EdgeInsets.only(left: width * 0.050, right: width * 0.025),
              child: Consumer<RechargeListController>(
                builder: (context, value, child) {
                  return _buildDropDownTextField(
                      controller: value.operatorController,
                      fieldName: "operator");
                },
              ),
            )
          ],
        )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextFieldHeading(text: AppStrings.state),
            Padding(
              padding:
                  EdgeInsets.only(left: width * 0.025, right: width * 0.050),
              child: Consumer<RechargeListController>(
                builder: (context, value, child) {
                  return _buildDropDownTextField(
                      controller: value.stateController, fieldName: "state");
                },
              ),
            )
          ],
        )),
      ],
    );
  }

  Widget _buildPlanAmountTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.050),
      child: Consumer<RechargeListController>(
        builder: (context, value, child) {
          return TextFormField(
            readOnly: true,
            controller: value.priceController,
            style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor)),
            decoration: InputDecoration(
                suffixIcon: Container(
                    // color: Colors.red,
                    padding: const EdgeInsets.only(right: 12.0),
                    alignment: Alignment.centerLeft,
                    width: width * 0.150, // Adjust based on your layout needs
                    child: InkWell(
                      onTap: () async {
                        if (value.stateController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Please select State to Explore the Plans")));
                          return;
                        }

                        if (value.operatorController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Please select Operator to Explore the Plans")));
                          return;
                        }

                        String refresh =
                            await Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RechargePlansScreen(
                              operator: value.operatorController.text,
                              state: value.stateController.text,
                            );
                          },
                        ));

                        if (refresh != "") {
                          value.updatePriceValue(price: refresh);
                        } else {}
                      },
                      child: Text(
                        "View",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor:
                                HexColor(AppColorsLight.orangeColor),
                            fontSize: 17,
                            color: HexColor(AppColorsLight.orangeColor)),
                      ),
                    )),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(
                        color: HexColor(themeController.isLight
                            ? "#484848"
                            : AppColorsLight.greyColor)))),
          );
        },
      ),
    );
  }

  Widget _buildContinueButton() {
    return Center(
      child: Consumer<RechargeListController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () {
              if (value.mobileController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please Enter Mobile Number")));
                return;
              } else if (value.mobileController.text.length < 10 ||
                  value.mobileController.text.length > 10) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please Enter Valid Mobile Number")));
                return;
              }

              if (value.priceController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please Select Plan Amount")));
                return;
              }

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return RechargePaymentScreen();
                },
              ));
            },
            child: Container(
              height: height * 0.070,
              width: width * 0.400,
              decoration: BoxDecoration(
                  color: HexColor(AppColorsLight.orangeColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  AppStrings.continueText,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: HexColor(AppColorsDark.whiteColor)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
