import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool _isLight = true;

  bool get isLight => _isLight;

  changeTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
