import 'package:flutter/cupertino.dart';

class LoadingController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  changeLoad() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
