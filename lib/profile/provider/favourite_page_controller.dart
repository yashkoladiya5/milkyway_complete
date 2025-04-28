import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/cart/provider/home_bag_screen_controller.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';
import 'package:provider/provider.dart';

class FavouritePageController extends ChangeNotifier {
  List<ProductModel> _favouriteList = [];

  List<ProductModel> get favouriteList => _favouriteList;

  Future<void> fetchFavouriteProducts() async {
    DbHelper dbHelper = DbHelper();
    _favouriteList = await dbHelper.readFavouriteProductData();

    if (_favouriteList.isEmpty) {
      print("NO DATA");
    } else {
      print(_favouriteList.map(
        (e) => e.toJson(),
      ));
    }

    notifyListeners();
  }

  updateData(int index, BuildContext context) async {
    _favouriteList[index].isFavourite =
        _favouriteList[index].isFavourite == 1 ? 0 : 1;

    ProductModel productModel = _favouriteList[index];

    Map<String, Object?> data = productModel.toJson();
    if (_favouriteList[index].isFavourite == 1) {
      await updateFavouriteProduct(
          _favouriteList[index].id!, data, false, context);
    } else {
      await updateFavouriteProduct(
          _favouriteList[index].id!, data, true, context);
    }

    notifyListeners();
  }

  updateFavouriteProduct(int id, Map<String, Object?> data, bool isAdded,
      BuildContext context) async {
    await DbHelper().updateProduct(id, data);

    print("DATABASE UPDATED...");
    if (isAdded) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Removed From Favourite List")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Added To Favourite List")));
    }
    await fetchFavouriteProducts();

    notifyListeners();
    // await updateUI();
  }

  addToCart({required int index, required BuildContext context}) async {
    int quantity = int.parse(_favouriteList[index].quantity ?? "0");

    if (quantity > 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product is Already in cart")));
    } else {
      _favouriteList[index].quantity = '1';
      await DbHelper().updateProduct(
          _favouriteList[index].id!, _favouriteList[index].toJson());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Added To Cart")));
      print("DATABASE UPDATED");
    }
  }

  updateFavouriteAndRelatedProductList(
      {required int id, required BuildContext context, required int index}) {
    List<ProductModel> relatedProductList =
        Provider.of<RelatedProductListController>(context, listen: false)
            .relatedProductList;

    for (int i = 0; i < relatedProductList.length; i++) {
      if (relatedProductList[i].id == id) {
        Provider.of<RelatedProductListController>(context, listen: false)
            .updateFavouriteProduct(index: i);
        break;
      }
    }

    notifyListeners();
  }
}
