import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:milkyway/constant/app_colors.dart';

import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';
import 'package:milkyway/home/provider/product_page_controller.dart';

import 'package:milkyway/provider/loading_controller.dart';
import 'package:milkyway/provider/theme_controller.dart';
import 'package:milkyway/screens/network_error_screen.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  String? previousPageId;
  ProductModel productModel;
  ProductPage({super.key, required this.productModel, this.previousPageId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late double height;
  late double width;
  late ThemeController themeController;
  late LoadingController loadingController;
  late ProductPageController productPageController;
  late QuantityController quantityController;
  late FavouriteController favouriteController;
  PageController pageController = PageController(initialPage: 0);
  List<ProductModel> otherProductsList = [];
  List<Widget> imageList = [];
  int activePage = 0;
  ProductModel? productModel;
  String? refresh;

  bool? updatedIsFavourite;
  bool? updatedIsDaily;

  String? updatedQuantity;

  fetchOtherProductData() async {
    otherProductsList = await DbHelper().readData();
    otherProductsList.shuffle();
    print(otherProductsList.length);
  }

  increaseQuantity(bool isIncrement) async {
    int quantity;
    if (isIncrement) {
      quantity = int.parse(productPageController.productModel!.quantity!) + 1;
    } else {
      quantity = int.parse(productPageController.productModel!.quantity!);
      if (quantity > 0) {
        quantity = int.parse(productPageController.productModel!.quantity!) - 1;
      }
    }

    productPageController.productModel!.quantity = quantity.toString();

    // await Provider.of<QuantityController>(context, listen: false)
    //     .updateQuantity(newQuantity: quantity.toString());

    ProductModel updatedProductModel = productPageController.productModel!;

    Map<String, Object?> data = updatedProductModel.toJson();

    await DbHelper()
        .updateProduct(productPageController.productModel!.id!, data);

    print("DATABASE UPDATED...");
    await productPageController.fetchData(
        id: productPageController.productModel!.id!);

    await quantityController.updateQuantity(newQuantity: quantity.toString());
  }

  updateData() async {
    productPageController.productModel!.isFavourite =
        productPageController.productModel!.isFavourite == 1 ? 0 : 1;

    ProductModel updatedProductModel = productPageController.productModel!;

    await favouriteController.updateFavourite(
        newVal: updatedProductModel.isFavourite!);

    Map<String, Object?> data = updatedProductModel.toJson();

    if (productPageController.productModel!.isFavourite == 0) {
      await updateFavouriteProduct(
          productPageController.productModel!.id!, data, false);
    } else {
      await updateFavouriteProduct(
          productPageController.productModel!.id!, data, true);
    }
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
  }

  updateRelatedProductData(int index) async {
    otherProductsList[index].isFavourite =
        otherProductsList[index].isFavourite == 1 ? 0 : 1;

    ProductModel updatedProductModel = otherProductsList[index];

    Map<String, Object?> data = updatedProductModel.toJson();

    await DbHelper()
        .updateProduct(productPageController.productModel!.id!, data);

    print("DATABASE UPDATED...");
    if (!updatedIsFavourite!) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Added To Favourite List")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Removed From Favourite List")));
    }

    otherProductsList[index] = updatedProductModel;

    setState(() {});
  }

  loadRelatedImageList() {
    imageList = List.generate(
      productPageController.productModel!.relatedImages.length,
      (index) {
        return ImagePlaceHolder(
            image: productPageController.productModel!.relatedImages[index]);
      },
    );
  }

  _buildRelatedImagePageView(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Material(
                color: themeController.isLight ? Colors.white : Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.030,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context, "productPage");
                          activePage = 0;
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor),
                        )),
                    SizedBox(
                      height: height * 0.030,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
                      // color: Colors.red,
                      child: PageView.builder(
                        itemCount: imageList.length,
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            activePage = value; // Update activePage
                          });
                        },
                        itemBuilder: (context, index) {
                          return imageList[index];
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.050,
                      width: double.infinity,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          productPageController
                              .productModel!.relatedImages.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  pageController.animateToPage(
                                    index,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  );
                                  setState(() {
                                    activePage =
                                        index; // Update activePage manually
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor: activePage == index
                                      ? HexColor(AppColorsLight
                                          .orangeColor) // Active indicator color
                                      : HexColor(AppColorsLight
                                          .greyColor), // Inactive indicator color
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
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
        await loadingController.changeLoad();
        await productPageController.fetchData(id: widget.productModel.id!);
        if (productPageController.productModel != null &&
            productPageController.productModel!.quantity != null) {
          await quantityController.updateQuantity(
              newQuantity: productPageController.productModel!.quantity!);
          await favouriteController.updateFavourite(
              newVal: productPageController.productModel!.isFavourite!);
        }
        // await quantityController.updateQuantity(
        //     newQuantity: productPageController.productModel!.quantity!);
        await fetchOtherProductData();
        await loadingController.changeLoad();
        loadRelatedImageList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("PRODUCT PAGE BUILD");
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeController = Provider.of<ThemeController>(context);
    loadingController = Provider.of<LoadingController>(context);
    productPageController =
        Provider.of<ProductPageController>(context, listen: false);
    quantityController =
        Provider.of<QuantityController>(context, listen: false);
    favouriteController =
        Provider.of<FavouriteController>(context, listen: false);

    if (loadingController.isLoading) {
      return NetworkChecker(
        child: Scaffold(
          backgroundColor: HexColor(themeController.isLight
              ? AppColorsLight.backgroundColor
              : AppColorsDark.backgroundColor),
          body: Center(
            child: CircularProgressIndicator(
              color: HexColor(AppColorsLight.orangeColor),
            ),
          ),
        ),
      );
    } else {
      if (productPageController.productModel == null) {
        return NetworkChecker(
          child: Scaffold(
            body: CircularProgressIndicator(
              color: HexColor(AppColorsLight.orangeColor),
            ),
          ),
        );
      }
      return NetworkChecker(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            backgroundColor: HexColor(themeController.isLight
                ? AppColorsLight.backgroundColor
                : AppColorsLight.darkBlueColor),
            body: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildProductImage(),
                    _buildNameAndFavouriteRow(),
                    _buildWeightText(),
                    _buildPriceRow(),
                    Divider(
                      color: HexColor(AppColorsLight.greyColor),
                    ),
                    if (productPageController.productModel!.isDaily == 1)
                      _buildDailyButtonView()
                    else
                      _buildWithoutDailyButtonView(),
                    Divider(
                      color: HexColor(AppColorsLight.greyColor),
                    ),
                    _buildProductDescription(),
                    Divider(
                      color: HexColor(AppColorsLight.greyColor),
                    ),
                    _buildRatingContainer(),
                    Divider(
                      color: HexColor(AppColorsLight.greyColor),
                    ),
                    _buildAddToCartButton(),
                    _buildRelatedProductHeading(),
                    _buildRelatedProductList()
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildProductImage() {
    return Stack(
      children: [
        Container(
          height: height * 0.500,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _buildRelatedImagePageView(context);
              },
              child: Image.network(
                productPageController.productModel!.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 0.080,
          left: width * 0.050,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(
                        context, "productPage ${widget.previousPageId}");
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                  )),
              SizedBox(
                width: width * 0.620,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                  )),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildNameAndFavouriteRow() {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.010, left: width * 0.020),
      child: Row(
        children: [
          Container(
            height: height * 0.030,
            width: width * 0.500,
            // color: Colors.red,
            child: Text(
              productPageController.productModel!.name!,
              style: TextStyle(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          SizedBox(
            width: width * 0.350,
          ),
          Consumer<FavouriteController>(
            builder: (context, value, child) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await updateData();
                },
                child: Icon(
                  Icons.favorite,
                  color: value.isFavourite == 0 ? Colors.grey : Colors.red,
                  size: 25,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildWeightText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        productPageController.productModel!.weight!,
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor),
            fontSize: 15),
      ),
    );
  }

  Widget _buildPriceRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        children: [
          Text(
            "MRP.",
            style: TextStyle(
                color: HexColor(AppColorsLight.greyColor), fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0),
            width: width * 0.500,
            // color: Colors.red,
            child: Text(
              productPageController.productModel!.price!,
              style: TextStyle(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.darkBlueColor
                      : AppColorsDark.whiteColor),
                  fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyButtonView() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 5.0, bottom: 5.0),
      child: Row(
        children: [
          Text(
            "Quantity",
            style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10),
            child: InkWell(
              onTap: () async {
                await increaseQuantity(false);
              },
              child: Container(
                height: height * 0.030,
                width: width * 0.060,
                decoration: BoxDecoration(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : AppColorsDark.darkGreyColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "-",
                    style: TextStyle(
                        fontSize: 18,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                  ),
                ),
              ),
            ),
          ),
          Consumer<QuantityController>(
            builder: (context, value, child) {
              return Text(
                value.quantity == "null" ? "0" : value.quantity!,
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontSize: 17),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () async {
                await increaseQuantity(true);
              },
              child: Container(
                height: height * 0.030,
                width: width * 0.060,
                decoration: BoxDecoration(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : AppColorsDark.darkGreyColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(
                        fontSize: 18,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.270,
          ),
          Container(
            height: height * 0.035,
            width: width * 0.200,
            decoration: BoxDecoration(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.lightGreyColor
                    : AppColorsDark.darkGreyColor),
                boxShadow: [
                  BoxShadow(
                      color: themeController.isLight
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.black,
                      offset: Offset(0, 3),
                      spreadRadius: 0.1,
                      blurRadius: 8)
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "Daily",
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWithoutDailyButtonView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(
            "Quantity",
            style: TextStyle(
                color: HexColor(themeController.isLight
                    ? AppColorsLight.darkBlueColor
                    : AppColorsDark.whiteColor),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10),
            child: InkWell(
              onTap: () async {
                await increaseQuantity(false);
              },
              child: Container(
                height: height * 0.030,
                width: width * 0.060,
                decoration: BoxDecoration(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : AppColorsDark.darkGreyColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "-",
                    style: TextStyle(
                        fontSize: 18,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                  ),
                ),
              ),
            ),
          ),
          Consumer<QuantityController>(
            builder: (context, value, child) {
              return Text(
                value.quantity == "null" ? "0" : value.quantity!,
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontSize: 17),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () async {
                await increaseQuantity(true);
              },
              child: Container(
                height: height * 0.030,
                width: width * 0.060,
                decoration: BoxDecoration(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.lightGreyColor
                        : AppColorsDark.darkGreyColor),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(
                        fontSize: 18,
                        color: HexColor(themeController.isLight
                            ? AppColorsLight.darkBlueColor
                            : AppColorsDark.whiteColor)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        productPageController.productModel!.description!,
        style: TextStyle(
            color: HexColor(themeController.isLight
                ? AppColorsLight.darkBlueColor
                : AppColorsDark.whiteColor)),
      ),
    );
  }

  Widget _buildRatingContainer() {
    return Container(
      height: height * 0.100,
      width: double.infinity,
      // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(builder: (context) {
              return Text(
                (AppStrings.rating).tr(),
                style: TextStyle(
                    color: HexColor(themeController.isLight
                        ? AppColorsLight.darkBlueColor
                        : AppColorsDark.whiteColor),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              );
            }),
            Row(
              children: [
                Text(
                  productPageController.productModel!.rating!,
                  style: TextStyle(
                      fontSize: 24,
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.020,
                ),
                Icon(
                  Icons.star,
                  size: 25,
                  color: HexColor(AppColorsLight.yellowColor),
                )
              ],
            ),
            Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
              5,
              (index) {
                return Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: width * 0.020,
                    )
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildRelatedProductHeading() {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.02),
      child: Builder(builder: (context) {
        return Text(
          (AppStrings.productYouMightLike).tr(),
          style: TextStyle(
              color: HexColor(themeController.isLight
                  ? AppColorsLight.darkBlueColor
                  : AppColorsDark.whiteColor),
              fontSize: 17,
              fontWeight: FontWeight.bold),
        );
      }),
    );
  }

  Widget _buildAddToCartButton() {
    return Center(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          int quantity =
              int.parse(productPageController.productModel!.quantity!);
          if (quantity == 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 200),
                content: Text("Quantity Must be Grater Than 0")));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 200),
                content: Text("Added To Cart")));
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: height * 0.020, top: height * 0.008),
          height: height * 0.050,
          width: width * 0.310,
          decoration: BoxDecoration(
              color: HexColor(AppColorsLight.orangeColor),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return Text(
                  (AppStrings.addToCart).tr(),
                  style: TextStyle(
                      color: HexColor(AppColorsDark.whiteColor),
                      fontWeight: FontWeight.bold),
                );
              }),
              SizedBox(
                width: width * 0.010,
              ),
              Icon(
                Icons.add,
                color: HexColor(AppColorsDark.whiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedProductList() {
    if (otherProductsList.isEmpty) {
      return SizedBox();
    }
    return Container(
      height: height * 0.280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          NoSwipeCupertinoPageRoute(
                            builder: (context) {
                              print(
                                  "ID SENT TO NEXT PAGE : ${productPageController.productModel!.id!}");
                              return ProductPage(
                                previousPageId: productPageController
                                    .productModel!.id!
                                    .toString(),
                                productModel: otherProductsList[index],
                              );
                            },
                          ),
                        );

                        if (result != null) {
                          print("REFRESH RESULT: $result");

                          String id = result.substring(12);
                          print("ID FROM NEXT PAGE : $id");

                          await loadingController.changeLoad();
                          await productPageController.fetchData(
                              id: int.parse(id));

                          if (productPageController.productModel != null &&
                              productPageController.productModel!.quantity !=
                                  null) {
                            await quantityController.updateQuantity(
                              newQuantity:
                                  productPageController.productModel!.quantity!,
                            );
                            await favouriteController.updateFavourite(
                              newVal: productPageController
                                  .productModel!.isFavourite!,
                            );
                          }

                          await fetchOtherProductData();
                          await loadingController.changeLoad();
                          await loadRelatedImageList();

                          setState(() {});
                        }
                      },
                      child: Container(
                        height: height * 0.150,
                        width: width * 0.250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            otherProductsList[index].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: height * 0.040,
                        width: width * 0.080,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 0.5,
                                  offset: Offset(3, 3),
                                  blurRadius: 10),
                            ],
                            borderRadius: BorderRadius.circular(40)),
                        child: InkWell(
                          onTap: () async {
                            await updateRelatedProductData(index);
                          },
                          child: Icon(
                            Icons.favorite,
                            color: otherProductsList[index].isFavourite != 1
                                ? Colors.grey
                                : Colors.red,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.005),
                  width: width * 0.240,
                  height: height * 0.020,
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                      otherProductsList[index].name!,
                      style: TextStyle(
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor),
                          fontSize: 12),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.002),
                  width: width * 0.240,
                  height: height * 0.020,
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                      otherProductsList[index].weight!,
                      style: TextStyle(
                          color: HexColor(themeController.isLight
                              ? AppColorsLight.darkBlueColor
                              : AppColorsDark.whiteColor),
                          fontSize: 12),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "MRP.",
                      style: TextStyle(
                          color: HexColor(AppColorsLight.greyColor),
                          fontSize: 12),
                    ),
                    SizedBox(
                      // margin: EdgeInsets.only(top: height * 0.005),
                      width: width * 0.130,
                      height: height * 0.020,
                      // color: Colors.red,
                      child: Text(
                        otherProductsList[index].price!,
                        style: TextStyle(
                            color: HexColor(themeController.isLight
                                ? AppColorsLight.darkBlueColor
                                : AppColorsDark.whiteColor),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                if (otherProductsList[index].isDaily == 1)
                  _buildRelatedProductButtonWithDaily()
                else
                  _buildRelatedProductWithoutDaily(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRelatedProductButtonWithDaily() {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.002),
      child: Builder(builder: (context) {
        return Row(
          children: [
            Container(
              height: height * 0.030,
              width: width * 0.120,
              decoration: BoxDecoration(
                  color: HexColor(themeController.isLight
                      ? AppColorsLight.lightGreyColor
                      : AppColorsDark.darkGreyColor),
                  boxShadow: [
                    BoxShadow(
                      color: themeController.isLight
                          ? HexColor(AppColorsLight.greyColor).withOpacity(0.5)
                          : HexColor(AppColorsDark.darkGreyColor)
                              .withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  (AppStrings.daily).tr(),
                  style: TextStyle(
                      color: HexColor(themeController.isLight
                          ? AppColorsLight.darkBlueColor
                          : AppColorsDark.whiteColor),
                      fontSize: 12),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.010,
            ),
            Container(
              height: height * 0.030,
              width: width * 0.120,
              decoration: BoxDecoration(
                  color: HexColor(AppColorsLight.orangeColor),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (AppStrings.add).tr(),
                    style: TextStyle(
                        color: HexColor(AppColorsDark.whiteColor),
                        fontSize: 12),
                  ),
                  Icon(
                    Icons.add,
                    color: HexColor(AppColorsDark.whiteColor),
                    size: 15,
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildRelatedProductWithoutDaily() {
    return Container(
      height: height * 0.030,
      width: width * 0.120,
      decoration: BoxDecoration(
          color: HexColor(AppColorsLight.orangeColor),
          borderRadius: BorderRadius.circular(5)),
      child: Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (AppStrings.add).tr(),
              style: TextStyle(
                  color: HexColor(AppColorsDark.whiteColor), fontSize: 12),
            ),
            Icon(
              Icons.add,
              color: HexColor(AppColorsDark.whiteColor),
              size: 15,
            )
          ],
        );
      }),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  String image;
  ImagePlaceHolder({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.cover,
    );
  }
}

class NoSwipeCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  NoSwipeCupertinoPageRoute({required WidgetBuilder builder})
      : super(builder: builder);

  @override
  bool get popGestureEnabled => false; // 👈 disables the swipe back
}
