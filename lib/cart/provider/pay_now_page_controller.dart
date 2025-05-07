import 'package:flutter/material.dart';

class PayNowPageController extends ChangeNotifier {
  int _selectedIndex = -1;
  int _paymentIndex = -1;

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
