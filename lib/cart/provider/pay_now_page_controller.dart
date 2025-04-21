import 'package:flutter/material.dart';

class PayNowPageController extends ChangeNotifier {
  int _selectedIndex = 6;
  int _paymentIndex = 5;

  int get selectedIndex => _selectedIndex;
  int get paymentIndex => _paymentIndex;

  void changeIndex({required int index}) {
    _selectedIndex = index;
    notifyListeners();
  }

  void changePaymentIndex({required int index}) {
    _paymentIndex = index;
    notifyListeners();
  }
}
