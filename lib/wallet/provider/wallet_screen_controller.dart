import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/dbhelper/db_helper.dart';

class WalletScreenController extends ChangeNotifier {
  String _dateTimeRange = "Select Date Range";
  DateTimeRange? _picked;
  String _startDate = "";
  String _endDate = "";
  List<CartWalletModel> _transactionData = [];
  String _totalAmount = "0.00";
  String _totalIncome = "0.00";
  String _totalExpense = "0.00";

  DateTimeRange? get picked => _picked;
  String get dateTimeRange => _dateTimeRange;
  String get startDate => _startDate;
  String get endDate => _endDate;
  List<CartWalletModel> get transactionData => _transactionData;
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
        double price = double.parse(_transactionData[i]
            .price
            .substring(1, _transactionData[i].price.length));
        print(price);

        if (_transactionData[i].isExpense == 1) {
          _expense += price;
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

      notifyListeners();
    }
  }

  void clearData() {
    _dateTimeRange = "Select Date Range";
    _startDate = "";
    _endDate = "";
    _transactionData = [];
    _totalAmount = "0.00";
    _totalIncome = "0.00";
    _totalExpense = "0.00";
    print("DATA CLEARED");
    notifyListeners();
  }
}
