import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import '../../../constant/app_lists.dart';
import '../../../constant/app_strings.dart';

import '../../bill_pay_screen.dart';
import '../provider/electricity_controller.dart';

class ElectricityBillScreen extends StatefulWidget {
  const ElectricityBillScreen({super.key});

  @override
  State<ElectricityBillScreen> createState() => _ElectricityBillScreenState();
}

class _ElectricityBillScreenState extends State<ElectricityBillScreen> {
  late double height;
  late double width;
  late ThemeController themeController;
  Map<String, dynamic>? paymentIntent;

  void showStateBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
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
          child: Consumer<ElectricityController>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: AppLists().mobileRechargeStateList.length,
                itemBuilder: (context, index) {
                  print("LISTVIEW BUILDED $index");
                  return Padding(
                    padding: index != 0
                        ? const EdgeInsets.only(top: 8.0)
                        : EdgeInsets.only(top: height * 0.020),
                    child: InkWell(
                      onTap: () {
                        value.updateSelectedStateIndex(index: index);
                        if (value.mobileController.text.isNotEmpty) {
                          value.checkElectricityBill(
                              state: value.stateController.text,
                              provider: value.electricityController.text,
                              number: value.mobileController.text,
                              context: context);
                        }
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
                                      margin: const EdgeInsets.all(5.0),
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

  void showElectricityBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer<ElectricityController>(
          builder: (context, value, child) {
            return Container(
              height: height * 0.450,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.backgroundColor
                      : AppColorsDark.backgroundColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.020),
                child: ListView.builder(
                  itemCount: value.electricityProvidersDetail.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          value.updateProviderDetails(index: index);
                          if (value.mobileController.text.isNotEmpty) {
                            value.checkElectricityBill(
                                state: value.stateController.text,
                                provider: value.electricityController.text,
                                number: value.mobileController.text,
                                context: context);
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: height * 0.070,
                          width: width * 0.400,
                          // color: Colors.red,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: width * 0.020),
                                height: height * 0.065,
                                width: width * 0.140,
                                decoration: BoxDecoration(
                                    color: HexColor(AppColorsDark.whiteColor),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: HexColor(
                                            AppColorsLight.orangeColor),
                                        width: 1)),
                                child: Image.asset(
                                    value.electricityProvidersDetail[index]
                                        ["image"]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.030),
                                child: SizedBox(
                                  width: width * 0.780,
                                  // color: Colors.red,
                                  child: Text(
                                    softWrap: true,
                                    maxLines: 2,
                                    value.electricityProvidersDetail[index]
                                        ["electricityProvider"],
                                    style: TextStyle(
                                        color: HexColor(themeController.isLight
                                            ? AppColorsLight.darkBlueColor
                                            : AppColorsDark.whiteColor),
                                        fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<ElectricityController>(context, listen: false)
            .fetchProvidersData();
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("Electricity Screen disposed");
  }

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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderContainer(),
              Builder(builder: (context) {
                return _buildTextFieldHeading(text: (AppStrings.state).tr());
              }),
              _buildStateDropDownTextField(type: "state"),
              Builder(builder: (context) {
                return _buildTextFieldHeading(
                    text: (AppStrings.selectElectricityBoardToProceed).tr());
              }),
              _buildStateDropDownTextField(type: "electricity"),
              Builder(builder: (context) {
                return _buildTextFieldHeading(
                    text: (AppStrings.consumerNumber).tr());
              }),
              _buildMobileTextField(),
              SizedBox(
                height: height * 0.020,
              ),
              _buildCustomerDetailsContainer(),
              SizedBox(
                height: height * 0.050,
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
              Provider.of<ElectricityController>(context, listen: false)
                  .clearData();
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
            width: width * 0.20,
          ),
          Builder(builder: (context) {
            return Text(
              (AppStrings.electricityBill).tr(),
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

  Widget _buildTextFieldHeading({required String text}) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.020, left: width * 0.09),
      child: Text(
        text,
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.greyColor
                : AppColorsDark.greyColor),
            fontSize: 17),
      ),
    );
  }

  Widget _buildStateDropDownTextField({required String type}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.050, vertical: height * 0.005),
      child: Consumer<ElectricityController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () async {
              if (type == "state") {
                showStateBottomSheet(context);
              } else {
                showElectricityBottomSheet(context);
              }

              // showGasProviderBottomSheet();
            },
            child: AbsorbPointer(
              child: TextFormField(
                maxLines: 1,
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15),
                controller: type == "state"
                    ? value.stateController
                    : value.electricityController,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: width * 0.020),
                      child: Icon(Icons.keyboard_arrow_down_sharp,
                          size: 35,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: themeController.isLight
                                ? Colors.black
                                : Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 1,
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.greyColor
                                : AppColorsDark.greyColor)))),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMobileTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.050, vertical: height * 0.005),
      child: Consumer<ElectricityController>(
        builder: (context, value, child) {
          return TextFormField(
            controller: value.mobileController,
            onChanged: (v) {
              if (v.length == 10) {
                value.checkElectricityBill(
                    context: context,
                    number: value.mobileController.text,
                    provider: value.electricityController.text,
                    state: value.stateController.text);
              }
            },
            maxLines: 1,
            style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontSize: 17),
            cursorColor: themeController.isLight ? Colors.black : Colors.white,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: themeController.isLight
                            ? Colors.black
                            : Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.greyColor
                            : AppColorsDark.greyColor)))),
          );
        },
      ),
    );
  }

  Widget _buildCustomerDetailsContainer() {
    return Consumer<ElectricityController>(
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.050, vertical: height * 0.020),
          height: height * 0.180,
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : "000000"),
                    blurRadius: 15,
                    spreadRadius: 0)
              ],
              color: HexColor(themeController.isLight
                  ? AppColorsLight.lightGreyColor
                  : AppColorsDark.darkGreyColor),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    return RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 16, fontFamily: "poppins"),
                            children: [
                          TextSpan(
                              text: (AppStrings.customerName).tr(),
                              style: TextStyle(
                                  color: HexColor(themeController.isLight
                                      ? "#484848"
                                      : AppColorsDark.greyColor))),
                        ]));
                  }),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  Builder(builder: (context) {
                    return RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 16, fontFamily: "poppins"),
                            children: [
                          TextSpan(
                              text: (AppStrings.dueDate).tr(),
                              style: TextStyle(
                                  color: HexColor(themeController.isLight
                                      ? "#484848"
                                      : AppColorsDark.greyColor))),
                        ]));
                  }),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  Builder(builder: (context) {
                    return RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 16, fontFamily: "poppins"),
                            children: [
                          TextSpan(
                              text: (AppStrings.billAmount).tr(),
                              style: TextStyle(
                                  color: HexColor(themeController.isLight
                                      ? "#484848"
                                      : AppColorsDark.greyColor))),
                        ]));
                  }),
                ],
              ),
              SizedBox(width: width * 0.020),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 16, fontFamily: "poppins"),
                          children: [
                        TextSpan(
                            text: value.electricityData["name"] ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.greyColor))),
                      ])),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 16, fontFamily: "poppins"),
                          children: [
                        TextSpan(
                            text: value.electricityData["dueDate"] ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.greyColor))),
                      ])),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 16, fontFamily: "poppins"),
                          children: [
                        TextSpan(
                            text: value.electricityData["amount"]?.toString() ??
                                "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkBlueColor
                                    : AppColorsDark.greyColor))),
                      ])),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> makePayment(String price) async {
    try {
      price = price.substring(0, price.length - 2);
      print(price);
      paymentIntent = await createPaymentIntent(price, 'INR');

      // 2. Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          merchantDisplayName: 'Your Business Name',
          customerId:
              paymentIntent!['customer'], // Ensure your backend includes this
          customerEphemeralKeySecret: paymentIntent![
              'ephemeralKey'], // Ensure your backend includes this
        ),
      );

      // 3. Display Payment Sheet
      await Stripe.instance.presentPaymentSheet();

      // Show Success Popup
      showPaymentDialog("Payment Successful", "Your payment was successful ✅");

      paymentIntent = null; // Reset after successful payment

      Provider.of<ElectricityController>(context, listen: false).clearData();

      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => BillPayScreen()),
      );
    } catch (e) {
      if (e is StripeException) {
        showPaymentDialog(
          "Payment Failed",
          "Payment failed ❌: ${e.error.localizedMessage}",
        );
      } else {
        showPaymentDialog("Payment Failed", "An error occurred ❌");
      }
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
    String amount,
    String currency,
  ) async {
    try {
      Map<String, dynamic> body = {
        'amount': (int.parse(amount) * 100)
            .toString(), // Stripe requires amount in cents
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
              'Bearer sk_test_51QeaREP96E6eOehqt78P0qcJka91spvmf8SghebYi4YTPtowoOrXoDLjGNNp05wtTKzHdAoBYXE2CxXqfE0b8CUj00Y8Yq6aTa', // Replace with your secret key
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      throw Exception('Failed to create payment intent: $e');
    }
  }

  void showPaymentDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: HexColor(AppColorsLight.backgroundColor),
          title: Text(
            title,
            style: TextStyle(
                color: HexColor(AppColorsLight.darkBlueColor),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          content: Container(
              alignment: Alignment.center,
              height: height * 0.100,
              width: width * 0.500,
              // color: Colors.red,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  message,
                  style: TextStyle(
                      color: HexColor(AppColorsLight.darkBlueColor),
                      fontSize: 20),
                ),
              )),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: height * 0.070,
                width: width * 0.600,
                decoration: BoxDecoration(
                    color: HexColor(AppColorsLight.orangeColor),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "OK",
                    style: TextStyle(
                        color: HexColor(AppColorsDark.whiteColor),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildContinueButton() {
    return Center(
      child: Consumer<ElectricityController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () async {
              if (value.electricityData["amount"] != null ||
                  value.electricityData["amount"] != 0.0) {
                await makePayment(value.electricityData["amount"].toString());
              }
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              height: height * 0.085,
              width: value.electricityData["amount"] == null
                  ? width * 0.230
                  //     :
                  // value.electricityData["amount"] != 0.0
                  //         ? value.electricityData["amount"] * 0.250
                  : value.electricityData["amount"] * 0.220,
              decoration: BoxDecoration(
                  color: HexColor(AppColorsLight.orangeColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Builder(builder: (context) {
                return RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 21,
                            color: HexColor(AppColorsDark.whiteColor),
                            fontFamily: "poppins",
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: value.electricityData["amount"] != null
                              ? (AppStrings.continueToPay).tr()
                              : "Fetch Bill",
                          style: const TextStyle()),
                      TextSpan(
                          text: value.electricityData["amount"] != 0.0
                              ? value.electricityData["amount"]?.toString()
                              : "",
                          style: const TextStyle()),
                    ]));
              }),
            ),
          );
        },
      ),
    );
  }
}
