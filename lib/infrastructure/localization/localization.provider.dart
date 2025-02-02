import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LanguageType {
  SPANISH('es'),
  ENGLISH('en');

  final String localeCode;

  const LanguageType(this.localeCode);
}

final movieLocalizationViewModelProvider =
    ChangeNotifierProvider<MovieLocalizationViewModel>((ref) {
  return MovieLocalizationViewModel();
});

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

  void toggleLang() {
    if (_type == LanguageType.SPANISH) {
      changeToEnglish();
    } else {
      changeToSpanish();
    }
  }

  void changeTo(LanguageType type) {
    print("into changeTo: $type");
    _type = type;
    notifyListeners();
  }
}
