import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('es'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'es':
        return '🇪🇸';
      default:
        return '🇺🇸';
    }
  }
}
