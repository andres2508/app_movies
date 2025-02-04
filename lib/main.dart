import 'package:app_movies/app.dart';
import 'package:app_movies/framework/router/movie.module.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:app_movies/ui/home/home.module.dart';
import 'package:app_movies/ui/movie/movie.module.dart';
import 'package:app_movies/ui/search/search.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<TMDBModule> modules = [
  HomeModule(),
  MoviesModule(),
  SearchModule(),
];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(ProviderScope(child: MovieMobileApp()));
}
