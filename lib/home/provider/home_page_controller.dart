import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/constant/app_lists.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';

class HomePageController extends ChangeNotifier {
  int _selectedIndex = 0;
  int _activePage = 0;
  List<ProductModel> _favouriteProductList = [];
  String _totalAmount = "";
  List<CartWalletModel> _dateWiseProductList = [];

  int get selectedIndex => _selectedIndex;
  int get activePage => _activePage;
  String get totalAmount => _totalAmount;
  List<ProductModel> get favouriteProductList => _favouriteProductList;
  List<CartWalletModel> get dateWiseProductList => _dateWiseProductList;

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

  Future fetchTotalBalance() async {
    DbHelper dbHelper = DbHelper();
    _totalAmount = await dbHelper.fetchTotalBalanceData();
  }

  Future<void> convertUiDateToYyyyMmDd(String uiDate) async {
    int currentYear = 2025;

    List<String> parts = uiDate.split(" ");

    String month = parts[0];
    String day = parts[2];

    month = month[0].toUpperCase() + month.substring(1).toLowerCase();

    String formattedDate = "$month $day $currentYear";

    try {
      // Parse the formatted string
      DateTime parsedDate =
          DateFormat("MMM dd yyyy", "en_US").parse(formattedDate);

      // Convert to the desired format (yyyy-MM-dd)
      String firstDate = DateFormat("yyyy-MM-dd").format(parsedDate).toString();
      firstDate = firstDate + " 00:00:00";
      String endDate = firstDate.substring(0, 10) + " 23:59:59";
      print(firstDate + "   " + endDate);

      DbHelper dbHelper = DbHelper();

      final data = await dbHelper.fetchHomeScreenTableData(
          firstDate: firstDate, lastDate: endDate);

      _dateWiseProductList = [];
      for (int i = 0; i < data.length; i++) {
        if (data[i].image != "") {
          _dateWiseProductList.add(data[i]);
        }
      }
      print("DATE WISE LIST ::: ${_dateWiseProductList.length}");
      notifyListeners();
    } catch (e) {
      print("ERROR :: $e");
    }
  }
}
