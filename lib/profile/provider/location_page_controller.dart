import 'package:milkyway/auth/model/location_model.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationPageController extends ChangeNotifier {
  List<LocationModel> _userData = [];
  LocationModel? _locationData;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  String? _selectedArea;
  TextEditingController _pincodeController = TextEditingController();
  int _selectedIndex = 0;

  List<LocationModel> get userData => _userData;
  LocationModel? get locationData => _locationData;
  TextEditingController get nameController => _nameController;
  TextEditingController get addressController => _addressController;
  String? get selectedArea => _selectedArea;
  TextEditingController get pincodeController => _pincodeController;
  int get selectedIndex => _selectedIndex;

  Future<void> fetchLocationDetails() async {
    final firestore = FirebaseFirestore.instance.collection("user");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

    await firestore.doc(userId!).collection("location").get().then(
      (value) async {
        _userData =
            value.docs.map((e) => LocationModel.fromJson(e.data())).toList();
        String locationId = "";
        for (int i = 0; i < value.docs.length; i++) {
          final docData = value.docs[i].data();
          for (int j = 0; j < _userData.length; j++) {
            if (docData["name"] == _userData[j].name &&
                docData["address"] == _userData[j].address &&
                docData["area"] == _userData[j].area &&
                docData["pincode"] == _userData[j].pincode &&
                docData["mobileNumber"] == _userData[i].mobileNumber &&
                docData["email"] == _userData[j].email) {
              locationId = value.docs[i].id;
              break;
            }
          }
        }

        print(locationId);
        SharedPreferences preferences = await SharedPreferences.getInstance();

        preferences.setString(SharedPreferenceKeys.locationIdKey, locationId);
        print("LOCATION ID SET ::: $locationId");
        print(_userData);
      },
    );

    notifyListeners();
  }

  void editLocationDetailsFetch(LocationModel data) {
    _nameController.text = data.name;
    _addressController.text = data.address;
    _selectedArea = data.area;
    _pincodeController.text = data.pincode.toString();

    notifyListeners();
  }

  Future<void> editData({required int index}) async {
    final firebase = await FirebaseFirestore.instance.collection("user");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

    Map<String, dynamic> locationData = {
      "name": _nameController.text,
      "address": _addressController.text,
      "area": _selectedArea,
      "pincode": int.parse(_pincodeController.text),
    };

    String? locationId = prefs.getString(SharedPreferenceKeys.locationIdKey);

    await firebase
        .doc(userId!)
        .collection("location")
        .doc(locationId!)
        .set(locationData, SetOptions(merge: true));

    print("DATA UPDATED");

    _userData[index].name = _nameController.text;
    _userData[index].address = _addressController.text;
    _userData[index].area = _selectedArea!;
    _userData[index].pincode = int.parse(_pincodeController.text);

    _nameController.text = "";
    _pincodeController.text = "";
    _addressController.text = "";
    _selectedArea = null;
    notifyListeners();
  }

  Future<void> addLocation() async {
    Map<String, dynamic> newData = {
      "name": _nameController.text,
      "address": _addressController.text,
      "area": _selectedArea,
      "pincode": int.parse(_pincodeController.text),
      "mobileNumber": _userData[0].mobileNumber,
      "email": _userData[0].email,
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

    final firestore = await FirebaseFirestore.instance
        .collection("user")
        .doc(userId!)
        .collection("location");

    await firestore.add(newData);

    LocationModel locationModel = LocationModel.fromJson(newData);
    _userData.add(locationModel);
    print("DATA ADDED TO FIREBASE");
    _nameController.text = "";
    _pincodeController.text = "";
    _addressController.text = "";
    _selectedArea = null;
    notifyListeners();
  }

  void changeArea({required String newValue}) {
    _selectedArea = newValue;
    notifyListeners();
  }

  void changeSelectedIndex({required int index}) {
    _selectedIndex = index;
    notifyListeners();
    print("SELECTED INDEX OF LOCATION CONTAINER:::: ${_selectedIndex}");
  }
}
