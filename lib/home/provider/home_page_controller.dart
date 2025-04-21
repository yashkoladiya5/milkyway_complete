import 'package:flutter/material.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';

class HomePageController extends ChangeNotifier {
  int _selectedIndex = 0;
  int _activePage = 0;
  List<ProductModel> _favouriteProductList = [];

  int get selectedIndex => _selectedIndex;
  int get activePage => _activePage;
  List<ProductModel> get favouriteProductList => _favouriteProductList;

  void changeIndex({required int index}) {
    _selectedIndex = index;
    print("SELECTED INDEX : $selectedIndex");
    notifyListeners();
  }

  void changePage({required int index}) {
    _activePage = index;
    print("ACTIVE PAGE : $activePage");
    notifyListeners();
  }

  void setDefault() {
    _activePage = 0;
    _selectedIndex = 0;
    notifyListeners();
  }

  Future fetchFavouriteProductList() async {
    _favouriteProductList = await DbHelper().readFavouriteProductData();

    if (_favouriteProductList.isEmpty) {
      print("NO DATA");
    } else {
      print(_favouriteProductList.length);
    }
    notifyListeners();
  }
}
