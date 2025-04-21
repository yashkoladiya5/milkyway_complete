import 'package:flutter/widgets.dart';

class PaymentPageController extends ChangeNotifier {
  List<bool> _expandedStates = [false, false, false, false];

  List<bool> get expandedStates => _expandedStates;

  void changeList({required int index}) {
    _expandedStates[index] = !_expandedStates[index];

    notifyListeners();
  }
}
