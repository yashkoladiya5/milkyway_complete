import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/app_strings.dart';
import 'package:milkyway/services/backend_api.dart';

class ProfileScreenController extends ChangeNotifier {
  bool _isSelected = false;
  Map<String, dynamic> userData = {};

  bool get isSelected => _isSelected;

  void updateSelected() {
    _isSelected = !_isSelected;

    notifyListeners();
  }

  fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

    if (userId == "") {
      print("NOT FOUND");
    } else {
      print("FOUND :::: $userId");
      final response = await BackendApi.getJson('/users/$userId');
      userData = response['user'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(response['user'] as Map)
          : {};
    }

    notifyListeners();
  }
}
