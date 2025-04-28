import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/auth/model/sign_up_model.dart';
import 'package:milkyway/cart/provider/home_bag_screen_controller.dart';
import 'package:milkyway/cart/provider/payment_page_controller.dart';
import 'package:milkyway/cart/ui/home_bag_page.dart';
import 'package:milkyway/cart/ui/offers_page.dart';
import 'package:milkyway/cart/ui/pay_now_page.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/constant/payment_constant_keys.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/ui/home_screen.dart';
import 'package:milkyway/home/ui/page_view.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  String? bagTotal;
  SignUpModel userData;
  List<int> dailyProductList = [];
  PaymentScreen(
      {super.key,
      required this.userData,
      this.bagTotal,
      required this.dailyProductList});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late ThemeController themeController;
  late double height;
  late double width;
  Map<String, dynamic>? paymentIntent;
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<PaymentPageController>(context, listen: false)
            .updateDiscountAndTotalAmount(bagTotal: widget.bagTotal!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("PAYMENT SCREEN BUILD");
    themeController = Provider.of<ThemeController>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return NetworkChecker(
      child: Scaffold(
        backgroundColor: HexColor(themeController.isLight
            ? AppColorsLight.backgroundColor
            : AppColorsDark.backgroundColor),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderContainer(),
              SizedBox(
                height: height * 0.010,
              ),
              _buildSelectModeHeading(title: AppStrings.selectModeForPayment),
              _buildPaymentModeContainer(),
              _buildSelectModeHeading(title: AppStrings.deliveryAddress),
              _buildLocationContainer(widget.userData),
              _buildSelectModeHeading(title: AppStrings.paymentDetails),
              _buildBagTotalContainer(),
              _buildProcessToBuyButton(),
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
            BoxShadow(
                offset: Offset(0, 10),
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 10)
          else
            BoxShadow(
                offset: Offset(0, 10),
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 10)
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
              AppStrings.payment,
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

  Widget _buildSelectModeHeading({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        title,
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor),
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }

  Widget _buildPaymentTextField({required TextInputType keyboardtype}) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.006),
      height: height * 0.045,
      width: width * 0.900,
      decoration: BoxDecoration(

          // color: Colors.red,
          border: Border.all(
              width: 1,
              color: HexColor(themeController.isLight
                  ? AppColorsLight.greyColor
                  : "#464646")),
          borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.020,
              right: width * 0.020,
              bottom: height * 0.015),
          child: TextFormField(
            keyboardType: keyboardtype,
            style: TextStyle(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor),
            ),
            cursorColor: HexColor(themeController.isLight
                ? AppColorsLight.greyColor
                : AppColorsDark.greyColor),
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentModeContainer() {
    return Consumer<PaymentPageController>(
      builder: (context, value, child) {
        return SizedBox(
          height: value.expandedStates.contains(true) &&
                  value.expandedStates[3] == false
              ? height * 0.600
              : height * 0.280,
          child: _buildPaymentListView(value: value),
        );
      },
    );
  }

  Widget _buildPaymentListView({required PaymentPageController value}) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(value.expandedStates.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCheckBoxWithDefaultView(index: index, value: value),
            index != 3
                ? _buildAnimatedContainer(index: index, value: value)
                : SizedBox()
          ],
        );
      }),
    );
  }

  Widget _buildCheckBoxWithDefaultView(
      {required int index, required PaymentPageController value}) {
    return GestureDetector(
      onTap: () {
        int length = 0;
        int trueIndex = 0;

        for (int i = 0; i < value.expandedStates.length; i++) {
          if (value.expandedStates[i] == true) {
            trueIndex = i;
            length = length + 1;
          }
        }

        if (length == 0) {
          value.changeList(index: index);
        } else if (length == 1 && trueIndex == index) {
          value.changeList(index: index);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds: 200),
              content: Text("Only one option can be displayed at a time")));
        }
      },
      child: _buildDefaultViewContainer(index: index, value: value),
    );
  }

  Widget _buildAnimatedContainer(
      {required int index, required PaymentPageController value}) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: width * 0.03),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: value.expandedStates[index] ? height * 0.320 : 0,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: HexColor(themeController.isLight
              ? AppColorsLight.lightGreyColor
              : AppColorsDark.darkGreyColor),
          boxShadow: [
            BoxShadow(
                color: themeController.isLight
                    ? Colors.grey
                    : Colors.black.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 8)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Opacity(
            opacity: value.expandedStates[index] ? 1.0 : 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.fullName,
                  style: TextStyle(
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor),
                      fontSize: 12),
                ),
                _buildPaymentTextField(keyboardtype: TextInputType.text),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.010),
                  child: Text(
                    AppStrings.cardNumber,
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontSize: 12),
                  ),
                ),
                _buildPaymentTextField(keyboardtype: TextInputType.number),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.010),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.020),
                              child: Text(
                                AppStrings.validUntil,
                                style: TextStyle(
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor),
                                    fontSize: 12),
                              ),
                            ),
                            _buildPaymentTextField(
                                keyboardtype: TextInputType.datetime)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.050,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.020),
                              child: Text(
                                AppStrings.cvv,
                                style: TextStyle(
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor),
                                    fontSize: 12),
                              ),
                            ),
                            _buildPaymentTextField(
                                keyboardtype: TextInputType.text)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.020),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.saveCardData,
                        style: TextStyle(
                          color: HexColor(AppColorsLight.darkBlueColor),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.060,
                      ),
                      CupertinoSwitch(
                        thumbColor: HexColor(AppColorsLight.orangeColor),
                        activeColor: HexColor(AppColorsLight.greyColor),
                        value: isSelected,
                        onChanged: (value) {
                          isSelected = value;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _buildSelectedCheckBox() {
    return Container(
      width: width * 0.045, // Circle size
      height: height * 0.022,
      decoration: BoxDecoration(
          color: themeController.isLight ? Colors.grey : HexColor("#464646"),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(3),
          height: height * 0.0154,
          width: width * 0.040,
          decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildDefaultCheckBox() {
    return Container(
      width: width * 0.045, // Circle size
      height: height * 0.045,
      decoration: BoxDecoration(
        color: themeController.isLight
            ? Colors.grey
            : HexColor("#464646"), // Color changes on tap
        shape: BoxShape.circle, // Makes the container a circle
      ),
    );
  }

  Widget _buildDefaultViewContainer(
      {required int index, required PaymentPageController value}) {
    return Container(
      height: height * 0.060,
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.020, vertical: height * 0.003),
      // padding: EdgeInsets.symmetric(
      //     vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
          color: HexColor(themeController.isLight
              ? AppColorsLight.lightGreyColor
              : AppColorsDark.darkGreyColor),
          boxShadow: [
            BoxShadow(
                color: HexColor(themeController.isLight
                        ? AppColorsLight.greyColor
                        : AppColorsDark.backgroundColor)
                    .withOpacity(0.8),
                blurRadius: 5,
                spreadRadius: 0.5)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.030,
          ),
          value.expandedStates[index]
              ? _buildSelectedCheckBox()
              : _buildDefaultCheckBox(),
          SizedBox(
            width: width * 0.040,
          ),
          SizedBox(
            width: width * 0.450,
            // color: Colors.red,
            child: Text(
              AppLists.paymentOptionNames[index],
              style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.30,
          ),
          index != 3
              ? Icon(
                  value.expandedStates[index]
                      ? Icons.expand_less
                      : Icons.expand_more,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                )
              : SizedBox()
        ],
      ),
    );
  }

  Widget _buildLocationContainer(
    SignUpModel? userData,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        height: height * 0.200,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: HexColor(themeController.isLight
                        ? AppColorsLight.greyColor
                        : AppColorsDark.backgroundColor)
                    .withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 0.2)
          ],
          borderRadius: BorderRadius.circular(10),
          color: HexColor(themeController.isLight
              ? AppColorsLight.lightGreyColor
              : AppColorsDark.darkGreyColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: height * 0.030,
                  width: width * 0.700,
                  color: userData == null
                      ? Colors.grey.withOpacity(0.5)
                      : Colors.transparent,
                  child: Text(
                    userData?.name ?? "",
                    style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                SizedBox(
                  width: width * 0.150,
                ),
              ],
            ),
            Container(
              height: height * 0.060,
              width: width * 0.700,
              color: userData == null
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              child: Text(
                "${userData?.address} , \n${userData?.area}-${userData?.pincode}" ??
                    "",
                style: TextStyle(
                  fontSize: 18,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                ),
              ),
            ),
            Container(
              height: height * 0.030,
              width: width * 0.70,
              color: userData == null
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              child: Text(
                userData?.mobileNumber ?? "",
                style: TextStyle(
                  fontSize: 18,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                ),
              ),
            ),
            Container(
              height: height * 0.030,
              width: width * 0.70,
              color: userData == null
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              child: Text(
                userData?.email ?? "",
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBagTotalContainer() {
    return Consumer<PaymentPageController>(
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: height * 0.010, bottom: height * 0.050),
          height: height * 0.120,
          width: double.infinity,
          decoration: BoxDecoration(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.backgroundColor
                  : AppColorsDark.darkGreyColor),
              boxShadow: [
                BoxShadow(
                    color: themeController.isLight
                        ? Colors.grey
                        : Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 0.5)
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.bagTotal,
                    style: TextStyle(
                      fontSize: 15,
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.430,
                  ),
                  Container(
                    width: width * 0.300,
                    // color: Colors.red,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "₹ ${widget.bagTotal}0",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (value.discountPrice == "00.00") {
                        String? refresh =
                            await Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return OffersPage(
                              amount: widget.bagTotal.toString(),
                            );
                          },
                        ));
                        if (refresh != null) {
                          if (refresh.contains("PERCENTAGE : ")) {
                            String discount =
                                refresh.substring(14, refresh.length);
                            value.updateAfterDiscountApplied(
                                discount: discount);
                          }
                        } else {}
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("You have already added discount...")));
                      }
                    },
                    child: Text(
                      AppStrings.discount,
                      style: TextStyle(
                        fontSize: 15,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.450),
                  Container(
                    width: width * 0.300,
                    // color: Colors.red,
                    child: Text(
                      "₹ ${value.discountPrice}",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.010,
              ),
              Divider(
                endIndent: 1,
                indent: 1,
                height: 1,
                thickness: 1,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.greyColor
                    : "#464646"),
              ),
              SizedBox(
                height: height * 0.009,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.totalAmount,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.395,
                  ),
                  Container(
                    width: width * 0.260,
                    // color: Colors.red,
                    child: Text(
                      "₹ ${value.totalPrice}",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildProcessToBuyButton() {
    return Center(
      child: Consumer<PaymentPageController>(
        builder: (context, value, child) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (value.expandedStates[0] == true ||
                  value.expandedStates[1] == true ||
                  value.expandedStates[2] == true) {
                await makePayment(value.totalPrice);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content: Text("Select Any Option First!!")));
              }

              //
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return OffersPage();
              //   },
              // ));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: height * 0.040),
              height: height * 0.060,
              width: width * 0.380,
              decoration: BoxDecoration(
                color: HexColor(AppColorsLight.orangeColor),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text(
                AppStrings.processToBuy,
                style: TextStyle(
                    color: HexColor(AppColorsDark.whiteColor),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )),
            ),
          );
        },
      ),
    );
  }

  Future<void> makePayment(String price) async {
    try {
      price = price.substring(0, price.length - 3);
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
      Provider.of<CartItemListController>(context, listen: false).clearList();
      Provider.of<QuantityListController>(context, listen: false).clearList();
      Provider.of<PaymentPageController>(context, listen: false).clearData();
      DbHelper dbHelper = DbHelper();
      Provider.of<PaymentPageController>(context, listen: false)
          .addToDailyProducts(data: widget.dailyProductList, context: context);

      await dbHelper.fetchCartProductsData();
      await dbHelper.setDefaultQuantityOfProducts();
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return PageViewScreen();
        },
      ));

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
