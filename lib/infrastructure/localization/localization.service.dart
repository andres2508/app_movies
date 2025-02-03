import 'package:flutter/material.dart';

class LocalizationObserver {
  Locale? _currentLocale;

  Locale? get locale => _currentLocale;

  void changeTo(Locale locale) {
    _currentLocale = locale;
  }
}
