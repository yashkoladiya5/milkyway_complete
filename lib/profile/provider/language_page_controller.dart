import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkyway/provider/language_controller.dart';
import 'package:provider/provider.dart';

class LanguagePageController extends ChangeNotifier {
  List<bool> _languageList = [false, false, false, false];

  List<bool> get languageList => _languageList;

  Future<void> updateLanguageIndex(
      {required int index, required BuildContext context}) async {
    for (int i = 0; i < _languageList.length; i++) {
      _languageList[i] = i == index;
    }
    print(_languageList);
    if (_languageList[0] == true) {
      Provider.of<LanguageProvider>(context, listen: false).selectedLanguage =
          "en";
    } else if (_languageList[1] == true) {
      Provider.of<LanguageProvider>(context, listen: false).selectedLanguage =
          "hi";
    } else if (_languageList[2] == true) {
      Provider.of<LanguageProvider>(context, listen: false).selectedLanguage =
          "gu";
    } else if (_languageList[3] == true) {
      Provider.of<LanguageProvider>(context, listen: false).selectedLanguage =
          "mr";
    }

    notifyListeners();
  }
}
