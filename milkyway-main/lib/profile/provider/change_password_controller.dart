import 'package:flutter/cupertino.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/services/backend_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends ChangeNotifier {
  bool _isVisible = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  Map<String, dynamic> _userData = {};
  bool _isPasswordFieldTouched = false;
  bool _isNewPasswordFieldTouched = false;
  bool _isConfirmPasswordFieldTouched = false;

  bool get isVisible => _isVisible;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get newPasswordController => _newPasswordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  Map<String, dynamic> get userData => _userData;
  bool get isPasswordFieldTouched => _isPasswordFieldTouched;
  bool get isNewPasswordFieldTouched => _isNewPasswordFieldTouched;
  bool get isConfirmPasswordFieldTouched => _isConfirmPasswordFieldTouched;

  void changeVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  Future<void> fetchPasswordData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

    if (userId == null || userId.isEmpty) {
      return;
    }

    final response = await BackendApi.getJson('/users/$userId');
    _userData = response['user'] as Map<String, dynamic>? ?? {};
    print("USER DATA $_userData");

    notifyListeners();
  }

  String? validateOldPassword(String value) {
    if (value.isEmpty) {
      return "Required Field";
    } else {
      return null;
    }
  }

  String? validateNewPassword(String value) {
    if (value.isEmpty) {
      return "Required Field";
    } else if (value == _passwordController.text) {
      return "Do not Enter the Old Password Again";
    } else if (value.length > 6 || value.length < 6) {
      return "Password Length Must be of 6 characters";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Required Field";
    } else if (value != _newPasswordController.text) {
      return "Password not match ";
    } else if (value.length > 6 || value.length < 6) {
      return "Password Length Must be of 6 characters";
    } else {
      return null;
    }
  }

  void setPasswordFieldTouched() {
    _isPasswordFieldTouched = true;
    notifyListeners();
  }

  void setNewPasswordFieldTouched() {
    _isNewPasswordFieldTouched = true;
    notifyListeners();
  }

  void setConfirmPasswordFieldTouched() {
    _isConfirmPasswordFieldTouched = true;
    notifyListeners();
  }

  Future<void> savePasswordToDatabase() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

    if (userId == null || userId.isEmpty) {
      return;
    }

    await BackendApi.putJson(
      '/users/$userId/password',
      body: {
        'oldPassword': _passwordController.text,
        'password': _newPasswordController.text,
        'confirmPassword': _confirmPasswordController.text,
      },
    );

    _userData["password"] = _newPasswordController.text;
    _userData["confirmPassword"] = _confirmPasswordController.text;

    print("USER DATA ::: $_userData");
    print("Password Updated");
  }
}
