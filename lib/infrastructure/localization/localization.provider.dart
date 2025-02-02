import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

enum LanguageType {
  SPANISH('es'),
  ENGLISH('en');

  final String localeCode;

  const LanguageType(this.localeCode);
}

@riverpod
class MovieLocalizationViewModel extends ChangeNotifier {
  LanguageType _type = LanguageType.SPANISH;

  Locale get locale => Locale(_type.localeCode);

  LanguageType get current => _type;

  void changeToSpanish() {
    changeTo(LanguageType.SPANISH);
  }

  void changeToEnglish() {
    changeTo(LanguageType.ENGLISH);
  }

  void changeTo(LanguageType? type) {
    if (type != null) {
      _type = type;
      notifyListeners();
    }
  }
}
