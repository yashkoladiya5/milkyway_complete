import 'package:flutter/cupertino.dart';
import 'package:milkyway/dbhelper/db_helper.dart';

class RechargePlanController extends ChangeNotifier {
  int _selectedCategory = 0;
  int _selectedPlan = -1;
  List<Map<String, dynamic>> _plansList = [];

  int get selectedCategory => _selectedCategory;
  int get selectedPlan => _selectedPlan;
  List<Map<String, dynamic>> get plansList => _plansList;

  void updateCategory({required int index}) {
    _selectedCategory = index;
    notifyListeners();
    print("SELECTED CATEGORY $_selectedCategory");
  }

  Future<void> fetchPopularPlanData({required String operator}) async {
    DbHelper dbHelper = DbHelper();

    _plansList = await dbHelper.fetchPlansData(
        companyValue: operator, planValue: 'Popular');
    notifyListeners();
    if (_plansList.isEmpty) {
      print("NO DATA");
    } else {
      print("PLANS : ${_plansList.length}");
    }
  }

  Future<void> fetchOtherPlansData(
      {required String operator, required String category}) async {
    DbHelper dbHelper = DbHelper();

    _plansList = await dbHelper.fetchPlansData(
        companyValue: operator, planValue: category);
    notifyListeners();
    if (_plansList.isEmpty) {
      print("NO DATA");
    } else {
      print("PLANS : ${_plansList.length}");
    }
  }

  void updatePlanIndex({required int id}) {
    _selectedPlan = id;
    notifyListeners();
    print("SELECTED PLAN INDEX : $_selectedPlan");
  }

  void cleanData() {
    _selectedPlan = -1;
    _selectedCategory = 0;
    _plansList = [];
    notifyListeners();
  }
}
