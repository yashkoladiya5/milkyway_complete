import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constant/app_colors.dart';

class GasBillScreenController extends ChangeNotifier {
  int _selectedGasCategory = 1;
  int _selectedProviderCompany = -1;
  Map<String, dynamic> _bookingOperatorData = {};
  Map<String, dynamic> _payCustomerData = {};
  List<Map<String, dynamic>> _gasBookingProviderList = [];
  List<Map<String, dynamic>> _bookingOperatorDetails = [];
  List<Map<String, dynamic>> _payCustomerDetails = [];

  TextEditingController _gasProviderController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _customerIdController = TextEditingController();

  int get selectedCategory => _selectedGasCategory;
  int get selectedProviderCompany => _selectedProviderCompany;
  Map<String, dynamic> get bookingOperatorData => _bookingOperatorData;
  Map<String, dynamic> get payCustomerData => _payCustomerData;
  List<Map<String, dynamic>> get gasBookingProviderList =>
      _gasBookingProviderList;
  List<Map<String, dynamic>> get bookingOperatorDetails =>
      _bookingOperatorDetails;
  List<Map<String, dynamic>> get payCustomerDetails => _payCustomerDetails;
  TextEditingController get gasProviderController => _gasProviderController;
  TextEditingController get mobileController => _mobileController;
  TextEditingController get customerIdController => _customerIdController;

  void updateCategory({required int index}) {
    _selectedGasCategory = index;
    _selectedProviderCompany = -1;
    _gasProviderController.text = "";
    _mobileController.text = "";
    _bookingOperatorData = {};
    _customerIdController.text = "";
    _payCustomerData = {};
    notifyListeners();
    print("SELECTED GAS CATEGORY : $_selectedGasCategory");
  }

  Future<void> fetchDataOfProviders() async {
    DbHelper dbHelper = DbHelper();
    _gasBookingProviderList = await dbHelper.fetchGasProviderData();

    if (_gasBookingProviderList.isEmpty) {
      print("LIST OF PROVIDERS IS EMPTY");
      return;
    } else {
      print("DATA OF PROVIDERS ${_gasBookingProviderList.length}");
    }

    notifyListeners();
  }

  void updateProviderIndex({required int index}) {
    _selectedProviderCompany = index;
    _gasProviderController.text =
        _gasBookingProviderList[_selectedProviderCompany]["gasProviderName"];
    notifyListeners();
  }

  Future<void> checkMobile(BuildContext context) async {
    _bookingOperatorData = {};
    print("CHECK MOBILE CALLED");
    final text = _mobileController.text;

    if (text.length == 10) {
      print("MOBILE NUMBER VALID");

      DbHelper dbHelper = DbHelper();

      _bookingOperatorDetails = await dbHelper.fetchGasProviderDetails(
          operator: _gasProviderController.text,
          mobile: _mobileController.text);

      if (_bookingOperatorDetails.isEmpty) {
        print("NO OPERATOR");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text("No Operator Found"),
                content: Text("Please Enter Valid Mobile Number"),
                actions: [
                  TextButton(
                      style: ButtonStyle(
                          shape:
                              WidgetStatePropertyAll(BeveledRectangleBorder()),
                          textStyle: WidgetStatePropertyAll(TextStyle(
                              color: HexColor(AppColorsDark.whiteColor))),
                          backgroundColor: WidgetStatePropertyAll(
                              HexColor(AppColorsLight.orangeColor))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(
                            color: HexColor(AppColorsDark.whiteColor)),
                      ))
                ],
                backgroundColor: Colors.white);
          },
        );
      } else {
        print("OPERATOR FOUND");
        _bookingOperatorData = _bookingOperatorDetails[0];
      }

      notifyListeners();
    } else {}
  }

  Future<void> checkCustomerId(BuildContext context) async {
    _payCustomerData = {};
    print("CHECK MOBILE CALLED");
    final text = _customerIdController.text;

    if (text.length == 6) {
      print("Customer ID VALID");

      DbHelper dbHelper = DbHelper();

      _payCustomerDetails = await dbHelper.fetchPayCustomerDetails(
        provider: _gasProviderController.text,
        customerId: _customerIdController.text,
      );

      if (_payCustomerDetails.isEmpty) {
        print("NO OPERATOR");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text("No Operator Found"),
                content: Text("Please Enter Valid Customer Id"),
                actions: [
                  TextButton(
                      style: ButtonStyle(
                          shape:
                              WidgetStatePropertyAll(BeveledRectangleBorder()),
                          textStyle: WidgetStatePropertyAll(TextStyle(
                              color: HexColor(AppColorsDark.whiteColor))),
                          backgroundColor: WidgetStatePropertyAll(
                              HexColor(AppColorsLight.orangeColor))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(
                            color: HexColor(AppColorsDark.whiteColor)),
                      ))
                ],
                backgroundColor: Colors.white);
          },
        );
      } else {
        print("OPERATOR FOUND");
        _payCustomerData = _payCustomerDetails[0];
      }

      notifyListeners();
    } else {}
  }

  void clearData() {
    _selectedProviderCompany = -1;
    _selectedGasCategory = 1;
    _gasProviderController.text = "";
    _mobileController.text = "";
    _customerIdController.text = "";
    _payCustomerData = {};
    _bookingOperatorData = {};
    _gasBookingProviderList = [];
    _payCustomerDetails = [];
    _bookingOperatorDetails = [];

    notifyListeners();
  }
}
