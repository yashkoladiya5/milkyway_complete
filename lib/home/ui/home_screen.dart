import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:milkyway/cart/ui/offers_page.dart';
import 'package:milkyway/cart/ui/pay_now_page.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';
import 'package:milkyway/home/provider/home_page_controller.dart';
import 'package:milkyway/home/ui/home_category_screen.dart';
import 'package:milkyway/home/ui/product_page.dart';
import 'package:milkyway/home/ui/search_screen.dart';
import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:milkyway/wallet/provider/wallet_screen_controller.dart';
import 'package:milkyway/wallet/ui/wallet_page.dart';
import 'package:provider/provider.dart';

import '../../bill_pay/bill_pay_screen.dart';

class HomeScreen extends StatefulWidget {
  final ValueNotifier<bool> refreshNotifier;

  HomeScreen({super.key, required this.refreshNotifier});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isConnectedToInternet = false;
  StreamSubscription? _internetConnectionStreamSubscription;
  late double height;
  late double width;
  List<String> allDatesFromToday = [];
  late List<Widget> pageList = [];
  int activePage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  late LoadingController loadingController;
  late HomePageController homePageController;

  String? date;
  late ThemeController themeController;
  String? refresh;

  // Future fetchData() async {
  //   favouriteProductList = await DbHelper().readFavouriteProductData();
  //
  //   if (favouriteProductList.isEmpty) {
  //     print("NO DATA");
  //   } else {
  //     print(favouriteProductList.length);
  //   }
  // }

  Future<void> printDate() async {
    DateTime now = DateTime.now();

    for (int i = 0; i < 15; i++) {
      DateTime date = now.add(Duration(days: i));

      String formattedDate =
          '${AppLists().months[date.month - 1]} ${AppLists().weekdays[date.weekday - 1]} ${date.day.toString().padLeft(2, '0')}';
      allDatesFromToday.add(formattedDate);
    }

    for (int i = 0; i < allDatesFromToday.length; i++) {
      print("COUNT ==== $i ${allDatesFromToday[i]}");
    }

    String date = allDatesFromToday[0].substring(0, 3);
    print("Formatted DATE ===== $date");
  }

