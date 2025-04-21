import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_colors.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';
import 'package:milkyway/home/provider/home_page_controller.dart';
import 'package:milkyway/home/ui/category_wise_product_screen.dart';
import 'package:milkyway/home/ui/product_page.dart';
import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeCategoryScreen extends StatefulWidget {
  String pageTitle;
  HomeCategoryScreen({super.key, required this.pageTitle});

  @override
  State<HomeCategoryScreen> createState() => _HomeCategoryScreenState();
}

class _HomeCategoryScreenState extends State<HomeCategoryScreen> {
  late double height;
  late double width;
  List<Widget> imageList = [];
  final PageController pageController = PageController(initialPage: 0);

  late ThemeController themeController;
  List<ProductModel> productList = [];
  List<ProductModel> sortedList = [];

  List<ProductModel> categoryList = [];
  bool? isLoading = true;
  bool? hasNetwork;
  String? errorMessage;
  late LoadingController loadingController;
  String? refresh;


  Future updateUI() async {
    List<ProductModel> productData = [];
    productData = await DbHelper().readData();
    print(productData.length);
    sortedList = productData
        .where((element) => element.category == widget.pageTitle)
        .toList();
    print(sortedList[0].isFavourite);
  }

  Future fetchData() async {
    loadingController.changeLoad();
    List<ProductModel> productData = [];
    productData = await DbHelper().readData();
    print(productData.length);
    sortedList = productData
        .where((element) => element.category == widget.pageTitle)
        .toList();
    print(sortedList[0].id);

    loadingController.changeLoad();
  }

