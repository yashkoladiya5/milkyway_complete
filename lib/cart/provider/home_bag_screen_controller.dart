import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBagScreenController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}

class CartItemListController extends ChangeNotifier {
  List<ProductModel> _cartItemList = [];

  List<ProductModel> get cartItemList => _cartItemList;

  Future fetchData() async {
    _cartItemList = [];
    List<ProductModel> allData = [];
    allData = await DbHelper().readData();

    for (int i = 0; i < allData.length; i++) {
      int quantity = int.parse(allData[i].quantity!);
      if (quantity > 0) {
        _cartItemList.add(allData[i]);
      }
    }

    print("CART ITEM LIST : ${_cartItemList.length}");
    notifyListeners();
  }

  deleteProductFromCart(int index) {
    _cartItemList.removeAt(index);
    notifyListeners();
  }

  clearList() {
    _cartItemList = [];
    notifyListeners();
  }
}

class QuantityListController extends ChangeNotifier {
  List<String> _quantityList = [];
  double _bagTotal = 0;

  List<String> get quantityList => _quantityList;
  double get bagTotal => _bagTotal;

  updateQuantityList(
      {required int index,
      required String value,
      required List<ProductModel> list}) async {
    _quantityList[index] = value;
    _bagTotal = 0;
    for (int i = 0; i < list.length; i++) {
      int quantity = int.parse(_quantityList[i]);
      String substring = list[i].price!.substring(1, list[i].price!.length);
      double price = double.parse(substring);
      _bagTotal = _bagTotal + (quantity * price);
    }
    print("BAG TOTAL : $bagTotal");
    notifyListeners();
    print(_quantityList);
  }

  defaultQuantityList(List<ProductModel> list) {
    _quantityList = [];
    _bagTotal = 0;
    for (int i = 0; i < list.length; i++) {
      _quantityList.add(list[i].quantity!);
    }

    for (int i = 0; i < list.length; i++) {
      int quantity = int.parse(_quantityList[i]);
      String substring = list[i].price!.substring(1, list[i].price!.length);
      double price = double.parse(substring);
      _bagTotal = _bagTotal + (quantity * price);
    }
    print("BAG TOTAL : $bagTotal");
    notifyListeners();
    print(_quantityList);
  }

  deleteQuantityProduct(int index, List<ProductModel> list) {
    _quantityList.removeAt(index);
    _bagTotal = 0;
    for (int i = 0; i < list.length; i++) {
      int quantity = int.parse(_quantityList[i]);
      String substring = list[i].price!.substring(1, list[i].price!.length);
      double price = double.parse(substring);
      _bagTotal = _bagTotal + (quantity * price);
    }
    print("BAG TOTAL : $bagTotal");
    notifyListeners();
  }

  clearList() {
    _quantityList = [];
    notifyListeners();
  }
}

class FavouriteListController extends ChangeNotifier {
  List<int> _favouriteList = [];

  List<int> get favouriteList => _favouriteList;

  updateFavouriteList({required int index, required int value}) async {
    _favouriteList[index] = value;
    notifyListeners();
    print(_favouriteList);
  }

  defaultFavouriteList(List<ProductModel> list) {
    _favouriteList = [];
    for (int i = 0; i < list.length; i++) {
      _favouriteList.add(list[i].isFavourite!);
    }
    print(_favouriteList);
    notifyListeners();
  }

  deleteFavouriteProduct(int index) {
    _favouriteList.removeAt(index);
    notifyListeners();
  }
}

class RelatedProductListController extends ChangeNotifier {
  List<ProductModel> _relatedProductList = [];

  List<ProductModel> get relatedProductList => _relatedProductList;

  defaultRelatedProductList() async {
    List<ProductModel> allData = [];
    _relatedProductList = [];
    allData = await DbHelper().readData();

    allData.shuffle();

    for (int i = 0; i < 6; i++) {
      _relatedProductList.add(allData[i]);
    }
    print(_relatedProductList.map(
      (e) => e.id!,
    ));
    notifyListeners();
  }

  updateFavouriteProduct({required int index}) async {
    _relatedProductList[index].isFavourite =
        _relatedProductList[index].isFavourite == 1 ? 0 : 1;
    await DbHelper().updateProduct(
        _relatedProductList[index].id!, _relatedProductList[index].toJson());
    notifyListeners();
  }

  updateQuantity({required int index, required BuildContext context}) async {
    int quantity = int.parse(_relatedProductList[index].quantity!);
    if (quantity > 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product is already in cart")));
    } else {
      _relatedProductList[index].quantity = '1';
      await DbHelper().updateProduct(
          _relatedProductList[index].id!, _relatedProductList[index].toJson());
      notifyListeners();
      print("PRODUCT ADDED TO CART");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          content: Text("Product Added to cart")));
    }
  }

  defaultQuantityOfRemovedProduct({required int id}) {
    for (int i = 0; i < _relatedProductList.length; i++) {
      if (_relatedProductList[i].id == id) {
        _relatedProductList[i].quantity = '0';
        print("RELATED PRODUCT QUANTITY ::: $id");
        break;
      }
    }
  }
}

class DailyProductListController extends ChangeNotifier {
  List<int> _dailyProductList = [];

  List<int> get dailyProductList => _dailyProductList;

  updateDailyProductList(
      {required int id, required BuildContext context}) async {
    if (!_dailyProductList.contains(id)) {
      _dailyProductList.add(id);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> intList = _dailyProductList
          .map(
            (e) => e.toString(),
          )
          .toList();

      prefs.setStringList(SharedPreferenceKeys.dailyProductIdKey, intList);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product is already in Daily Product List")));
    }

    print("DAILY PRODUCT LIST ::: $dailyProductList");
  }

  deleteFromProductList({required int id}) {
    if (_dailyProductList.contains(id) == true) {
      _dailyProductList.remove(id);
      print("DAILY PRODUCT REMOVED ::: $id");
      print("DAILY PRODUCT AFTER REMOVED ::: $_dailyProductList");
    } else {
      print("NO PRODUCT OF THIS ID IN DAILY");
    }
  }

  clearList() async {
    _dailyProductList.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SharedPreferenceKeys.dailyProductIdKey);
    notifyListeners();
  }

  fetchDailyProductListDateFromSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? dailyList =
        prefs.getStringList(SharedPreferenceKeys.dailyProductIdKey);

    if (dailyList != null) {
      List<int> intList = [];
      for (int i = 0; i < dailyList.length; i++) {
        intList.add(int.parse(dailyList[i]));
      }
      _dailyProductList = [];
      _dailyProductList.addAll(intList);
      notifyListeners();
      print(
          "DAILY PRODUCT LIST FROM SHARED PREFERECNES ::: ${_dailyProductList}");
    } else {
      print("DAILY PRODUCT LIST FROM SHARED PREFERECNES IS null");
    }
  }
}
