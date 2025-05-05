import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletScreenController extends ChangeNotifier {
  String _dateTimeRange = "Select Date Range";
  DateTimeRange? _picked;
  String _startDate = "";
  String _endDate = "";
  List<CartWalletModel> _transactionData = [];
  List<CartWalletModel> _invoiceData = [];
  String _totalAmount = "0.00";
  String _totalIncome = "0.00";
  String _totalExpense = "0.00";
  Map<String, dynamic> _userData = {};

  Map<String, dynamic> get userData => _userData;
  DateTimeRange? get picked => _picked;
  String get dateTimeRange => _dateTimeRange;
  String get startDate => _startDate;
  String get endDate => _endDate;
  List<CartWalletModel> get transactionData => _transactionData;
  List<CartWalletModel> get invoiceData => _invoiceData;
  String get totalAmount => _totalAmount;
  String get totalIncome => _totalIncome;
  String get totalExpense => _totalExpense;

  Future<void> updateDateTime({required BuildContext context}) async {
    _picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      DateTime startDate = _picked!.start;
      DateTime endDate = _picked!.end;

      endDate =
          endDate.add(const Duration(hours: 23, minutes: 59, seconds: 59));

      _startDate = startDate.toString().substring(0, 19);
      _endDate = endDate.toString().substring(0, 19);

      print(_startDate);
      print(_endDate);

      _dateTimeRange =
          ("${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)}");
      await fetchDataAccordingToDate();
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please select Valid Dates")));
    }
  }

  Future<void> fetchDataAccordingToDate() async {
    DbHelper dbHelper = DbHelper();

    _transactionData =
        await dbHelper.fetchWalletData(start: _startDate, end: _endDate);

    if (_transactionData.isEmpty) {
      print("No TRANSACTION DATA FOUND");
      _totalAmount = "0.00";
      _totalExpense = "0.00";
      _totalIncome = "0.00";
      notifyListeners();
    } else {
      print("DATA FOUND ${_transactionData.length}");

      double _expense = 0.0;
      double _income = 0.0;
      for (int i = 0; i < _transactionData.length; i++) {
        double finalPrice = 0.0;
        String strPrice = _transactionData[i]
            .price
            .substring(1, _transactionData[i].price.length);
        double price = double.parse(strPrice);
        if (_transactionData[i].quantity == "") {
          int quantity = 0;
          finalPrice = price * quantity;
          print(price);
        } else {
          int quantity = int.parse(_transactionData[i].quantity);
          finalPrice = price * quantity;
          print(price);
        }

        if (_transactionData[i].isExpense == 1) {
          _expense += finalPrice;
        } else if (_transactionData[i].isIncome == 1) {
          _income += price;
        }
      }

      double total = _income - _expense;
      print("TOTAL ::: $total");

      print("EXPENSES TOTAL : $_expense");
      print("INCOMES TOTAL : $_income");

      _totalAmount = total.toString();
      _totalExpense = _expense.toString();
      _totalIncome = _income.toString();

      _invoiceData = [];
      for (int i = 0; i < _transactionData.length; i++) {
        if (_transactionData[i].image != "") {
          Map<String, dynamic> data = _transactionData[i].toJson();

          data["price"] = data["price"]
              .toString()
              .substring(1, _transactionData[i].price.length);
          _invoiceData.add(CartWalletModel.fromJson(data));
        }
      }

      print("INVOICE DATA LENGTH :::: ${_invoiceData.length}");
      print("INVOICE DATA  :::: ${_invoiceData.map(
        (e) => e.toJson(),
      )}");

      notifyListeners();
    }
  }

  Future<void> fetchUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

      if (userId != "") {
        final firebase =
            FirebaseFirestore.instance.collection("user").doc(userId);

        await firebase.get().then(
          (value) {
            final data = value.data();

            _userData = data!;

            print("USER FOUND :::: $_userData");
          },
        );

        notifyListeners();
      }
    } catch (err) {
      print(err);
    }
  }

  void clearData() {
    _dateTimeRange = "Select Date Range";
    _startDate = "";
    _endDate = "";
    _transactionData = [];
    _invoiceData = [];
    _totalAmount = "0.00";
    _totalIncome = "0.00";
    _totalExpense = "0.00";
    print("DATA CLEARED");
    notifyListeners();
  }
}
