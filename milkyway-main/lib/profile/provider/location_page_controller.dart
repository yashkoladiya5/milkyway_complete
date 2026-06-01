import 'package:milkyway/auth/model/location_model.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:milkyway/services/backend_api.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);
    final response = await BackendApi.getJson('/users/$userId/locations');
    final locations = response['locations'];

    if (locations is List) {
      _userData = locations
          .map((item) => LocationModel.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList();

      if (locations.isNotEmpty) {
        final firstLocation = Map<String, dynamic>.from(locations.first as Map);
        final locationId = firstLocation['_id']?.toString() ?? '';
        if (locationId.isNotEmpty) {
          prefs.setString(SharedPreferenceKeys.locationIdKey, locationId);
        }
        print("LOCATION ID SET ::: $locationId");
      }

      print(_userData);
    }

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
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);
    String? locationId = prefs.getString(SharedPreferenceKeys.locationIdKey);

    Map<String, dynamic> locationData = {
      "name": _nameController.text,
      "address": _addressController.text,
      "area": _selectedArea,
      "pincode": int.parse(_pincodeController.text),
    };

    await BackendApi.putJson(
      '/users/$userId/locations/$locationId',
      body: locationData,
    );

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

    final response = await BackendApi.postJson(
      '/users/$userId/locations',
      body: newData,
    );

    final location = response['location'];
    if (location is Map<String, dynamic>) {
      final locationId = location['_id']?.toString() ?? '';
      if (locationId.isNotEmpty) {
        prefs.setString(SharedPreferenceKeys.locationIdKey, locationId);
      }
    }

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

  void cleanData() {
    _userData = [];
    _locationData = null;
    _nameController.text = "";
    _addressController.text = "";
    _selectedArea = null;
    _pincodeController.text = "";
    _selectedIndex = 0;

    notifyListeners();
  }
}
