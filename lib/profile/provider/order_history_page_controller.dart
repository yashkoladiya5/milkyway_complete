import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:milkyway/home/model/product_model.dart';

class OrderHistoryPageController extends ChangeNotifier {
  int _selectedIndex = -1;
  DateTime? _picked;
  List<CartWalletModel> _orderList = [];

  int get selectedIndex => _selectedIndex;
  DateTime? get picked => _picked;
  List<CartWalletModel> get orderList => _orderList;

  void updateIndex({required int index}) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      _picked = null;
      _orderList = [];
      notifyListeners();
    } else {
      _selectedIndex = -1;
      notifyListeners();
    }
  }

  Future<void> updateDateSelection({required BuildContext context}) async {
    if (_selectedIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Select Future Or Past Type First")));
      return;
    }

    if (_selectedIndex == 0) {
      _picked = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime.now().subtract(const Duration(days: 1)));
    } else if (_selectedIndex == 1) {
      _picked = await showDatePicker(
          context: context,
          firstDate: DateTime.now().add(const Duration(days: 1)),
          lastDate: DateTime(2100));
    } else {
      _picked = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100));
    }

    if (_picked != null) {
      print(_picked);
      String startDate = _picked.toString().substring(0, 19);
      String endDate = startDate.substring(0, 10);
      endDate = endDate + " 23:59:59";

      print("START DATE ::: $startDate");
      print("END DATE ::: $endDate");

      DbHelper dbHelper = await DbHelper();

      if (_selectedIndex == 1) {
        print(startDate);
        _orderList = await dbHelper.fetchFutureWalletData(date: startDate);
        notifyListeners();
        return;
      }

      _orderList =
          await dbHelper.fetchWalletData(start: startDate, end: endDate);
      print(_orderList.map(
        (e) => e.toJson(),
      ));

      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Select Data")));
      return;
    }
  }
}
