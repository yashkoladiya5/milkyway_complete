import 'package:flutter/cupertino.dart';

class FaqPageController extends ChangeNotifier {
  List<bool> _expandedList = [false, false, false, false, false];

  List<bool> get expandedList => _expandedList;

  void changeIndex({required int index}) {
    for (int i = 0; i < _expandedList.length; i++) {
      if (_expandedList[i] != true) {
        _expandedList[i] = i == index;
      } else {
        _expandedList[i] = false;
      }
    }
    print(_expandedList);
    notifyListeners();
  }
}
