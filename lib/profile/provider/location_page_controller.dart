import 'package:milkyway/auth/model/location_model.dart';
import 'package:milkyway/constant/app_strings.dart';
import 'package:milkyway/dbhelper/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationPageController extends ChangeNotifier {
  List<LocationModel> _userData = [];

  List<LocationModel> get userData => _userData;

  Future<void> fetchLocationDetails() async {
    final firestore = FirebaseFirestore.instance.collection("user");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(SharedPreferenceKeys.userIdKey);

    await firestore.doc(userId!).collection("location").get().then(
      (value) {
        _userData =
            value.docs.map((e) => LocationModel.fromJson(e.data())).toList();

        print(data);
      },
    );

    notifyListeners();
  }
}
