import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/bill_pay/gas/provider/gas_bill_screen_controller.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import '../../../constant/app_strings.dart';
import '../../bill_pay_screen.dart';

class GasBillScreen extends StatefulWidget {
  const GasBillScreen({super.key});

  @override
  State<GasBillScreen> createState() => _GasBillScreenState();
}

class _GasBillScreenState extends State<GasBillScreen> {
  late double height;
  late double width;
  late ThemeController themeController;
  List<Map<String, dynamic>> gasProviderList = [];
  DbHelper dbHelper = DbHelper();
  Map<String, dynamic>? paymentIntent;

  void showGasProviderBottomSheet({required String type}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer<GasBillScreenController>(
          builder: (context, value, child) {
            return Container(
              height: height * 0.480,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.backgroundColor
                      : AppColorsDark.backgroundColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.020),
                child: ListView.builder(
                  itemCount: value.gasBookingProviderList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          value.updateProviderIndex(index: index);
                          if (type == "number") {
                            value.checkMobile(context);
                          } else {
                            value.checkCustomerId(context);
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
                                child: Image.asset(value
                                    .gasBookingProviderList[index]["image"]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.030),
                                child: Text(
                                  value.gasBookingProviderList[index]
                                      ["gasProviderName"],
                                  style: TextStyle(
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor),
                                      fontSize: 19),
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
        await Provider.of<GasBillScreenController>(context, listen: false)
            .fetchDataOfProviders();
        Provider.of<GasBillScreenController>(context, listen: false)
            .checkMobile(context);
        Provider.of<GasBillScreenController>(context, listen: false)
            .checkCustomerId(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    print("Gas Bill Screen Build");
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
              _buildSelectOptionRow(),
              SizedBox(
                height: height * 0.010,
              ),
              Builder(builder: (context) {
                return _buildSelectProviderHeading(
                    text: (AppStrings.selectGasProvider).tr());
              }),
              _buildGasProviderDropDownTextField(),
              Consumer<GasBillScreenController>(
                builder: (context, value, child) {
                  if (value.selectedCategory != 0) {
                    return Builder(builder: (context) {
                      return _buildSelectProviderHeading(
                          text: (AppStrings.enterMobileNumber).tr());
                    });
                  } else {
                    return Builder(builder: (context) {
                      return _buildSelectProviderHeading(
                          text: (AppStrings.enterCustomerID).tr());
                    });
                  }
                },
              ),
              _buildCustomerMobileTextField(),
              SizedBox(
                height: height * 0.050,
              ),
              _buildCustomerDetailsContainer(),
              SizedBox(
                height: height * 0.150,
              ),
              _buildPayButton(),
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
              Provider.of<GasBillScreenController>(context, listen: false)
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
            width: width * 0.30,
          ),
          Builder(builder: (context) {
            return Text(
              (AppStrings.gasBill).tr(),
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

  Widget _buildSelectOptionRow() {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.020),
      child: Consumer<GasBillScreenController>(
        builder: (context, value, child) {
          return Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  value.updateCategory(index: 0);
                },
                child: value.selectedCategory == 0
                    ? Container(
                        margin: EdgeInsets.only(left: width * 0.030),
                        height: height * 0.025,
                        width: width * 0.055,
                        decoration: BoxDecoration(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.greyColor
                                : AppColorsDark.greyColor),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          height: height * 0.020,
                          width: width * 0.045,
                          decoration: BoxDecoration(
                              color: HexColor(AppColorsLight.orangeColor),
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(left: width * 0.030),
                        height: height * 0.025,
                        width: width * 0.055,
                        decoration: BoxDecoration(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.greyColor
                                : AppColorsDark.greyColor),
                            borderRadius: BorderRadius.circular(30)),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.020),
                child: Builder(builder: (context) {
                  return Text(
                    (AppStrings.payGasBill).tr(),
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  );
                }),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  value.updateCategory(index: 1);
                },
                child: value.selectedCategory == 1
                    ? Container(
                        margin: EdgeInsets.only(left: width * 0.040),
                        height: height * 0.025,
                        width: width * 0.055,
                        decoration: BoxDecoration(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.greyColor
                                : AppColorsDark.greyColor),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          height: height * 0.020,
                          width: width * 0.045,
                          decoration: BoxDecoration(
                              color: HexColor(AppColorsLight.orangeColor),
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(left: width * 0.040),
                        height: height * 0.025,
                        width: width * 0.055,
                        decoration: BoxDecoration(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.greyColor
                                : AppColorsDark.greyColor),
                            borderRadius: BorderRadius.circular(30)),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.030),
                child: Builder(builder: (context) {
                  return Text(
                    (AppStrings.bookAGasCylinder).tr(),
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  );
                }),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildSelectProviderHeading({required String text}) {
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

  Widget _buildGasProviderDropDownTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.050, vertical: height * 0.005),
      child: Consumer<GasBillScreenController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () {
              showGasProviderBottomSheet(
                  type: value.selectedCategory == 1 ? "number" : "id");
            },
            child: AbsorbPointer(
              child: TextFormField(
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor)),
                controller: value.gasProviderController,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: width * 0.020),
                      child: Icon(Icons.keyboard_arrow_down_sharp,
                          size: 35,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor)),
                    ),
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

  Widget _buildCustomerMobileTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.050, vertical: height * 0.010),
      child: Consumer<GasBillScreenController>(
        builder: (context, value, child) {
          return TextFormField(
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor)),
            onChanged: (v) {
              if (value.selectedCategory == 1) {
                if (value.gasProviderController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Select Operator First")));
                } else if (v.length == 10) {
                  value.checkMobile(context);
                }
              } else {
                if (value.gasProviderController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Select Operator First")));
                } else if (v.length == 6) {
                  value.checkCustomerId(context);
                }
              }
            },
            controller: value.selectedCategory == 1
                ? value.mobileController
                : value.customerIdController,
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
    return Consumer<GasBillScreenController>(
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.all(20),
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
                            style:
                                TextStyle(fontSize: 16, fontFamily: "poppins"),
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
                            style:
                                TextStyle(fontSize: 16, fontFamily: "poppins"),
                            children: [
                          TextSpan(
                              text: (AppStrings.dealerName).tr(),
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
                            style:
                                TextStyle(fontSize: 16, fontFamily: "poppins"),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            style:
                                TextStyle(fontSize: 16, fontFamily: "poppins"),
                            children: [
                          TextSpan(
                              text: value.selectedCategory == 1
                                  ? value.bookingOperatorData["customerName"] ??
                                      ""
                                  : value.payCustomerData["customerName"] ?? "",
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            style:
                                TextStyle(fontSize: 16, fontFamily: "poppins"),
                            children: [
                              TextSpan(
                                  text: value.selectedCategory == 1
                                      ? value.bookingOperatorData[
                                              "dealerName"] ??
                                          ""
                                      : value.payCustomerData["dealerName"] ??
                                          "",
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
                            style:
                                TextStyle(fontSize: 16, fontFamily: "poppins"),
                            children: [
                          TextSpan(
                              text: value.selectedCategory == 1
                                  ? value.bookingOperatorData[
                                              "billAmountRemain"]
                                          ?.toString() ??
                                      ""
                                  : value.payCustomerData["billAmountRemain"]
                                          ?.toString() ??
                                      "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: HexColor(themeController.isLight
                                      ? AppColorsLight.darkBlueColor
                                      : AppColorsDark.greyColor))),
                        ])),
                  ],
                ),
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

      Provider.of<GasBillScreenController>(context, listen: false).clearData();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BillPayScreen()),
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

  Widget _buildPayButton() {
    return Center(
      child: Consumer<GasBillScreenController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () async {
              if (value.bookingOperatorData["billAmountRemain"] != null &&
                  value.bookingOperatorData["billAmountRemain"] != 0.0) {
                await makePayment(
                    value.bookingOperatorData["billAmountRemain"].toString());
              } else {
                Provider.of<GasBillScreenController>(context, listen: false)
                    .clearData();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BillPayScreen()),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              height: height * 0.080,
              width: value.selectedCategory == 1
                  ? value.bookingOperatorData["billAmountRemain"] == null
                      ? width * 0.450
                      : value.bookingOperatorData["billAmountRemain"] != 0.0
                          ? value.bookingOperatorData["billAmountRemain"] *
                              0.250
                          : width * 0.320
                  : value.payCustomerData["billAmountRemain"] == null
                      ? width * 0.450
                      : value.payCustomerData["billAmountRemain"] != 0.0
                          ? value.payCustomerData["billAmountRemain"] * 0.250
                          : width * 0.320,
              decoration: BoxDecoration(
                  color: HexColor(AppColorsLight.orangeColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Builder(builder: (context) {
                return RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 17,
                            color: HexColor(AppColorsDark.whiteColor),
                            fontFamily: "poppins",
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: value.selectedCategory == 1
                              ? value.bookingOperatorData["billAmountRemain"] !=
                                      0.0
                                  ? (AppStrings.continueToPay).tr()
                                  : "Continue"
                              : value.payCustomerData["billAmountRemain"] != 0.0
                                  ? (AppStrings.continueToPay).tr()
                                  : "Continue",
                          style: TextStyle()),
                      TextSpan(
                          text: value.selectedCategory == 1
                              ? value.bookingOperatorData["billAmountRemain"] ==
                                      null
                                  ? ""
                                  : value.bookingOperatorData[
                                              "billAmountRemain"] !=
                                          0.0
                                      ? value.bookingOperatorData[
                                          "billAmountRemain"]
                                      : ""
                              : value.payCustomerData["billAmountRemain"] ==
                                      null
                                  ? ""
                                  : value.payCustomerData["billAmountRemain"] !=
                                          0.0
                                      ? value
                                          .payCustomerData["billAmountRemain"]
                                      : "",
                          style: TextStyle()),
                    ]));
              }),
            ),
          );
        },
      ),
    );
  }
}
