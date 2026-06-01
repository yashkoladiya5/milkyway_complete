import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPageController extends ChangeNotifier {
  String? _stateValue;
  bool _isAddressFieldTouched = false;
  bool _isNameFieldTouched = false;
  bool _isPincodeFieldTouched = false;
  bool _isNumberFieldTouched = false;
  bool _isEmailFieldTouched = false;
  bool _isPasswordFieldTouched = false;
  bool _isConfirmPasswordFieldTouched = false;
  bool _isStateFieldTouched = false;
  TextEditingController _stateController = TextEditingController();

  String? get stateValue => _stateValue;
  bool get isNameFieldTouched => _isNameFieldTouched;
  bool get isNumberFieldTouched => _isNumberFieldTouched;
  bool get isEmailFieldTouched => _isEmailFieldTouched;
  bool get isPasswordFieldTouched => _isPasswordFieldTouched;
  bool get isConfirmPasswordFieldTouched => _isConfirmPasswordFieldTouched;
  bool get isPincodeFieldTouched => _isPincodeFieldTouched;
  bool get isStateFieldTouched => _isStateFieldTouched;
  bool get isAddressFieldTouched => _isAddressFieldTouched;
  TextEditingController get stateController => _stateController;

  setAddressField() {
    _isAddressFieldTouched = true;
    notifyListeners();
  }

  setStateField() {
    _isStateFieldTouched = true;
    notifyListeners();
  }

  setNameField() {
    _isNameFieldTouched = true;
    notifyListeners();
  }

  setNewState(String newVal) {
    _stateValue = newVal;
    notifyListeners();
  }

  setDefault() {
    _stateValue = null;
    notifyListeners();
  }

  setNumberField() {
    _isNumberFieldTouched = true;
    notifyListeners();
  }

  setEmailField() {
    _isEmailFieldTouched = true;
    notifyListeners();
  }

  setConfirmPasswordField() {
    _isConfirmPasswordFieldTouched = true;
    notifyListeners();
  }

  setPasswordField() {
    _isPasswordFieldTouched = true;
    notifyListeners();
  }

  setPincodeField() {
    _isPincodeFieldTouched = true;
    notifyListeners();
  }

  setStateTextFieldData(String newVal) {
    _stateController.text = newVal;
    print("TEXT === ${_stateController.text}");
    notifyListeners();
  }

  setDefaultToAllFields() {
    _isAddressFieldTouched = false;
    _isNameFieldTouched = false;
    _isPincodeFieldTouched = false;
    _isNumberFieldTouched = false;
    _isEmailFieldTouched = false;
    _isPasswordFieldTouched = false;
    _isConfirmPasswordFieldTouched = false;
    _isStateFieldTouched = false;
    _stateController.text = "";
    notifyListeners();
  }
}