  updateFavouriteProduct(
      int id, Map<String, Object?> data, bool isAdded) async {
    await DbHelper().updateProduct(id, data);

    print("DATABASE UPDATED...");
    if (isAdded) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text("Product Added To Favourite List")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text("Product Removed From Favourite List")));
    }

    await updateUI();
    setState(() {});
  }

  Future<bool> hasConnectionCheck() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("isNetwork true");
      return true;
    } else {
      print("isNetwork false");
      return false;
    }
  }

  loadRelatedImages() {
    setState(() {
      imageList = List.generate(
        AppLists().imagePathList.length,
        (index) {
          if (sortedList.isEmpty) {
            return CircularProgressIndicator(
              color: HexColor(AppColorsLight.orangeColor),
            );
          } else {
            return ImagePlaceHolder(
              imagePath: sortedList[index].relatedImages[index],
            );
          }
        },
      );
    });
  }

  updateData(int index) async {
    sortedList[index].isFavourite = sortedList[index].isFavourite == 1 ? 0 : 1;

    Map<String, Object?> data = sortedList[index].toJson();

    if (sortedList[index].isFavourite == 1) {
      await updateFavouriteProduct(sortedList[index].id!, data, true);
    } else {
      await updateFavouriteProduct(sortedList[index].id!, data, false);
    }
  }

  addToCart({required int index}) async {
    int quantity = int.parse(sortedList[index].quantity ?? "0");

    if (quantity > 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product is Already in cart")));
    } else {
      sortedList[index].quantity = '1';
      await DbHelper()
          .updateProduct(sortedList[index].id!, sortedList[index].toJson());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Added To Cart")));
      print("DATABASE UPDATED");
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await fetchData();
      // await addData(sortedList[2]);

      loadRelatedImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    loadingController = Provider.of<LoadingController>(context);
    print("HOME CATEGORY SCREEN");
    if (loadingController.isLoading) {
      return NetworkChecker(
        child: Scaffold(
                  backgroundColor: HexColor(themeController.isLight
          ? AppColorsLight.backgroundColor
          : AppColorsLight.darkBlueColor),
                  body: Center(
        child: CircularProgressIndicator(
          color: HexColor(AppColorsLight.orangeColor),
        ),
                  ),
                ),
      );
    }

    if (errorMessage?.isNotEmpty ?? false) {
      return NetworkChecker(
        child: Scaffold(
                  backgroundColor: HexColor(themeController.isLight
          ? AppColorsLight.backgroundColor
          : AppColorsLight.darkBlueColor),
                  body: Center(
        child: Text(
          errorMessage!,
          style: const TextStyle(
              color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
        ),
                  ),
                ),
      );
    }
    return NetworkChecker(
      child: ChangeNotifierProvider(
        create: (context) => HomePageController(),
        child: Scaffold(
          backgroundColor: HexColor(AppColorsLight.backgroundColor),
                  body: SingleChildScrollView(
        child: Container(
          color: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsLight.darkBlueColor),
          child: Column(
            children: [
              _buildHeaderContainer(),
              _buildCustomGridView(),
              _buildPageViewOfRelatedImages(),
              _buildPageViewCircleAvatar(),
              _buildProductListView()
            ],
          ),
        ),
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
            const BoxShadow(  offset: Offset(0, 10),color: Colors.grey, spreadRadius: 0.5, blurRadius: 10)
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
                Navigator.pop(context, "homeCategoryScreen");
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

  Widget _buildCustomGridView() {
    return Container(
      margin: EdgeInsets.only(top: height * 0.020),
      // color: Colors.blue,
      height: height * 0.320,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sortedList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          if (sortedList.isEmpty) {
            return CircularProgressIndicator(
              color: HexColor(AppColorsLight.orangeColor),
            );
          } else {
            String? image = sortedList[index].image;
            String? text = sortedList[index].name;
            return InkWell(
              onTap: () async {
                categoryList = productList
                    .where(
                        (element) => element.category == sortedList[index].name)
                    .toList();

                if (categoryList.isNotEmpty) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CategoryWiseProductScreen(
                        pageTitle: text,
                        productList: categoryList,
                      );
                    },
                  ));
                } else {
                  refresh = await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ProductPage(
                        productModel: sortedList[index],
                      );
                    },
                  ));

                  if (refresh != null) {
                    await fetchData();
                    setState(() {});
                  }
                }
              },
              child: Column(
                children: [
                  Container(
                    height: height * 0.110,
                    width: width * 0.230,
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
                  SizedBox(
                      height: height * 0.030,
                      width: width * 0.220,
                      // color: Colors.pink,
                      child: Center(
                          child: Text(
                        text!,
                        style: TextStyle(
                          fontSize: 17,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor),
                        ),
                      )))
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildPageViewOfRelatedImages() {
    return Consumer<HomePageController>(
      builder: (context, value, child) {
        return SizedBox(
          height: height * 0.250,
          width: double.infinity,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (v) {
              value.changePage(index: v);
            },
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return imageList[index];
            },
          ),
        );
      },
    );
  }

  Widget _buildPageViewCircleAvatar() {
    return Container(
      color: Colors.transparent,
      child: Consumer<HomePageController>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imageList.length,
              (index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: value.activePage == index
                          ? HexColor(AppColorsLight.orangeColor)
                          : HexColor(AppColorsLight.greyColor),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductListView() {
    return SizedBox(
      height: height * 0.730,
      // color: Colors.blue,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sortedList.length,
        itemBuilder: (context, index) {
          String? image = sortedList[index].image;
          String? name = sortedList[index].name;
          String? weight = sortedList[index].weight;
          String? price = sortedList[index].price;
          bool? isFavourite = sortedList[index].isFavourite == 1 ? true : false;
          bool? isDaily = sortedList[index].isDaily == 1 ? true : false;

          if (isDaily) {
            print("isDaily-true");
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: InkWell(
                onTap: () async {
                  print("Listview ontap called");
                  categoryList = productList
                      .where((element) =>
                          element.category == sortedList[index].name)
                      .toList();

                  if (categoryList.isNotEmpty) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CategoryWiseProductScreen(
                          pageTitle: name,
                          productList: categoryList,
                        );
                      },
                    ));
                  } else {
                    refresh = await Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductPage(
                          productModel: sortedList[index],
                        );
                      },
                    ));

                    if (refresh != null) {
                      await fetchData();
                      setState(() {});
                    }
                  }
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
                          const BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 0.5)
                        else
                          const BoxShadow(
                              color: Colors.black,
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
                                  child: Icon(
                                    Icons.favorite,
                                    color: isFavourite == false
                                        ? Colors.grey
                                        : Colors.red,
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
                                      color: HexColor(
                                          AppColorsLight.darkBlueColor),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await addToCart(index: index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: width * 0.030, top: height * 0.015),
                                  height: height * 0.040,
                                  width: width * 0.200,
                                  decoration: BoxDecoration(
                                      color:
                                          HexColor(AppColorsLight.orangeColor),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: HexColor(
                                                AppColorsLight.orangeColor),
                                            blurRadius: 5,
                                            spreadRadius: 0.5)
                                      ]),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
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
                                    left: width * 0.030, top: height * 0.015),
                                height: height * 0.040,
                                width: width * 0.200,
                                decoration: BoxDecoration(
                                    color: HexColor(themeController.isLight
                                        ? AppColorsLight.lightGreyColor
                                        : AppColorsDark.backgroundColor),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: themeController.isLight
                                              ? HexColor(
                                                      AppColorsLight.greyColor)
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
                                        color: HexColor(themeController.isLight
                                            ? AppColorsLight.darkBlueColor
                                            : AppColorsDark.whiteColor),
                                        fontSize: 17),
                                  ),
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
                onTap: () async {
                  print("Listview ontap called");
                  categoryList = productList
                      .where((element) =>
                          element.category == sortedList[index].name)
                      .toList();

                  if (categoryList.isNotEmpty) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CategoryWiseProductScreen(
                          pageTitle: name,
                          productList: categoryList,
                        );
                      },
                    ));
                  } else {
                    refresh = await Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductPage(
                          productModel: sortedList[index],
                        );
                      },
                    ));

                    if (refresh != null) {
                      await fetchData();
                      setState(() {});
                    }
                  }
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
                          const BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 0.5)
                        else
                          const BoxShadow(
                              color: Colors.black,
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
                                  child: Icon(
                                    Icons.favorite,
                                    color: isFavourite == false
                                        ? Colors.grey
                                        : Colors.red,
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
                                      color: HexColor(
                                          AppColorsLight.darkBlueColor),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              await addToCart(index: index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.030, top: height * 0.015),
                              height: height * 0.040,
                              width: width * 0.200,
                              decoration: BoxDecoration(
                                  color: HexColor(AppColorsLight.orangeColor),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: HexColor(
                                            AppColorsLight.orangeColor),
                                        blurRadius: 5,
                                        spreadRadius: 0.5)
                                  ]),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
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
          }
        },
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  String? imagePath;
  ImagePlaceHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}
