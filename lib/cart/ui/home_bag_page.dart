import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/cart/provider/home_bag_screen_controller.dart';
import 'package:milkyway/cart/ui/location_page.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';

import 'package:milkyway/home/ui/product_page.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';

class HomeBagPage extends StatefulWidget {
  const HomeBagPage({super.key});

  @override
  State<HomeBagPage> createState() => _HomeBagPageState();
}

class _HomeBagPageState extends State<HomeBagPage> {
  late double height;
  late double width;
  late ThemeController themeController;

  late HomeBagScreenController homeBagScreenController;
  late CartItemListController cartItemListController;
  late QuantityListController quantityListController;
  late FavouriteListController favouriteListController;
  late RelatedProductListController relatedProductListController;
  late DailyProductListController dailyProductListController;

  fetchData() async {
    await cartItemListController.fetchData();
  }

  updateQuantity({required int index, bool? isIncrement}) async {
    int quantity;
    if (isIncrement!) {
      quantity =
          int.parse(cartItemListController.cartItemList[index].quantity!) + 1;
    } else {
      quantity =
          int.parse(cartItemListController.cartItemList[index].quantity!);
      if (quantity > 0) {
        quantity =
            int.parse(cartItemListController.cartItemList[index].quantity!) - 1;
      }
    }
    cartItemListController.cartItemList[index].quantity = quantity.toString();
    quantityListController.updateQuantityList(
      list: cartItemListController.cartItemList,
      index: index,
      value: quantity.toString(),
    );
    await DbHelper().updateProduct(
        cartItemListController.cartItemList[index].id!,
        cartItemListController.cartItemList[index].toJson());

    if (cartItemListController.cartItemList[index].quantity == '0') {
      await relatedProductListController.defaultQuantityOfRemovedProduct(
          id: cartItemListController.cartItemList[index].id!);
      await dailyProductListController.deleteFromProductList(
          id: cartItemListController.cartItemList[index].id!);
      await cartItemListController.deleteProductFromCart(index);
      await favouriteListController.deleteFavouriteProduct(index);
      await quantityListController.deleteQuantityProduct(
          index, cartItemListController.cartItemList);
    }
    print("DATABASE UPDATED");

    // await cartItemListController.fetchData();
  }

  updateFavouriteProduct({required int index}) async {
    cartItemListController.cartItemList[index].isFavourite =
        cartItemListController.cartItemList[index].isFavourite == 0 ? 1 : 0;

    await DbHelper().updateProduct(
        cartItemListController.cartItemList[index].id!,
        cartItemListController.cartItemList[index].toJson());
    await favouriteListController.updateFavouriteList(
        index: index,
        value: cartItemListController.cartItemList[index].isFavourite!);

    print("FAVOURITE LIST UPDATED");
  }

