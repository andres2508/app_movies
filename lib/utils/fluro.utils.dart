import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

extension FluroUtils on BuildContext {
  pop() {
    serviceLocator<FluroRouter>().pop(this);
  }

  // Important: all args come from the route path, example movies/:id -> movies/123
  go(String route) {
    serviceLocator<FluroRouter>().navigateTo(this, route);
  }
}