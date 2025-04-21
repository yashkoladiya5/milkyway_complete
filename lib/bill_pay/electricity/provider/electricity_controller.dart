import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/dbhelper/db_helper.dart';

import '../../../constant/app_lists.dart';

class ElectricityController extends ChangeNotifier {
  int _stateSelectedIndex = -1;
  int _selectedElectricity = -1;
  TextEditingController _stateController = TextEditingController();
  TextEditingController _electricityController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  List<Map<String, dynamic>> _electricityProvidersDetail = [];
  Map<String, dynamic> _electricityData = {};

  int get stateSelectedIndex => _stateSelectedIndex;
  int get selectedElectricity => _selectedElectricity;
  TextEditingController get stateController => _stateController;
  TextEditingController get electricityController => _electricityController;
  TextEditingController get mobileController => _mobileController;
  Map<String, dynamic> get electricityData => _electricityData;
  List<Map<String, dynamic>> get electricityProvidersDetail =>
      _electricityProvidersDetail;

  void updateSelectedStateIndex({required int index}) {
    _stateSelectedIndex = index;
    _stateController.text =
        AppLists().mobileRechargeStateList[_stateSelectedIndex];
    notifyListeners();
    print("SELECTED STATE : $_stateSelectedIndex");
  }

  void updateSelectedElectricityIndex({required int index}) {
    _selectedElectricity = index;
    _electricityController.text = AppLists()
        .electricityBillData[_selectedElectricity]["Electricity Provider"];
  }

  Future<void> fetchProvidersData() async {
    DbHelper dbHelper = DbHelper();

    _electricityProvidersDetail = await dbHelper.fetchElectricityData();
    notifyListeners();
  }

  void updateProviderDetails({required int index}) {
    _selectedElectricity = index;
    _electricityController.text =
        _electricityProvidersDetail[_selectedElectricity]
            ["electricityProvider"];

    notifyListeners();
  }

  Future<void> checkElectricityBill(
      {required String state,
      required String provider,
      required String number,
      required BuildContext context}) async {
    DbHelper dbHelper = DbHelper();

    final data = await dbHelper.fetchElectricityDetails(
        state: state, provider: provider, number: number);

    if (data.isEmpty) {
      print("NO DATA OF ELECTRICITY");
      _electricityData = {};
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No Data Found , Enter Valid Details")));
    } else {
      print("DATA OF ELECTRICITY");
      _electricityData = data[0];
    }
    notifyListeners();
  }

  void clearData() {
    _stateSelectedIndex = -1;
    _selectedElectricity = -1;
    _stateController.text = "";
    _electricityController.text = "";
    _mobileController.text = "";

    _electricityData = {};
    _electricityProvidersDetail = [];
    print("DATA CLEARED OF ELECTRICITY");
    notifyListeners();
  }
}