  updateFavouriteProduct(
      int id, Map<String, Object?> data, bool isAdded) async {
    await DbHelper().updateProduct(id, data);

    print("DATABASE UPDATED...");
    if (isAdded) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Added To Favourite List")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Removed From Favourite List")));
    }
    await homePageController.fetchFavouriteProductList();
    // await updateUI();
    setState(() {});
  }

  updateData(int index) async {
    homePageController.favouriteProductList[index].isFavourite =
        homePageController.favouriteProductList[index].isFavourite == 1 ? 0 : 1;
    homePageController.favouriteProductList[index].isFavourite =
        homePageController.favouriteProductList[index].isFavourite == 1 ? 0 : 1;

    ProductModel productModel = homePageController.favouriteProductList[index];

    Map<String, Object?> data = productModel.toJson();
    if (homePageController.favouriteProductList[index].isFavourite == 1) {
      await updateFavouriteProduct(
          homePageController.favouriteProductList[index].id!, data, false);
    } else {
      await updateFavouriteProduct(
          homePageController.favouriteProductList[index].id!, data, true);
    }
  }

  addToCart({required int index}) async {
    int quantity =
        int.parse(homePageController.favouriteProductList[index].quantity!);
    if (quantity > 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product is already in Cart")));
    } else {
      homePageController.favouriteProductList[index].quantity = '1';
      await DbHelper().updateProduct(
          homePageController.favouriteProductList[index].id!,
          homePageController.favouriteProductList[index].toJson());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Added in Cart")));
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        _internetConnectionStreamSubscription =
            InternetConnection().onStatusChange.listen(
          (event) {
            switch (event) {
              case InternetStatus.connected:
                setState(() {
                  isConnectedToInternet = true;
                });
                break;

              case InternetStatus.disconnected:
                setState(() {
                  isConnectedToInternet = false;
                });
                break;

              default:
                setState(() {
                  isConnectedToInternet = false;
                });
                break;
            }
          },
        );
        widget.refreshNotifier.addListener(() async {
          if (widget.refreshNotifier.value) {
            loadingController.changeLoad();
            await homePageController.fetchFavouriteProductList();
            loadingController.changeLoad();
            widget.refreshNotifier.value = false; // Reset notifier
          }
        });
        loadingController.changeLoad();
        await homePageController.fetchFavouriteProductList();
        await homePageController.fetchTotalBalance();
        DbHelper dbHelper = DbHelper();
        await dbHelper.fetchTotalBalanceData();
        Provider.of<HomePageController>(context, listen: false)
            .convertUiDateToYyyyMmDd(allDatesFromToday[0]);
        loadingController.changeLoad();
      },
    );
    printDate();
    pageList = List.generate(
      AppLists().imagePathList.length,
      (index) {
        return ImagePlaceHolder(
          imagePath: AppLists().imagePathList[index],
        );
      },
    );
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("WIDGET BUILD....");
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    homePageController = Provider.of<HomePageController>(context);
    loadingController = Provider.of<LoadingController>(context);

    if (loadingController.isLoading) {
      return NetworkChecker(
        child: SafeArea(
            child: Scaffold(
          backgroundColor: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          body: Center(
            child: CircularProgressIndicator(
              color: HexColor(AppColorsLight.orangeColor),
            ),
          ),
        )),
      );
    } else {
      return NetworkChecker(
        child: Scaffold(
          // bottomNavigationBar: CustomNavigationBar(),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: themeController.isLight
                  ? HexColor(AppColorsLight.backgroundColor)
                  : HexColor(AppColorsDark.backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.030,
                  ),
                  _buildHeaderRowOfLogoAndBalance(),
                  _buildSearchBarHomeScreen(),
                  _buildPaymentOptionRow(),
                  _buildProductTable(),
                  _buildPageView(),
                  _buildPageViewCircleAvatar(),
                  _buildCategoriesTitle(),
                  _buildCategoriesGridView(),
                  _buildFavouriteProductsTitle(),
                  _buildFavouriteProductList()
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildHeaderRowOfLogoAndBalance() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.010, left: width * 0.030),
          height: height * 0.120,
          width: width * 0.300,
          // color: Colors.red,
          child: Image.asset(
            // color: Colors.blue,
            themeController.isLight
                ? "assets/images/Auth/Auth_light_image/Milkyway Logo Png file 1.png"
                : "assets/images/Home/home_dark_theme/Milkyway Logo Png file 2.png",
            fit: BoxFit.contain,
            // frit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: width * 0.300,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return WalletPage(
                  isBottomBar: false,
                );
              },
            ));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            height: height * 0.060,
            width: width * 0.300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: HexColor(AppColorsLight.orangeColor),
                    blurRadius: 5,
                    spreadRadius: 1)
              ],
              color: HexColor(AppColorsLight.orangeColor),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.balanceHomePage,
                  style: TextStyle(
                      fontSize: 15, color: HexColor(AppColorsDark.whiteColor)),
                ),
                Text("${homePageController.totalAmount}0",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: HexColor(AppColorsDark.whiteColor))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBarHomeScreen() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: width * 0.040,
        ),
        Expanded(
          child: Container(
            height: height * 0.060,
            width: width * 200,
            decoration: BoxDecoration(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.lightGreyColor
                    : AppColorsDark.darkGreyColor),
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextFormField(
                    showCursor: false,
                    keyboardType: TextInputType.none,
                    onTap: () async {
                      Provider.of<HomePageController>(context, listen: false)
                          .setDefault();
                      refresh = await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SearchScreen();
                        },
                      ));

                      if (refresh == "searchScreen") {
                        loadingController.changeLoad();
                        await homePageController.fetchFavouriteProductList();
                        await homePageController.fetchTotalBalance();
                        loadingController.changeLoad();
                        setState(() {});
                      }
                    },
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 18,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor)),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                )),
                Container(
                  height: height * 0.100,
                  width: width * 0.150,
                  decoration: BoxDecoration(
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.search,
                      size: 35,
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: width * 0.025,
        ),
        SizedBox(
          height: height * 0.060,
          width: width * 0.120,
          // color: Colors.blue,
          child: Icon(Icons.notifications_none_outlined,
              size: 35,
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor)),
        ),
        SizedBox(
          width: width * 0.015,
        ),
        SizedBox(
          height: height * 0.060,
          width: width * 0.120,
          // color: Colors.yellow,
          child: Icon(Icons.shopping_bag_outlined,
              size: 35,
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor)),
        ),
        SizedBox(
          width: width * 0.020,
        )
      ],
    );
  }

  Widget _buildBillOptionsContainer(
      {String? name, String? image, void Function()? onTap}) {
    return Expanded(
        child: SizedBox(
      height: height * 0.100,
      // color: Colors.red,
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height * 0.055,
            width: width * 0.310,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: HexColor(AppColorsLight.silverColor)
                          .withOpacity(0.25),
                      blurRadius: 5.0,
                      spreadRadius: 1.0)
                ],
                color: HexColor(themeController.isLight
                    ? AppColorsLight.lightGreyColor
                    : AppColorsDark.darkGreyColor),
                borderRadius: BorderRadius.circular(35)),
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.020,
                  ),
                  SizedBox(
                    height: height * 0.035,
                    width: width * 0.075,
                    // color: Colors.red,
                    child: Image.asset(
                      image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.180,
                    // color: Colors.red,
                    child: Center(
                      child: Text(
                        name!,
                        style: TextStyle(
                            fontSize: 15,
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildPaymentOptionRow() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: width * 0.030,
        ),
        _buildBillOptionsContainer(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BillPayScreen();
                },
              ));
            },
            name: "Bill Pay",
            image: themeController.isLight
                ? "assets/images/Home/home_light_theme/Group.jpg"
                : "assets/images/Home/home_dark_theme/Layer_2.png"),
        SizedBox(
          width: width * 0.030,
        ),
        _buildBillOptionsContainer(
            onTap: () {
              Provider.of<HomePageController>(context, listen: false)
                  .setDefault();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OffersPage(
                      amount: "",
                    ),
                  ));
            },
            image: themeController.isLight
                ? "assets/images/Home/home_light_theme/Glyph.png"
                : "assets/images/Home/home_dark_theme/Glyph.png",
            name: "Offers"),
        SizedBox(
          width: width * 0.030,
        ),
        _buildBillOptionsContainer(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PayNowPage(),
                  ));
            },
            name: "Pay Now",
            image: themeController.isLight
                ? "assets/images/Home/home_light_theme/4308251_charity_currency_dollar_hand_money_icon 1.png"
                : "assets/images/Home/home_dark_theme/4308251_charity_currency_dollar_hand_money_icon 1.png"),
        SizedBox(
          width: width * 0.050,
        ),
      ],
    );
  }

  Widget _buildDateSelectRow() {
    return Expanded(
      child: Consumer<HomePageController>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: allDatesFromToday.length,
            // scrollDirection: Axis.vertical,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String month = allDatesFromToday[index].substring(0, 3);
              String day = allDatesFromToday[index].substring(4, 7);
              if (allDatesFromToday[index].codeUnitAt(8) == 0) {
                date = allDatesFromToday[index].substring(9, 10);
              } else {
                date = allDatesFromToday[index].substring(8, 10);
              }

              return InkWell(
                onTap: () {
                  print(allDatesFromToday[index]);
                  value.changeIndex(index: index);

                  value.convertUiDateToYyyyMmDd(allDatesFromToday[index]);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  height: height * 0.030,
                  width: width * 0.170,
                  decoration: BoxDecoration(
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.lightGreyColor
                          : AppColorsDark.darkGreyColor),
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        month,
                        style: TextStyle(
                            fontSize: 15,
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          day,
                          style: TextStyle(
                              fontSize: 15,
                              color: HexColor(themeController.isLight
                                  ? AppColorsLight.darkBlueColor
                                  : AppColorsDark.whiteColor)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        height: height * 0.035,
                        width: width * 0.070,
                        decoration: BoxDecoration(
                            color: index == value.selectedIndex
                                ? HexColor(AppColorsLight.orangeColor)
                                : themeController.isLight
                                    ? Colors.white
                                    : HexColor(AppColorsDark.darkGreyColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            date!,
                            style: TextStyle(
                                color: index == value.selectedIndex
                                    ? Colors.white
                                    : themeController.isLight
                                        ? Colors.black
                                        : HexColor(AppColorsDark.whiteColor),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
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

  Widget _buildTableHeaderRow() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: width * 0.050,
        ),
        Text(
          AppStrings.serialNo,
          style: TextStyle(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.lightDarkColor
                  : AppColorsDark.whiteColor)),
        ),
        SizedBox(
          width: width * 0.070,
        ),
        Text(
          AppStrings.productName,
          style: TextStyle(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.lightDarkColor
                  : AppColorsDark.whiteColor)),
        ),
        SizedBox(
          width: width * 0.200,
        ),
        Text(
          AppStrings.liter,
          style: TextStyle(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.lightDarkColor
                  : AppColorsDark.whiteColor)),
        ),
        SizedBox(
          width: width * 0.060,
        ),
        Text(
          AppStrings.kg,
          style: TextStyle(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.lightDarkColor
                  : AppColorsDark.whiteColor)),
        ),
        SizedBox(
          width: width * 0.060,
        ),
        Text(
          AppStrings.gm,
          style: TextStyle(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.lightDarkColor
                  : AppColorsDark.whiteColor)),
        )
      ],
    );
  }

  Widget _buildTableRow(
      {required String srNo,
      required String productName,
      String? liter,
      String? kg,
      String? gm}) {
    return Row(
      children: [
        SizedBox(
          height: height * 0.030,
          width: width * 0.180,
          // color: Colors.black,
          child: Center(
            child: Text(
              srNo,
              style: TextStyle(
                  fontSize: 15,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.lightDarkColor
                      : AppColorsDark.whiteColor)),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: width * 0.035),
          height: height * 0.030,
          width: width * 0.450,
          // color: Colors.blue,
          child: Text(
            productName,
            style: TextStyle(
                fontSize: 15,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.lightDarkColor
                    : AppColorsDark.whiteColor)),
          ),
        ),
        SizedBox(
          height: height * 0.030,
          width: width * 0.120,
          // color: Colors.black,
          child: Center(
            child: Text(
              liter ?? "",
              style: TextStyle(
                  fontSize: 15,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.lightDarkColor
                      : AppColorsDark.whiteColor)),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.030,
          width: width * 0.120,
          child: Center(
            child: Text(
              kg ?? "",
              style: TextStyle(
                  fontSize: 15,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.lightDarkColor
                      : AppColorsDark.whiteColor)),
            ),
          ),
          // color: Colors.red,
        ),
        SizedBox(
          height: height * 0.030,
          width: width * 0.120,
          // color: Colors.black,
          child: Center(
            child: Text(
              gm ?? "",
              style: TextStyle(
                  fontSize: 15,
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.lightDarkColor
                      : AppColorsDark.whiteColor)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return Consumer(
      builder: (context, value, child) {
        return SizedBox(
          height: height * 0.250,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              Provider.of<HomePageController>(context, listen: false)
                  .changePage(index: value);
              // activePage = value;
              // setState(() {});
            },
            itemCount: pageList.length,
            itemBuilder: (context, index) {
              return pageList[index];
            },
          ),
        );
      },
    );
  }

  Widget _buildPageViewCircleAvatar() {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.470,
        top: height * 0.010,
      ),
      child: Container(
        color: Colors.transparent,
        child: Row(
            children: List.generate(
          pageList.length,
          (index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Consumer<HomePageController>(
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        _pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: value.activePage == index
                            ? HexColor(AppColorsLight.orangeColor)
                            : HexColor(AppColorsLight.greyColor),
                      ),
                    );
                  },
                ));
          },
        )),
      ),
    );
  }

  Widget _buildProductTable() {
    return Container(
      margin: const EdgeInsets.only(left: 1),
      height: height * 0.350,
      width: double.infinity,
      // color: Colors.blue,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateSelectRow(),
          SizedBox(
            height: height * 0.010,
          ),
          Consumer<HomePageController>(
            builder: (context, value, child) {
              return Container(
                height: height * 0.210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.lightGreyColor
                      : AppColorsDark.darkGreyColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildTableHeaderRow(),
                      Divider(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.greyColor
                            : "#464646"),
                        thickness: 0.5,
                      ),
                      Container(
                        // alignment: Alignment.topCenter,
                        height: height * 0.130,
                        width: double.infinity,
                        // color: Colors.blue,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: value.dateWiseProductList.isEmpty
                              ? 0
                              : value.dateWiseProductList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: height * 0.002),
                              child: Container(
                                height: height * 0.025,
                                width: double.infinity,
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(right: width * 0.020),
                                      height: height * 0.025,
                                      width: width * 0.220,
                                      // color: Colors.green,
                                      child: Center(
                                          child: Text((index + 1).toString())),
                                    ),
                                    Container(
                                      height: height * 0.025,
                                      width: width * 0.420,
                                      // color: Colors.black,
                                      child: Text(value
                                          .dateWiseProductList[index].name),
                                    ),
                                    Container(
                                      height: height * 0.025,
                                      width: width * 0.115,
                                      // color: Colors.red,
                                      child: Center(
                                        child: Text(value
                                                    .dateWiseProductList[index]
                                                    .weightUnit ==
                                                "litre"
                                            ? value.dateWiseProductList[index]
                                                .weightUnit
                                            : ""),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.025,
                                      width: width * 0.115,
                                      // color: Colors.green,
                                      child: Center(
                                        child: Text(value
                                                    .dateWiseProductList[index]
                                                    .weightUnit ==
                                                "kg"
                                            ? value.dateWiseProductList[index]
                                                .weightUnit
                                            : ""),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.025,
                                      width: width * 0.120,
                                      // color: Colors.pink,
                                      child: Center(
                                        child: Text(value
                                                    .dateWiseProductList[index]
                                                    .weightUnit ==
                                                "gm"
                                            ? value.dateWiseProductList[index]
                                                .weightUnit
                                            : ""),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: height * 0.015,
          )
        ],
      ),
    );
  }

  Widget _buildCategoriesGridView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.320,
        // color: Colors.pink,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppLists().categoriesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            String image = AppLists().categoriesList[index].image;
            String title = AppLists().categoriesList[index].title;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    Provider.of<HomePageController>(context, listen: false)
                        .setDefault();
                    refresh = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeCategoryScreen(pageTitle: title),
                        ));

                    if (refresh == "homeCategoryScreen") {
                      loadingController.changeLoad();
                      await homePageController.fetchFavouriteProductList();
                      loadingController.changeLoad();

                      setState(() {});
                    }
                  },
                  child: Container(
                    height: height * 0.105,
                    width: width * 0.210,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                    // color: Colors.red,
                    padding: const EdgeInsets.all(1.0),
                    // alignment: Alignment.center,
                    // color: Colors.red,
                    child: Center(
                        child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor),
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ))),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoriesTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Text(
        AppStrings.categories,
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFavouriteProductsTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.5),
      child: Text(
        AppStrings.favouriteProducts,
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFavouriteProductList() {
    if (homePageController.favouriteProductList.isEmpty) {
      return SizedBox(
          height: height * 0.050,
          width: double.infinity,
          child: const Center(
              child: Text(
            "NO PRODUCTS ARE IN FAVOURITE LIST...",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          )));
    } else {
      return SizedBox(
        // color: Colors.red,
        height: homePageController.favouriteProductList.length * height * 0.180,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homePageController.favouriteProductList.length,
          itemBuilder: (context, index) {
            String? image =
                homePageController.favouriteProductList[index].image;
            String? name = homePageController.favouriteProductList[index].name;
            String? weight =
                homePageController.favouriteProductList[index].weight;
            String? price =
                homePageController.favouriteProductList[index].price;
            bool? isDaily =
                homePageController.favouriteProductList[index].isDaily == 1
                    ? true
                    : false;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: InkWell(
                onTap: () async {
                  refresh = await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ProductPage(
                          productModel:
                              homePageController.favouriteProductList[index]);
                    },
                  ));

                  if (refresh != null) {
                    loadingController.changeLoad();
                    await homePageController.fetchFavouriteProductList();
                    loadingController.changeLoad();
                    setState(() {});
                  }
                },
                child: Container(
                  height: height * 0.170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.backgroundColor
                          : "#000000"),
                      boxShadow: [
                        if (themeController.isLight)
                          const BoxShadow(
                              color: Colors.grey,
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
                            image!,
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
                                margin: EdgeInsets.only(left: width * 0.030),
                                height: height * 0.025,
                                width: width * 0.540,
                                // color: Colors.grey,
                                child: Text(
                                  name!,
                                  style: TextStyle(
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: width * 0.030),
                                height: height * 0.030,
                                width: width * 0.070,
                                // color: Colors.grey,
                                child: InkWell(
                                  onTap: () async {
                                    await updateData(index);
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: width * 0.030),
                            height: height * 0.025,
                            width: width * 0.300,
                            // color: Colors.grey,
                            child: Text(
                              weight!,
                              style: TextStyle(
                                  color: HexColor(themeController.isLight
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
                                    top: height * 0.005, left: width * 0.030),
                                height: height * 0.025,
                                width: width * 0.120,
                                // color: Colors.grey,
                                child: Text(
                                  "MRP.",
                                  style: TextStyle(
                                      color:
                                          HexColor(AppColorsLight.silverColor),
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
                                  price!,
                                  style: TextStyle(
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          isDaily
                              ? Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await addToCart(index: index);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: width * 0.030,
                                            top: height * 0.015),
                                        height: height * 0.040,
                                        width: width * 0.200,
                                        decoration: BoxDecoration(
                                            color: HexColor(
                                                AppColorsLight.orangeColor),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: HexColor(AppColorsLight
                                                      .orangeColor),
                                                  blurRadius: 5,
                                                  spreadRadius: 0.5)
                                            ]),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17),
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: width * 0.030,
                                          top: height * 0.015),
                                      height: height * 0.040,
                                      width: width * 0.200,
                                      decoration: BoxDecoration(
                                          color: HexColor(themeController
                                                  .isLight
                                              ? AppColorsLight.lightGreyColor
                                              : AppColorsDark.backgroundColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: themeController.isLight
                                                    ? HexColor(AppColorsLight
                                                            .greyColor)
                                                        .withOpacity(0.5)
                                                    : Colors.black,
                                                blurRadius: 5,
                                                offset: const Offset(0, 4),
                                                spreadRadius: 0.2)
                                          ]),
                                      child: Center(
                                        child: Text(
                                          "Daily",
                                          style: TextStyle(
                                              color: HexColor(themeController
                                                      .isLight
                                                  ? AppColorsLight.darkBlueColor
                                                  : AppColorsDark.whiteColor),
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : InkWell(
                                  onTap: () async {
                                    await addToCart(index: index);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: width * 0.030,
                                        top: height * 0.015),
                                    height: height * 0.040,
                                    width: width * 0.200,
                                    decoration: BoxDecoration(
                                        color: HexColor(
                                            AppColorsLight.orangeColor),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: HexColor(
                                                  AppColorsLight.orangeColor),
                                              blurRadius: 5,
                                              spreadRadius: 0.5)
                                        ]),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Add",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}
