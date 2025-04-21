import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LogInPageController extends ChangeNotifier {
  bool _isVisible = false;
  bool _isChecked = false;
  bool _isContactFieldTouched = false;
  bool _isPasswordFieldTouched = false;

  bool get isVisible => _isVisible;
  bool get isChecked => _isChecked;
  bool get isPasswordFieldTouched => _isPasswordFieldTouched;
  bool get isContactFieldTouched => _isContactFieldTouched;

  setPasswordIcon() {
    _isVisible = !_isVisible;
    if (kDebugMode) {
      print("is visible called");
    }
    notifyListeners();
  }

  setDefault() {
    _isVisible = false;
    _isChecked = false;
    _isPasswordFieldTouched = false;
    _isContactFieldTouched = false;
    notifyListeners();
  }

  setIsChecked() {
    _isChecked = !_isChecked;
    notifyListeners();
  }

  setIsPasswordFieldTouched() {
    _isPasswordFieldTouched = true;
    notifyListeners();
  }

  setIsContactFieldTouched() {
    _isContactFieldTouched = true;
    notifyListeners();
  }
}
