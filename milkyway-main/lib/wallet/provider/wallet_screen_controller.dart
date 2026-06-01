import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milkyway/cart/model/cart_wallet_model.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/services/backend_api.dart';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(SharedPreferenceKeys.userIdKey) ?? '';

    final response = await BackendApi.getJson(
      '/wallet/entries',
      queryParameters: {
        'userId': userId,
        'start': _startDate,
        'end': _endDate,
      },
    );

    final entries = (response['entries'] as List<dynamic>? ?? const [])
        .cast<Map<String, dynamic>>();
    _transactionData = entries.map(CartWalletModel.fromJson).toList();

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
        String rawPrice = _transactionData[i].price;
        
        // Safe price parsing: Remove the currency symbol if it exists
        String strPrice = rawPrice.trim();
        if (strPrice.isNotEmpty && !RegExp(r'^[0-9]').hasMatch(strPrice)) {
          strPrice = strPrice.substring(1).trim();
        }
            
        double price = double.tryParse(strPrice) ?? 0.0;
        
        if (_transactionData[i].quantity == "" || _transactionData[i].quantity == "0") {
          finalPrice = price;
        } else {
          int quantity = int.tryParse(_transactionData[i].quantity) ?? 1;
          finalPrice = price * quantity;
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
        if (_transactionData[i].isExpense == 1) {
          // Include items even without images (like bill payments)
          Map<String, dynamic> data = _transactionData[i].toJson();
          String rawPrice = data["price"].toString();

          // Clean price for model parsing
          String cleanPrice = rawPrice.trim();
          if (cleanPrice.isNotEmpty && !RegExp(r'^[0-9]').hasMatch(cleanPrice)) {
            cleanPrice = cleanPrice.substring(1).trim();
          }

          data["price"] = cleanPrice;

          // Ensure quantity is at least "1" for invoice calculations
          if (data["quantity"] == "" || data["quantity"] == "0") {
            data["quantity"] = "1";
          }

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

      if (userId != null && userId.isNotEmpty) {
        final response = await BackendApi.getJson('/users/$userId');
        _userData = response['user'] as Map<String, dynamic>? ?? {};
        print("USER FOUND :::: $_userData");
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
