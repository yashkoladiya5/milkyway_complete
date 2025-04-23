import 'package:flutter/widgets.dart';

class PaymentPageController extends ChangeNotifier {
  List<bool> _expandedStates = [false, false, false, false];
  String _discountPrice = "00.00";
  String _totalPrice = "00.00";

  List<bool> get expandedStates => _expandedStates;
  String get discountPrice => _discountPrice;
  String get totalPrice => _totalPrice;

  void changeList({required int index}) {
    _expandedStates[index] = !_expandedStates[index];

    notifyListeners();
  }

  void updateDiscountAndTotalAmount({required String bagTotal}) {
    _discountPrice = "00.00";
    _totalPrice = bagTotal + "0";
    notifyListeners();
  }

  void updateAfterDiscountApplied({required String discount}) {
    // _discountPrice = discount;
    double finalAmount = double.parse(_totalPrice) - double.parse(discount);
    _discountPrice = discount;
    _totalPrice = finalAmount.toString();
    notifyListeners();
  }

  clearData() {
    _expandedStates = [false, false, false, false];
    _discountPrice = "00.00";
    _totalPrice = "00.00";
    notifyListeners();
  }
}
