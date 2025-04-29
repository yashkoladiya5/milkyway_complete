import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/cart/provider/home_bag_screen_controller.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/profile/provider/favourite_page_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_strings.dart';

import '../../home/ui/product_page.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late double height;
  late double width;
  late ThemeController themeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<FavouritePageController>(context, listen: false)
            .fetchFavouriteProducts();
        await Provider.of<RelatedProductListController>(context, listen: false)
            .defaultRelatedProductList();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderContainer(),
            _buildFavouriteProductList(),
            _buildTextHeading(),
            _buildRelatedProductsList()
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
            : AppColorsLight.darkBlueColor),
        boxShadow: [
          if (themeController.isLight)
            const BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 10)
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
            child: Center(child: Builder(builder: (context) {
              return Text(
                (AppStrings.favourite).tr(),
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

  Widget _buildFavouriteProductList() {
    return Consumer<FavouritePageController>(
      builder: (context, value, child) {
        return SizedBox(
          // color: Colors.black,
          height: value.favouriteList.isEmpty
              ? height * 0.120
              : value.favouriteList.length * height * 0.180,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                value.favouriteList.isEmpty ? 1 : value.favouriteList.length,
            itemBuilder: (context, index) {
              if (value.favouriteList.isEmpty) {
                return Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: height * 0.050),
                  child: const Text(
                    "No Data In Favourite Product List",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ));
              }

              String? image = value.favouriteList[index].image;
              String? name = value.favouriteList[index].name;
              String? weight = value.favouriteList[index].weight;
              String? price = value.favouriteList[index].price;
              bool? isDaily =
                  value.favouriteList[index].isDaily == 1 ? true : false;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductPage(
                            productModel: value.favouriteList[index]);
                      },
                    ));
                    //
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
                                      value.updateData(index, context);

                                      value
                                          .updateFavouriteAndRelatedProductList(
                                              context: context,
                                              index: index,
                                              id: value
                                                  .favouriteList[index].id!);
                                      // await updateData(index);
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
                                        color: HexColor(
                                            AppColorsLight.silverColor),
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
                                          await value.addToCart(
                                              index: index, context: context);
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
                                                    color: HexColor(
                                                        AppColorsLight
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
                                      InkWell(
                                        onTap: () async {
                                          Provider.of<DailyProductListController>(
                                                  context,
                                                  listen: false)
                                              .updateDailyProductList(
                                                  id: value
                                                      .favouriteList[index].id!,
                                                  context: context);

                                          await value.addToCart(
                                              index: index, context: context);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.030,
                                              top: height * 0.015),
                                          height: height * 0.040,
                                          width: width * 0.200,
                                          decoration: BoxDecoration(
                                              color: HexColor(
                                                  themeController.isLight
                                                      ? AppColorsLight
                                                          .lightGreyColor
                                                      : AppColorsDark
                                                          .backgroundColor),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: themeController
                                                            .isLight
                                                        ? HexColor(
                                                                AppColorsLight
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
                                                  color: HexColor(
                                                      themeController.isLight
                                                          ? AppColorsLight
                                                              .darkBlueColor
                                                          : AppColorsDark
                                                              .whiteColor),
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : InkWell(
                                    onTap: () async {
                                      await value.addToCart(
                                          index: index, context: context);
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
      },
    );
  }

  Widget _buildTextHeading() {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.040, top: height * 0.015),
      child: Builder(builder: (context) {
        return Text(
          (AppStrings.ourRecommendation).tr(),
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor)),
        );
      }),
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
            physics: const NeverScrollableScrollPhysics(),
            itemCount: relatedProductListController.relatedProductList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.5,
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              if (relatedProductListController.relatedProductList.isEmpty) {
                return const SizedBox();
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
                              await Navigator.push(context, MaterialPageRoute(
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
                                  : const SizedBox(),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              height: height * 0.035,
                              width: width * 0.080,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    const BoxShadow(
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

                                  await Provider.of<FavouritePageController>(
                                          context,
                                          listen: false)
                                      .fetchFavouriteProducts();
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
                                  ? _buildDailyButtonView(
                                      index, relatedProductListController)
                                  : InkWell(
                                      onTap: () async {
                                        relatedProductListController
                                            .updateQuantity(
                                                index: index, context: context);
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
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add",
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

  Widget _buildDailyButtonView(
      int index, RelatedProductListController relatedProductListController) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () async {
            relatedProductListController.updateQuantity(
                index: index, context: context);

            Provider.of<DailyProductListController>(context, listen: false)
                .updateDailyProductList(
                    id: relatedProductListController
                        .relatedProductList[index].id!,
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
              child: Text(
                "Daily",
                style: TextStyle(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            relatedProductListController.updateQuantity(
                index: index, context: context);
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
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
}
