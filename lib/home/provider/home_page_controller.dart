import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends ChangeNotifier {
  int _selectedIndex = 0;
  int _activePage = 0;
  List<ProductModel> _favouriteProductList = [];
  String _totalAmount = "0.0";
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

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String autoPaymentBalanceAmount =
        prefs.getString(SharedPreferenceKeys.autoPayBalanceId) ?? "0.0";
    String autoPaymentAmount =
        prefs.getString(SharedPreferenceKeys.autoPayId) ?? "0.0";

    double autoBalance = double.tryParse(autoPaymentBalanceAmount) ?? 0.0;
    double autoAmount = double.tryParse(autoPaymentAmount) ?? 0.0;
    double totalAmount = double.tryParse(_totalAmount) ?? 0.0;

    if ((totalAmount >= 0 || autoAmount != 0.0) && totalAmount < autoBalance) {
      String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      String name = AppStrings.uploadBalanceWithUPIId;
      int isIncome = 1;
      String price1 = "₹" + autoPaymentAmount;
      String weightValue = "";
      String weightUnit = "";
      String quantity = "";
      String image = "";

      final data = CartWalletModel(
          isDaily: 0, //CHANGE
          id: 0,
          date: date,
          image: image,
          isExpense: 0,
          isIncome: isIncome,
          name: name,
          price: price1,
          quantity: quantity,
          weightUnit: weightUnit,
          weightValue: weightValue);

      DbHelper dbHelper = DbHelper();

      await dbHelper.insertWalletData(model: data);
      print("DATA INSERTED");

      _totalAmount = await dbHelper.fetchTotalBalanceData();
    }

    notifyListeners();
  }

  Future<void> convertUiDateToYyyyMmDd(String uiDate, int index) async {
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

      if (index > 0) {
        final futureData = await dbHelper.fetchHomeScreenTableFutureDailyData(
            firstDate: firstDate);

        _dateWiseProductList = [];

        for (int i = 0; i < futureData.length; i++) {
          if (futureData[i].image != "") {
            _dateWiseProductList.add(futureData[i]);
          }
        }
      } else {
        final data = await dbHelper.fetchHomeScreenTableData(
            firstDate: firstDate, lastDate: endDate);

        _dateWiseProductList = [];
        for (int i = 0; i < data.length; i++) {
          if (data[i].image != "") {
            _dateWiseProductList.add(data[i]);
          }
        }
        print("DATE WISE LIST ::: ${_dateWiseProductList.length}");
      }

      notifyListeners();
    } catch (e) {
      print("ERROR :: $e");
    }
  }
}
