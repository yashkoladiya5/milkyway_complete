import 'package:flutter/material.dart';

class NewPasswordPageController extends ChangeNotifier {
  bool _isPasswordFieldTouched = false;
  bool _isConfirmPasswordFieldTouched = false;

  bool get isPasswordFieldTouched => _isPasswordFieldTouched;
  bool get isConfirmPasswordFieldTouched => _isConfirmPasswordFieldTouched;

  setPasswordFieldTouched() {
    _isPasswordFieldTouched = true;
    notifyListeners();
  }

  setConfirmPasswordFieldTouched() {
    _isConfirmPasswordFieldTouched = true;
    notifyListeners();
  }

  setDefault() {
    _isPasswordFieldTouched = false;
    _isConfirmPasswordFieldTouched = false;
    notifyListeners();
  }
}
