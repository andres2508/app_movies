import 'package:app_movies/domain/movie/app/movie.service.dart';
import 'package:app_movies/domain/movie/model/movie.model.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose((ref) {
  return HomeViewModel();
});

class HomeViewModel extends ChangeNotifier {
  final MovieService _service = serviceLocator<MovieService>();

  final List<Movie> _topRated = [];
  final List<Movie> _popular = [];

  List<Movie> get topRated => _topRated;

  List<Movie> get popular => _popular;

  Future<void> loadRequired() async {
    // Load all and async process
    final futures = await Future.wait([
      _service.principalPopularMovies(),
      _service.principalTopRatedMovies(),
    ]);
    // Initialize all movie list
    _popular.addAll(futures[0]);
    _topRated.addAll(futures[1]);
    notifyListeners();
  }
}
