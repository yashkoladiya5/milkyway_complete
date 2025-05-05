import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/wallet/provider/wallet_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

import 'invoice/data/invoice.dart';
import 'invoice/data/pdf_invoice_generate.dart';
import 'invoice/data/pdf_save.dart';

class WalletPage extends StatefulWidget {
  bool isBottomBar;
  WalletPage({super.key, required this.isBottomBar});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late double height;
  late double width;
  late ThemeController themeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        Provider.of<WalletScreenController>(context, listen: false).clearData();
        Provider.of<WalletScreenController>(context, listen: false)
            .fetchUserData();
      },
    );
  }

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
        physics: NeverScrollableScrollPhysics(),
        child: SizedBox(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderContainer(),
                  _buildDateRow(),
                  _buildCalculationContainer(),
                  _buildHeadingText(),
                  _buildListView(),
                ],
              ),
              _buildInvoiceButton(),
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
                (AppStrings.wallet).tr(),
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
    return Padding(
      padding: EdgeInsets.only(
          top: height * 0.020, left: width * 0.050, right: width * 0.050),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<WalletScreenController>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () async {
                  value.updateDateTime(context: context);
                },
                child: Container(
                  height: height * 0.050,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 5,
                            color: HexColor(
                                themeController.isLight ? "E5E5E5" : "#0D0D0D"))
                      ],
                      color: HexColor(themeController.isLight
                          ? "EEEEEE"
                          : AppColorsDark.darkGreyColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    value.dateTimeRange,
                    style: TextStyle(
                      fontSize: 13,
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor),
                    ),
                  )),
                ),
              );
            },
          ),
          Container(
            height: height * 0.045,
            width: width * 0.200,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: HexColor(
                          themeController.isLight ? "#E5E5E5" : "#0D0D0D"))
                ],
                color: HexColor(themeController.isLight
                    ? "#EEEEEE"
                    : AppColorsDark.darkGreyColor),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Builder(builder: (context) {
                  return Text(
                    (AppStrings.add).tr(),
                    style: TextStyle(
                        fontSize: 13,
                        color: HexColor(
                          themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor,
                        )),
                  );
                }),
                Icon(
                  Icons.add,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  size: 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCalculationContainer() {
    return Consumer<WalletScreenController>(
      builder: (context, value, child) {
        return Container(
          margin: EdgeInsets.only(top: height * 0.020),
          height: height * 0.200,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 1,
                  color:
                      HexColor(themeController.isLight ? "#E5E5E5" : "#000000"))
            ],
            color: HexColor(themeController.isLight ? "#EEEEEE" : "#0D0D0D"),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.020),
                child: Text(
                  "₹ ${value.totalAmount}",
                  style: TextStyle(
                      fontSize: 50,
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.020),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.green,
                            size: 45,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Builder(builder: (context) {
                                return Text(
                                  (AppStrings.income).tr(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor)),
                                );
                              }),
                              Text(
                                "₹ ${value.totalIncome}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.red,
                            size: 45,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Builder(builder: (context) {
                                return Text(
                                  (AppStrings.expense).tr(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor)),
                                );
                              }),
                              Text(
                                "₹ ${value.totalExpense}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeadingText() {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.020, left: width * 0.030),
      child: Builder(builder: (context) {
        return Text(
          (AppStrings.transactionDetail).tr(),
          style: TextStyle(
              fontSize: 17,
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor)),
        );
      }),
    );
  }

  Widget _buildListView() {
    return SizedBox(
      height: height / 2,
      width: double.infinity,
      child: Consumer<WalletScreenController>(
        builder: (context, value, child) {
          if (value.transactionData.isEmpty) {
            return Center(
                child: Text(
              "NO TRANSACTIONS DONE IN BETWEEN SELECTED DATES",
              style: TextStyle(color: Colors.red),
            ));
          }
          return ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            // physics: NeverScrollableScrollPhysics(),
            padding:
                EdgeInsets.only(top: height * 0.010, bottom: height * 0.070),
            itemCount: value.transactionData.length,
            itemBuilder: (context, index) {
              double finalPrice = 0.0;
              DateTime parsedDate =
                  DateTime.parse(value.transactionData[index].date);
              String formattedDate =
                  DateFormat('dd/MM/yyyy').format(parsedDate);

              int isIncome = value.transactionData[index].isIncome;
              String price = value.transactionData[index].price
                  .substring(1, value.transactionData[index].price.length);
              String quantity = value.transactionData[index].quantity;

              print("$price :::: price");
              print("$quantity :::: quantity");
              if (quantity == "1") {
                finalPrice = double.parse(price);
              } else {
                finalPrice = double.parse(price) *
                    int.parse(value.transactionData[index].quantity);
              }

              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: height * 0.070,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 1,
                            color: HexColor(themeController.isLight
                                ? "#4DA9A9A9"
                                : "#000000"))
                      ],
                      color: HexColor(
                          themeController.isLight ? "#EEEEEE" : "#0D0D0D")),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.055),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.025,
                              width: width * 0.580,
                              // color: Colors.red,
                              child: Text(
                                value.transactionData[index].name,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor)),
                              ),
                            ),
                            Container(
                              height: height * 0.025,
                              width: width * 0.300,
                              // color: Colors.red,
                              child: Text(
                                formattedDate,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.darkBlueColor
                                        : AppColorsDark.whiteColor)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: width * 0.100),
                        height: height * 0.070,
                        width: width * 0.210,
                        // color: Colors.red,
                        child: Text(
                          isIncome == 1
                              ? "+ ${value.transactionData[index].price}"
                              : "- ₹${finalPrice.toString()}0",
                          style: TextStyle(
                              color: isIncome == 1 ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildInvoiceButton() {
    return Positioned(
      bottom: widget.isBottomBar == false ? width * 0.100 : width * 0.250,
      left: width / 2.9,
      child: Consumer<WalletScreenController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () async {
              if (value.invoiceData.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Select Date For transactions Data")));
                return;
              }
              final date = DateTime.now();
              final dueDate = date.add(Duration(days: 7));

              final invoice = Invoice(
                  supplier: Supplier(
                    name: 'Milkyway india',
                    address: 'B-502,Diamond World,surat',
                    paymentInfo: 'https://paypal.me/milkyway',
                  ),
                  customer: Customer(
                    name: value.userData["name"],
                    address: value.userData["address"],
                  ),
                  info: InvoiceInfo(
                    date: date,
                    dueDate: dueDate,
                    description: 'This is invoice of milkyway',
                    number: '${DateTime.now().year}-9999',
                  ),
                  items: value.invoiceData.map(
                    (item) {
                      String price = item.price.substring(0, item.price.length);
                      double totalPrice = double.parse(price);
                      return InvoiceItem(
                          description: item.name,
                          date: DateTime.parse(item.date),
                          quantity: int.parse(item.quantity),
                          unitPrice: totalPrice);
                    },
                  ).toList());

              final pdfFile = await PdfInvoiceApi.generate(invoice);

              PdfApi.openFile(pdfFile);
            },
            child: Container(
              height: height * 0.055,
              width: width * 0.300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: HexColor(AppColorsLight.orangeColor),
              ),
              child: Center(
                child: Builder(builder: (context) {
                  return Text(
                    (AppStrings.invoice).tr(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: HexColor(AppColorsDark.whiteColor)),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
Consumer<WalletScreenController>(
        builder: (context, value, child) {
          return InkWell(
            onTap: () async {
              final date = DateTime.now();
              final dueDate = date.add(Duration(days: 7));

              final invoice = Invoice(
                  supplier: Supplier(
                    name: 'Milkyway india',
                    address: 'B-502,Diamond World,surat',
                    paymentInfo: 'https://paypal.me/milkyway',
                  ),
                  customer: Customer(
                    name: value.userData["name"],
                    address: value.userData["address"],
                  ),
                  info: InvoiceInfo(
                    date: date,
                    dueDate: dueDate,
                    description: 'This is invoice of milkyway',
                    number: '${DateTime.now().year}-9999',
                  ),
                  items: value.transactionData.map(
                    (item) {
                      return InvoiceItem(
                          description: item.name,
                          date: DateTime.parse(item.date),
                          quantity: int.parse(item.quantity),
                          unitPrice: double.parse(item.weightValue));
                    },
                  ).toList());

              final pdfFile = await PdfInvoiceApi.generate(invoice);

              PdfApi.openFile(pdfFile);
            },
          );
        },
        child: Container(
          height: height * 0.055,
          width: width * 0.300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor(AppColorsLight.orangeColor),
          ),
          child: Builder(builder: (context) {
            return Text(
              (AppStrings.invoice).tr(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: HexColor(AppColorsDark.whiteColor)),
            );
          }),
        ),
      ),
 */
