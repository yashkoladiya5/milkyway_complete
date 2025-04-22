import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/cart/provider/pay_now_page_controller.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PayNowPage extends StatefulWidget {
  const PayNowPage({super.key});

  @override
  State<PayNowPage> createState() => _PayNowPageState();
}

class _PayNowPageState extends State<PayNowPage> {
  late double height;
  late double width;
  late ThemeController themeController;
  Map<String, dynamic>? paymentIntent;
  late PayNowPageController payNowPageController;

  @override
  Widget build(BuildContext context) {
    print("PAY NOW PAGE BUILD");
    themeController = Provider.of<ThemeController>(context);

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return NetworkChecker(
      child: ChangeNotifierProvider(
        create: (context) => PayNowPageController(),
        child: Scaffold(
          backgroundColor: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderContainer(),
              _buildHeading(text: AppStrings.uploadBalanceWithUPIId),
              _buildGridViewOfUPI(),
              _buildHeading(text: AppStrings.setAutoPayment),
              _buildPaymentContainer(),
              _buildPayNowButton(),
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
            child: Center(
                child: Text(
              AppStrings.payNow,
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

  Widget _buildHeading({required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.025, vertical: height * 0.015),
      child: Text(
        text,
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor),
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDefaultBalanceContainer(
      {required int index, required PayNowPageController value}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.015, vertical: height * 0.008),
      child: InkWell(
        splashColor: Colors.transparent,
        radius: 0,
        onTap: () {
          print("INDEX == $index");

          value.changeIndex(index: index);
        },
        child: Container(
          height: height * 0.050,
          width: width * 0.200,
          // color: Colors.blue,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.greyColor
                      : "484848"),
                  width: 1)),
          child: Center(
            child: Text(
              AppLists.upiBalanceList[index],
              style: TextStyle(
                  color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor)
                      .withOpacity(0.7),
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpiGridView() {
    return Consumer<PayNowPageController>(
      builder: (context, value, child) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 8 / 4, crossAxisCount: 3),
          itemBuilder: (context, index) {
            if (value.selectedIndex != index) {
              return _buildDefaultBalanceContainer(index: index, value: value);
            } else {
              return _buildSelectedBalanceContainer(index: index, value: value);
            }
          },
        );
      },
    );
  }

  Widget _buildGridViewOfUPI() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.070),
      child: Container(
          height: height * 0.140,
          width: double.infinity,
          // color: Colors.red,
          child: _buildUpiGridView()),
    );
  }

  Widget _buildSelectedBalanceContainer(
      {required int index, required PayNowPageController value}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.015, vertical: height * 0.008),
      child: InkWell(
        splashColor: Colors.transparent,
        radius: 0,
        onTap: () {
          value.changeIndex(index: 6);
        },
        child: Container(
          height: height * 0.050,
          width: width * 0.200,
          // color: Colors.blue,
          decoration: BoxDecoration(
            color: HexColor(themeController.isLight
                ? AppColorsLight.lightGreyColor
                : AppColorsDark.darkGreyColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              AppLists.upiBalanceList[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPayNowButton() {
    return Center(
      child: Consumer<PayNowPageController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () {
              if (value.selectedIndex != -1) {
                makePayment(AppLists.upiBalanceList[value.selectedIndex]);
              }
            },
            child: Container(
              height: height * 0.060,
              width: width * 0.300,
              decoration: BoxDecoration(
                  color: HexColor(AppColorsLight.orangeColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  AppStrings.payNow,
                  style: TextStyle(
                      color: HexColor(AppColorsDark.whiteColor),
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentContainer() {
    return Container(
      height: height * 0.450,
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        children: [
          _buildPaymentRow(),
          Divider(
            indent: width * 0.050,
            endIndent: width * 0.050,
            color: HexColor(
                themeController.isLight ? AppColorsLight.greyColor : "464646"),
          ),
          _buildPaymentCheckBoxContainer(),
        ],
      ),
    );
  }

  Widget _buildPaymentRow() {
    return Row(
      children: [
        Container(
          height: height * 0.030,
          width: width * 0.420,
          // color: Colors.blue,
          child: Text(
            textAlign: TextAlign.end,
            AppStrings.autoPayment,
            style: TextStyle(
                color: HexColor(AppColorsLight.silverColor), fontSize: 15),
          ),
        ),
        SizedBox(
          width: width * 0.080,
        ),
        Container(
          height: height * 0.030,
          width: width * 0.500,
          // color: Colors.deepPurple,
          child: Text(
            textAlign: TextAlign.center,
            AppStrings.comingSoon,
            style: TextStyle(
                color: HexColor(AppColorsLight.silverColor), fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentCheckBoxContainer() {
    return SizedBox(
      height: height * 0.350,
      // color: Colors.amber,
      child: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.001),
          child: SizedBox(
            height: height * 0.060,
            width: double.infinity,
            // color: Colors.white,
            child: Row(
              children: [
                _buildCheckBox(index: index),
                Container(
                  height: height * 0.055,
                  width: width * 0.400,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Text(
                        AppStrings.balanceUnder,
                        style: TextStyle(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: height * 0.025,
                        width: width * 0.290,
                        child: Text(
                          "₹ ${AppLists.balanceList[index]}",
                          style: TextStyle(
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.darkBlueColor
                                  : AppColorsDark.whiteColor),
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.030,
                  width: width * 0.430,
                  // color: Colors.red,
                  child: Text(
                    textAlign: TextAlign.end,
                    AppLists.autoPayList[index],
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckBox({required int index}) {
    return Consumer<PayNowPageController>(
      builder: (context, value, child) {
        return Container(
          margin: EdgeInsets.only(left: width * 0.020),
          padding: EdgeInsets.all(5),
          height: height * 0.040,
          width: width * 0.085,
          // color: Colors.red,
          child: InkWell(
            radius: 0,
            splashColor: Colors.transparent,
            onTap: () {
              if (value.paymentIndex == index) {
                value.changePaymentIndex(index: 5);
              } else {
                value.changePaymentIndex(index: index);
              }
            },
            child: Container(
                decoration: BoxDecoration(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.backgroundColor
                        : AppColorsDark.backgroundColor),
                    border: Border.all(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.greyColor
                            : "464646"),
                        width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: value.paymentIndex == index
                    ? Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: HexColor(AppColorsLight.orangeColor),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: HexColor(themeController.isLight
                                    ? AppColorsLight.darkGreyColor
                                    : "464646"),
                                width: 2)),
                      )
                    : SizedBox()),
          ),
        );
      },
    );
  }

  Future<void> makePayment(String price) async {
    try {
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
      String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      String name = AppStrings.uploadBalanceWithUPIId;
      int isIncome = 1;
      String price1 = "₹" + price;
      String weightValue = "";
      String weightUnit = "";
      String quantity = "";
      String image = "";

      final data = CartWalletModel(
          date: date,
          image: image,
          isExpense: 0,
          isIncome: isIncome,
          name: name,
          price: price1,
          quantity: quantity,
          weightUnit: weightUnit,
          weightValue: weightValue);

      DbHelper dbHelper = DbHelper();

      await dbHelper.insertWalletData(model: data);
      print("DATA INSERTED");
      Navigator.pop(context);
      Navigator.pop(context);

      paymentIntent = null; // Reset after successful payment
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

  // Function to show a pop-up dialog
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
}
