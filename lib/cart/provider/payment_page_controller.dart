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
    _totalPrice = bagTotal + "0";
    notifyListeners();
  }

  void updateAfterDiscountApplied({required String discount}) {
    // _discountPrice = discount;
    double finalAmount = double.parse(_totalPrice) - double.parse(discount);
    _discountPrice = discount;
    _totalPrice = finalAmount.toString() + "0";
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
      final allData = await dbHelper.readData();
      for (int i = 0; i < allData.length; i++) {
        for (int j = 0; j < data.length; j++) {
          if (data[j] == allData[i].id) {
            await dbHelper.insertDailyProductData(id: data[j]);
          }
        }
      }

      Provider.of<DailyProductListController>(context, listen: false)
          .clearList();
    } else {
      print("No Daily Products...");
    }

    notifyListeners();
  }
}
