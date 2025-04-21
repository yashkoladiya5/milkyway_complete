import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:milkyway/constant/app_lists.dart';

class SearchResultController with ChangeNotifier {
  List<String> _searchResultList = [];
  String _query = '';

  List<String> get searchResultList => _searchResultList;
  String get query => _query;

  void updateSearchResults(String query) {
    _query = query;
    _filterResults(query);
    notifyListeners();
  }

  // Filter results based on the query
  void _filterResults(String query) {
    _searchResultList = AppLists().groceries.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
