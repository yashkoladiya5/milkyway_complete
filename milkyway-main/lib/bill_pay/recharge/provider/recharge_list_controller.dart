import 'package:flutter/cupertino.dart';
import 'package:milkyway/constant/app_lists.dart';

class RechargeListController extends ChangeNotifier {
  int _operatorSelectedIndex = -1;
  int _stateSelectedIndex = -1;
  TextEditingController _operatorController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  int get operatorSelectedIndex => _operatorSelectedIndex;
  int get stateSelectedIndex => _stateSelectedIndex;
  TextEditingController get operatorController => _operatorController;
  TextEditingController get stateController => _stateController;
  TextEditingController get priceController => _priceController;
  TextEditingController get mobileController => _mobileController;

  void updateSelectedOperatorIndex({required int index}) {
    _operatorSelectedIndex = index;
    _operatorController.text =
        AppLists().mobileRechargeOperatorList[_operatorSelectedIndex];
    notifyListeners();
    print("SELECTED OPERATOR : $_operatorSelectedIndex");
  }

  void updateSelectedStateIndex({required int index}) {
    _stateSelectedIndex = index;
    _stateController.text =
        AppLists().mobileRechargeStateList[_stateSelectedIndex];
    notifyListeners();
    print("SELECTED STATE : $_stateSelectedIndex");
  }

  void updatePriceValue({required String price}) {
    _priceController.text = price;
    notifyListeners();
  }

  void clearData() {
    _stateSelectedIndex = -1;
    _operatorSelectedIndex = -1;
    _mobileController.text = "";
    _priceController.text = "";
    _stateController.text = "";
    _operatorController.text = "";

    notifyListeners();
  }
}
