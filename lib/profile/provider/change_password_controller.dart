import 'package:flutter/cupertino.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    final firestore = FirebaseFirestore.instance.collection("user");

    await firestore.doc(userId!).get().then(
      (value) {
        final data = value.data();

        _userData = data!;
        print("USER DATA $_userData");
      },
    );

    notifyListeners();
  }

  String? validateOldPassword(String value) {
    if (value.isEmpty) {
      return "Required Field";
    } else if (value != _userData["password"]) {
      return "Password Does not match with old password";
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
    _userData["password"] = _newPasswordController.text;
    _userData["confirmPassword"] = _confirmPasswordController.text;
    final firestore = FirebaseFirestore.instance.collection("user");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

    await firestore.doc(userId!).update(_userData);
    print("USER DATA ::: $_userData");
    print("Password Updated");
  }
}