  deleteProduct(int index) async {
    cartItemListController.cartItemList[index].quantity = '0';
    await DbHelper().updateProduct(
        cartItemListController.cartItemList[index].id!,
        cartItemListController.cartItemList[index].toJson());
    await cartItemListController.deleteProductFromCart(index);
    await favouriteListController.deleteFavouriteProduct(index);
    await quantityListController.deleteQuantityProduct(
        index, cartItemListController.cartItemList);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        homeBagScreenController.changeLoading();
        await fetchData();
        await quantityListController
            .defaultQuantityList(cartItemListController.cartItemList);
        await favouriteListController
            .defaultFavouriteList(cartItemListController.cartItemList);
        await relatedProductListController.defaultRelatedProductList();
        // await loadRelatedProductList();
        homeBagScreenController.changeLoading();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    homeBagScreenController = Provider.of<HomeBagScreenController>(context);
    themeController = Provider.of<ThemeController>(context);
    cartItemListController =
        Provider.of<CartItemListController>(context, listen: false);
    quantityListController =
        Provider.of<QuantityListController>(context, listen: false);
    favouriteListController =
        Provider.of<FavouriteListController>(context, listen: false);
    relatedProductListController =
        Provider.of<RelatedProductListController>(context, listen: false);
    dailyProductListController =
        Provider.of<DailyProductListController>(context, listen: false);

    if (homeBagScreenController.isLoading &&
        relatedProductListController.relatedProductList.isEmpty) {
      return NetworkChecker(
        child: Scaffold(
          backgroundColor: HexColor(AppColorsLight.backgroundColor),
          body: Center(
            child: CircularProgressIndicator(
              color: HexColor(AppColorsLight.orangeColor),
            ),
          ),
        ),
      );
    } else {
      return NetworkChecker(
        child: Scaffold(
          backgroundColor: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderContainer(),
                _buildCartItemsList(),
                Builder(builder: (context) {
                  return _buildHeading(
                      text: (AppStrings.productYouMightLike).tr());
                }),
                _buildRelatedProductsList(),
                Builder(builder: (context) {
                  return _buildHeading(text: (AppStrings.paymentDetails).tr());
                }),
                _buildBagTotalContainer(),
                _buildPlaceOrderButton(),
                SizedBox(
                  height: height * 0.050,
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildHeaderContainer() {
    return Container(
      padding: EdgeInsets.only(
        top: height * 0.050,
      ),
      height: height * 0.170,
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
                Navigator.pop(context, "HomeScreen");
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
              )),
          Container(
            height: height * 0.050,
            width: width * 0.700,
            // color: Colors.red,
            child: Center(child: Builder(builder: (context) {
              return Text(
                (AppStrings.bag).tr(),
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

  Widget _buildCartItemsList() {
    return Consumer<CartItemListController>(
      builder: (context, cartItemListController, child) {
        return Container(
          height: cartItemListController.cartItemList.length * height * 0.165,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartItemListController.cartItemList.length,
            itemBuilder: (context, index) {
              String image = cartItemListController.cartItemList[index].image!;
              String name = cartItemListController.cartItemList[index].name!;
              String weight =
                  cartItemListController.cartItemList[index].weight!;
              String price = cartItemListController.cartItemList[index].price!;
              bool isDaily =
                  cartItemListController.cartItemList[index].isDaily == 1
                      ? true
                      : false;

              print("LIST BUILD");
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: InkWell(
                  onTap: () async {
                    String refresh;
                    refresh = await Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductPage(
                            previousPageId: cartItemListController
                                .cartItemList[index].id
                                .toString(),
                            productModel:
                                cartItemListController.cartItemList[index]);
                      },
                    ));
                    print("REFRESH : $refresh");
                    if (refresh ==
                        "productPage ${cartItemListController.cartItemList[index].id}") {
                      await cartItemListController.fetchData();
                      await quantityListController.defaultQuantityList(
                          cartItemListController.cartItemList);
                      await favouriteListController.defaultFavouriteList(
                          cartItemListController.cartItemList);
                      await relatedProductListController
                          .defaultRelatedProductList();
                    } else {
                      print("WRONG");
                    }
                  },
                  child: Container(
                    height: height * 0.150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.backgroundColor
                            : AppColorsDark.darkGreyColor),
                        boxShadow: [
                          BoxShadow(
                              color: HexColor(themeController.isLight
                                      ? AppColorsLight.greyColor
                                      : AppColorsDark.backgroundColor)
                                  .withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 0.5)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: width * 0.020),
                          height: height * 0.130,
                          width: width * 0.260,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(25)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.015, left: width * 0.030),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * 0.400,
                                // color: Colors.red,
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor),
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                width: width * 0.400,
                                // color: Colors.red,
                                child: Text(
                                  weight,
                                  style: TextStyle(
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor),
                                      fontSize: 14),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "MRP.",
                                    style: TextStyle(
                                        color:
                                            HexColor(AppColorsLight.greyColor),
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: width * 0.320,
                                    // color: Colors.red,
                                    child: Text(
                                      price,
                                      style: TextStyle(
                                          color: HexColor(
                                              themeController.isLight
                                                  ? AppColorsLight.darkBlueColor
                                                  : AppColorsDark.whiteColor),
                                          fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              isDaily
                                  ? Builder(builder: (context) {
                                      return Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              await dailyProductListController
                                                  .updateDailyProductList(
                                                      id: cartItemListController
                                                          .cartItemList[index]
                                                          .id!,
                                                      context: context);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: width * 0.020),
                                              height: height * 0.030,
                                              width: width * 0.150,
                                              decoration: BoxDecoration(
                                                  color: HexColor(
                                                      themeController.isLight
                                                          ? AppColorsLight
                                                              .lightGreyColor
                                                          : AppColorsDark
                                                              .darkGreyColor),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: themeController
                                                                .isLight
                                                            ? Colors.grey
                                                            : Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                        blurRadius: 8,
                                                        offset: Offset(0, 2),
                                                        spreadRadius: 0.5)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Text(
                                                  (AppStrings.daily).tr(),
                                                  style: TextStyle(
                                                    color: HexColor(
                                                        themeController.isLight
                                                            ? AppColorsLight
                                                                .darkBlueColor
                                                            : AppColorsDark
                                                                .whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.020,
                                          ),
                                          Container(
                                            height: height * 0.030,
                                            width: width * 0.060,
                                            decoration: BoxDecoration(
                                                color: HexColor(
                                                    themeController.isLight
                                                        ? AppColorsLight
                                                            .lightGreyColor
                                                        : AppColorsDark
                                                            .darkGreyColor),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () async {
                                                  await updateQuantity(
                                                      index: index,
                                                      isIncrement: false);
                                                },
                                                child: Text(
                                                  "-",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: HexColor(
                                                        themeController.isLight
                                                            ? AppColorsLight
                                                                .darkBlueColor
                                                            : AppColorsDark
                                                                .whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.015),
                                            child: Consumer<
                                                QuantityListController>(
                                              builder: (context, value, child) {
                                                return Text(
                                                  value.quantityList[index],
                                                  style: TextStyle(
                                                      color: HexColor(
                                                          themeController
                                                                  .isLight
                                                              ? AppColorsLight
                                                                  .darkBlueColor
                                                              : AppColorsDark
                                                                  .whiteColor),
                                                      fontSize: 15),
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: width * 0.010),
                                            height: height * 0.030,
                                            width: width * 0.060,
                                            decoration: BoxDecoration(
                                                color: HexColor(
                                                    themeController.isLight
                                                        ? AppColorsLight
                                                            .lightGreyColor
                                                        : AppColorsDark
                                                            .darkGreyColor),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () async {
                                                  await updateQuantity(
                                                      index: index,
                                                      isIncrement: true);
                                                },
                                                child: Text(
                                                  "+",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: HexColor(
                                                        themeController.isLight
                                                            ? AppColorsLight
                                                                .darkBlueColor
                                                            : AppColorsDark
                                                                .whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    })
                                  : Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.020,
                                        ),
                                        Container(
                                          height: height * 0.030,
                                          width: width * 0.060,
                                          decoration: BoxDecoration(
                                              color: HexColor(
                                                  themeController.isLight
                                                      ? AppColorsLight
                                                          .lightGreyColor
                                                      : AppColorsDark
                                                          .darkGreyColor),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () async {
                                                await updateQuantity(
                                                    index: index,
                                                    isIncrement: false);
                                              },
                                              child: Text(
                                                "-",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: HexColor(
                                                      themeController.isLight
                                                          ? AppColorsLight
                                                              .darkBlueColor
                                                          : AppColorsDark
                                                              .whiteColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.015),
                                          child:
                                              Consumer<QuantityListController>(
                                            builder: (context, value, child) {
                                              return Text(
                                                value.quantityList[index],
                                                style: TextStyle(
                                                    color: HexColor(
                                                        themeController.isLight
                                                            ? AppColorsLight
                                                                .darkBlueColor
                                                            : AppColorsDark
                                                                .whiteColor),
                                                    fontSize: 15),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.010),
                                          height: height * 0.030,
                                          width: width * 0.060,
                                          decoration: BoxDecoration(
                                              color: HexColor(
                                                  themeController.isLight
                                                      ? AppColorsLight
                                                          .lightGreyColor
                                                      : AppColorsDark
                                                          .darkGreyColor),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () async {
                                                await updateQuantity(
                                                    index: index,
                                                    isIncrement: true);
                                              },
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: HexColor(
                                                      themeController.isLight
                                                          ? AppColorsLight
                                                              .darkBlueColor
                                                          : AppColorsDark
                                                              .whiteColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.170,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.010),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await updateFavouriteProduct(index: index);
                                },
                                child: Consumer<FavouriteListController>(
                                  builder: (context, value, child) {
                                    return Icon(Icons.favorite,
                                        color: value.favouriteList[index] == 0
                                            ? HexColor(
                                                AppColorsLight.darkGreyColor)
                                            : Colors.red);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              InkWell(
                                onTap: () async {
                                  await deleteProduct(index);
                                },
                                child: Icon(
                                  Icons.delete_outline_rounded,
                                  color: HexColor(AppColorsLight.darkGreyColor),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildHeading({required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: height * 0.010, vertical: height * 0.020),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor),
            fontSize: 18),
      ),
    );
  }

  Widget _buildDailyButtonView(int index) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () async {
            await relatedProductListController.updateQuantity(
                index: index, context: context);
            await cartItemListController.fetchData();
            await favouriteListController
                .defaultFavouriteList(cartItemListController.cartItemList);
            await quantityListController
                .defaultQuantityList(cartItemListController.cartItemList);

            await dailyProductListController.updateDailyProductList(
                id: relatedProductListController.relatedProductList[index].id!,
                context: context);
          },
          child: Container(
            margin: EdgeInsets.only(
              top: height * 0.010,
            ),
            height: height * 0.030,
            width: width * 0.140,
            decoration: BoxDecoration(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.lightGreyColor
                    : AppColorsDark.darkGreyColor),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: HexColor(themeController.isLight
                              ? AppColorsLight.greyColor
                              : AppColorsDark.backgroundColor)
                          .withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 0.2)
                ]),
            child: Center(
              child: Builder(builder: (context) {
                return Text(
                  (AppStrings.daily).tr(),
                  style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                  ),
                );
              }),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await relatedProductListController.updateQuantity(
                index: index, context: context);
            await cartItemListController.fetchData();
            await favouriteListController
                .defaultFavouriteList(cartItemListController.cartItemList);
            await quantityListController
                .defaultQuantityList(cartItemListController.cartItemList);
          },
          child: Container(
            margin: EdgeInsets.only(top: height * 0.010, left: width * 0.015),
            height: height * 0.030,
            width: width * 0.140,
            decoration: BoxDecoration(
                color: HexColor(AppColorsLight.orangeColor),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: HexColor(AppColorsLight.orangeColor),
                      blurRadius: 2,
                      spreadRadius: 0.2)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  return Text(
                    (AppStrings.add).tr(),
                    style: TextStyle(color: Colors.white),
                  );
                }),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedProductsList() {
    return Container(
      margin: EdgeInsets.only(top: height * 0.010, bottom: height * 0.010),
      height: height * 0.620,
      // color: Colors.blue,
      child: Consumer<RelatedProductListController>(
        builder: (context, relatedProductListController, child) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            // shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: relatedProductListController.relatedProductList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.5,
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              if (relatedProductListController.relatedProductList.isEmpty) {
                return SizedBox();
              } else {
                String? image = relatedProductListController
                    .relatedProductList[index].image;
                String? name =
                    relatedProductListController.relatedProductList[index].name;

                String? weight = relatedProductListController
                    .relatedProductList[index].weight;
                String? price = relatedProductListController
                    .relatedProductList[index].price;
                bool isDaily = relatedProductListController
                            .relatedProductList[index].isDaily ==
                        1
                    ? true
                    : false;
                bool isFavourite = relatedProductListController
                            .relatedProductList[index].isFavourite! ==
                        0
                    ? true
                    : false;

                return Container(
                  height: height * 0.260,
                  width: width * 0.310,
                  decoration: BoxDecoration(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.backgroundColor
                        : AppColorsDark.backgroundColor),
                  ),
                  // color: Colors.red),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () async {
                              String refresh;
                              refresh = await Navigator.push(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return ProductPage(
                                      previousPageId:
                                          relatedProductListController
                                              .relatedProductList[index].id
                                              .toString(),
                                      productModel: relatedProductListController
                                          .relatedProductList[index]);
                                },
                              ));
                              print("REFRESH : $refresh");
                              if (refresh ==
                                  "productPage ${relatedProductListController.relatedProductList[index].id}") {
                                await cartItemListController.fetchData();
                                await quantityListController
                                    .defaultQuantityList(
                                        cartItemListController.cartItemList);
                                await favouriteListController
                                    .defaultFavouriteList(
                                        cartItemListController.cartItemList);
                                await relatedProductListController
                                    .defaultRelatedProductList();
                              } else {
                                print("WRONG");
                              }
                            },
                            child: Container(
                              height: height * 0.170,
                              width: width * 0.300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        image,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              height: height * 0.045,
                              width: width * 0.090,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        offset: Offset(3, 3),
                                        spreadRadius: 0.5)
                                  ],
                                  borderRadius: BorderRadius.circular(50)),
                              child: InkWell(
                                onTap: () async {
                                  await relatedProductListController
                                      .updateFavouriteProduct(index: index);
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: isFavourite ? Colors.grey : Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Expanded(
                        child: Container(
                          height: height * 0.100,
                          width: width * 0.300,
                          // color: Colors.grey,
                          child: Column(
                            children: [
                              Container(
                                width: width * 0.300,
                                height: height * 0.020,
                                // color: Colors.amber,
                                child: Center(
                                    child: Text(
                                  name!,
                                  style: TextStyle(
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor)),
                                )),
                              ),
                              Container(
                                width: width * 0.300,
                                height: height * 0.022,
                                // color: Colors.cyan,
                                child: Center(
                                    child: Text(
                                  weight!,
                                  style: TextStyle(
                                      color: HexColor(themeController.isLight
                                          ? AppColorsLight.darkBlueColor
                                          : AppColorsDark.whiteColor)),
                                )),
                              ),
                              Container(
                                width: width * 0.300,
                                height: height * 0.025,
                                // color: Colors.deepPurple,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "MRP. ",
                                      style: TextStyle(
                                          color: HexColor(
                                              AppColorsLight.greyColor)),
                                    ),
                                    Text(
                                      price!,
                                      style: TextStyle(
                                          color: HexColor(
                                              themeController.isLight
                                                  ? AppColorsLight.darkBlueColor
                                                  : AppColorsDark.whiteColor)),
                                    ),
                                  ],
                                ),
                              ),
                              isDaily
                                  ? _buildDailyButtonView(index)
                                  : InkWell(
                                      onTap: () async {
                                        await relatedProductListController
                                            .updateQuantity(
                                                index: index, context: context);
                                        await cartItemListController
                                            .fetchData();
                                        await favouriteListController
                                            .defaultFavouriteList(
                                                cartItemListController
                                                    .cartItemList);
                                        await quantityListController
                                            .defaultQuantityList(
                                                cartItemListController
                                                    .cartItemList);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: height * 0.010,
                                        ),
                                        height: height * 0.030,
                                        width: width * 0.140,
                                        decoration: BoxDecoration(
                                            color: HexColor(
                                                AppColorsLight.orangeColor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: HexColor(AppColorsLight
                                                      .orangeColor),
                                                  blurRadius: 2,
                                                  spreadRadius: 0.2)
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              (AppStrings.add).tr(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildPlaceOrderButton() {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.050),
      child: Center(
        child: Consumer<CartItemListController>(
          builder: (context, value, child) {
            return InkWell(
              onTap: () {
                if (value.cartItemList.isNotEmpty) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LocationPage(
                        dailyProducts:
                            dailyProductListController.dailyProductList,
                        bagTotal: quantityListController.bagTotal.toString(),
                      );
                    },
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(milliseconds: 1000),
                      content: Text("Please Add Any Item to Cart...")));
                }
              },
              child: Container(
                height: height * 0.060,
                width: width * 0.650,
                decoration: BoxDecoration(
                    color: HexColor(AppColorsLight.orangeColor),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      height: height * 0.040,
                      width: width * 0.280,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "data",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: height * 0.005, bottom: height * 0.005),
                      height: height * 0.060,
                      width: width * 0.003,
                      color: Colors.white,
                    ),
                    Container(
                      width: width * 0.350,
                      // color: Colors.red,
                      alignment: Alignment.center,
                      child: Builder(builder: (context) {
                        return Text(
                          (AppStrings.placeOrder).tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBagTotalContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: height * 0.010),
      height: height * 0.120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
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
              Builder(builder: (context) {
                return Text(
                  (AppStrings.bagTotal).tr(),
                  style: TextStyle(
                    fontSize: 15,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                  ),
                );
              }),
              SizedBox(
                width: context.locale.languageCode == 'hi' ||
                        context.locale.languageCode == 'gu'
                    ? width * 0.520
                    : context.locale.languageCode == 'mr'
                        ? width * 0.500
                        : width * 0.450,
              ),
              Container(
                width: width * 0.300,
                // color: Colors.red,
                child: Consumer<QuantityListController>(
                  builder: (context, quantityListController, child) {
                    return Text(
                      "₹ ${quantityListController.bagTotal.toString()}0",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Row(
            children: [
              Builder(builder: (context) {
                return Text(
                  (AppStrings.discount).tr(),
                  style: TextStyle(
                    fontSize: 15,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                  ),
                );
              }),
              SizedBox(
                  width: context.locale.languageCode == 'gu'
                      ? width * 0.500
                      : context.locale.languageCode == 'hi'
                          ? width * 0.595
                          : context.locale.languageCode == 'mr'
                              ? width * 0.595
                              : width * 0.470),
              Container(
                width: width * 0.300,
                // color: Colors.red,
                child: Text(
                  "₹00.00",
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
            color: HexColor(
                themeController.isLight ? AppColorsLight.greyColor : "#464646"),
          ),
          SizedBox(
            height: height * 0.009,
          ),
          Row(
            children: [
              Builder(builder: (context) {
                return Text(
                  (AppStrings.totalAmount).tr(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                  ),
                );
              }),
              SizedBox(
                width: context.locale.languageCode == 'gu'
                    ? width * 0.510
                    : context.locale.languageCode == 'hi'
                        ? width * 0.490
                        : context.locale.languageCode == 'mr'
                            ? width * 0.440
                            : width * 0.365,
              ),
              Container(
                width: width * 0.300,
                // color: Colors.red,
                child: Consumer<QuantityListController>(
                  builder: (context, quantityListController, child) {
                    return Text(
                      "₹ ${quantityListController.bagTotal.toString()}0",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
