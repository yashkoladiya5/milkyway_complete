import 'package:flutter/widgets.dart';
import 'package:milkyway/cart/provider/home_bag_screen_controller.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:provider/provider.dart';

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
    // Parse bagTotal as double and store it without unnecessary suffix
    _totalPrice = double.parse(bagTotal).toStringAsFixed(2);
    notifyListeners();
  }

  void updateAfterDiscountApplied({required String discount}) {
    // _discountPrice = discount;
    double finalAmount = double.parse(_totalPrice) - double.parse(discount);
    _discountPrice = discount;
    // Round to nearest integer as requested for round figure and to avoid Stripe errors
    _totalPrice = finalAmount.round().toDouble().toStringAsFixed(2);
    notifyListeners();
  }

  clearData() {
    _expandedStates = [false, false, false, false];

    notifyListeners();
  }

  clearAllData() {
    _expandedStates = [false, false, false, false];
    _discountPrice = "00.00";
    _totalPrice = "00.00";

    notifyListeners();
  }

  Future<void> addToDailyProducts(
      {required List<int> data, required BuildContext context}) async {
    DbHelper dbHelper = DbHelper();

    if (data.isNotEmpty) {
      await dbHelper.syncDailyProductIds(data);

      Provider.of<DailyProductListController>(context, listen: false)
          .clearList();
    } else {
      print("No Daily Products...");
    }

    notifyListeners();
  }
}
