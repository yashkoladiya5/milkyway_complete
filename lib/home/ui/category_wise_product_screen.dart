import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/home/model/product_model.dart';
import 'package:milkyway/home/ui/product_page.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';

class CategoryWiseProductScreen extends StatefulWidget {
  final String pageTitle;
  final List<ProductModel> productList;
  const CategoryWiseProductScreen(
      {super.key, required this.productList, required this.pageTitle});

  @override
  State<CategoryWiseProductScreen> createState() =>
      _CategoryWiseProductScreenState();
}

class _CategoryWiseProductScreenState extends State<CategoryWiseProductScreen> {
  late double height;
  late double width;
  late ThemeController themeController;
  @override
  Widget build(BuildContext context) {
    print(widget.productList.length);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    return NetworkChecker(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: HexColor(AppColorsLight.backgroundColor),
            child: Column(
              children: [
                _buildHeaderContainer(),
                Container(
                  height: height * 0.830,
                  width: double.infinity,
                  // color: Colors.blue,
                  child: ListView.builder(
                    itemCount: widget.productList.length,
                    itemBuilder: (context, index) {
                      String? name = widget.productList[index].name;
                      String? image = widget.productList[index].image;
                      String? weight = widget.productList[index].weight;
                      String? price = widget.productList[index].price;
                      bool? isDaily =
                          widget.productList[index].isDaily == 1 ? true : false;
                      bool? isFavourite =
                          widget.productList[index].isFavourite == 1
                              ? true
                              : false;
                      if (isDaily == true) {
                        print("isDaily-true");

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(
                                builder: (context) {
                                  return ProductPage(
                                      productModel: widget.productList[index]);
                                },
                              ));
                            },
                            child: Container(
                              height: height * 0.170,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: HexColor(themeController.isLight
                                      ? AppColorsLight.backgroundColor
                                      : AppColorsLight.darkBlueColor),
                                  boxShadow: [
                                    if (themeController.isLight)
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          spreadRadius: 0.5)
                                    else
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          spreadRadius: 0.5)
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: width * 0.030),
                                    height: height * 0.140,
                                    width: width * 0.280,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: width * 0.030),
                                            height: height * 0.025,
                                            width: width * 0.540,
                                            // color: Colors.grey,
                                            child: Text(
                                              name!,
                                              style: TextStyle(
                                                  color: HexColor(
                                                      themeController.isLight
                                                          ? AppColorsLight
                                                              .darkBlueColor
                                                          : AppColorsDark
                                                              .whiteColor),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: width * 0.030),
                                            height: height * 0.030,
                                            width: width * 0.070,
                                            // color: Colors.grey,
                                            child: Icon(
                                              Icons.favorite,
                                              color: isFavourite == true
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: width * 0.030),
                                        height: height * 0.025,
                                        width: width * 0.300,
                                        // color: Colors.grey,
                                        child: Text(
                                          weight!,
                                          style: TextStyle(
                                              color: HexColor(themeController
                                                      .isLight
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
                                                top: height * 0.005,
                                                left: width * 0.030),
                                            height: height * 0.025,
                                            width: width * 0.120,
                                            // color: Colors.grey,
                                            child: Text(
                                              "MRP.",
                                              style: TextStyle(
                                                  color: HexColor(AppColorsLight
                                                      .silverColor),
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
                                                  color: HexColor(AppColorsLight
                                                      .darkBlueColor),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
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
                                                      color: HexColor(
                                                              AppColorsLight
                                                                  .greyColor)
                                                          .withOpacity(0.5),
                                                      blurRadius: 5,
                                                      offset: Offset(0, 4),
                                                      spreadRadius: 0.2)
                                                ]),
                                            child: Center(
                                              child: Text(
                                                "Daily",
                                                style: TextStyle(
                                                    color: HexColor(
                                                        AppColorsLight
                                                            .darkBlueColor),
                                                    fontSize: 17),
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
                                            child: Row(
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
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(
                                builder: (context) {
                                  return ProductPage(
                                      productModel: widget.productList[index]);
                                },
                              ));
                            },
                            child: Container(
                              height: height * 0.170,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: HexColor(themeController.isLight
                                      ? AppColorsLight.backgroundColor
                                      : AppColorsLight.darkBlueColor),
                                  boxShadow: [
                                    if (themeController.isLight)
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          spreadRadius: 0.5)
                                    else
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          spreadRadius: 0.5)
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: width * 0.030),
                                    height: height * 0.140,
                                    width: width * 0.280,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: width * 0.030),
                                            height: height * 0.025,
                                            width: width * 0.540,
                                            // color: Colors.grey,
                                            child: Text(
                                              name!,
                                              style: TextStyle(
                                                  color: HexColor(
                                                      themeController.isLight
                                                          ? AppColorsLight
                                                              .darkBlueColor
                                                          : AppColorsDark
                                                              .whiteColor),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: width * 0.030),
                                            height: height * 0.030,
                                            width: width * 0.070,
                                            // color: Colors.grey,
                                            child: Icon(
                                              Icons.favorite,
                                              color: isFavourite == true
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: width * 0.030),
                                        height: height * 0.025,
                                        width: width * 0.300,
                                        // color: Colors.grey,
                                        child: Text(
                                          weight!,
                                          style: TextStyle(
                                              color: HexColor(themeController
                                                      .isLight
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
                                                top: height * 0.005,
                                                left: width * 0.030),
                                            height: height * 0.025,
                                            width: width * 0.120,
                                            // color: Colors.grey,
                                            child: Text(
                                              "MRP.",
                                              style: TextStyle(
                                                  color: HexColor(AppColorsLight
                                                      .silverColor),
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
                                                  color: HexColor(AppColorsLight
                                                      .darkBlueColor),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
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
                                        child: Row(
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
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderContainer() {
    return Container(
      padding: EdgeInsets.only(top: height * 0.020),
      height: height * 0.130,
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
          Container(
            height: height * 0.050,
            width: width * 0.700,
            // color: Colors.red,
            child: Center(
                child: Text(
              widget.pageTitle,
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
}
