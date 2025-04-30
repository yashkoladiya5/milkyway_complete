import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      final firebase = FirebaseFirestore.instance.collection("user");

      await firebase.doc(userId).get().then(
        (value) {
          userData = {};
          final data = value.data();

          userData = data!;
        },
      );
    }

    notifyListeners();
  }
}
