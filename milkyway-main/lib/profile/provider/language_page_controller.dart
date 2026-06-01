import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguagePageController extends ChangeNotifier {
  List<bool> _languageList = [false, false, false, false];

  List<bool> get languageList => _languageList;

  defaultLanguageIndex({required BuildContext context}) {
    context.locale.languageCode == 'en'
        ? _languageList[0] = true
        : context.locale.languageCode == 'hi'
            ? _languageList[1] = true
            : context.locale.languageCode == 'gu'
                ? _languageList[2] = true
                : context.locale.languageCode == 'mr'
                    ? _languageList[3] = true
                    : _languageList[2] = false;
    print("LANGUAGE PAGE CODE ::${context.locale.languageCode}");
    notifyListeners();
  }

  Future<void> updateLanguageIndex(
      {required int index, required BuildContext context}) async {
    for (int i = 0; i < _languageList.length; i++) {
      _languageList[i] = i == index;
    }
    print(_languageList);

    // final languageProvider =
    //     Provider.of<LanguageProvider>(context, listen: false);
    //
    switch (index) {
      case 0:
        context.setLocale(Locale('en'));
        print(context.locale);

        break;
      case 1:
        context.setLocale(Locale('hi'));
        print(context.locale);

        break;
      case 2:
        context.setLocale(Locale('gu'));
        print(context.locale);

        break;
      case 3:
        context.setLocale(Locale('mr'));
        print(context.locale);

        break;
      default:
        context.setLocale(Locale('en'));
    }

    notifyListeners();
  }
}
