import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageProvider with ChangeNotifier {
  Future<void> changeLanguage(BuildContext context, Locale newLocale) async {
    await context.setLocale(newLocale);
    notifyListeners();
  }
}
