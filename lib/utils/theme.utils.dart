import 'package:flutter/material.dart';

extension ThemeUtils on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}
