import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/domain/movie/app/movie.service.dart';
import 'package:app_movies/domain/search/model/search.model.dart';
import 'package:app_movies/domain/series/app/serie.service.dart';
import 'package:app_movies/framework/viewModel/base.view.model.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider((ref) {
  return HomeViewModel();
});

class HomeViewModel extends BaseViewModel {
  final MovieService _movieService = serviceLocator<MovieService>();
  final SerieService _serieService = serviceLocator<SerieService>();

  final List<TMDBEntity> _topRated = [];
  final List<TMDBEntity> _popular = [];
  SearchType _searchType = SearchType.MOVIE;

  List<TMDBEntity> get topRated => _topRated;

  List<TMDBEntity> get popular => _popular;

  SearchType get type => _searchType;

  bool get isMovieType => _searchType == SearchType.MOVIE;

  Future<void> loadMovieRequired() async {
    await run(() async {
      // Load all and async process
      final futures = await Future.wait([
        _movieService.principalPopularMovies(),
        _movieService.principalTopRatedMovies(),
      ]);
      // Initialize all movie list
      _popular.addAll(futures[0]);
      _topRated.addAll(futures[1]);
    });
    notifyListeners();
  }

  Future<void> loadSeriesRequired() async {
    await run(() async {
      // Load all and async process
      final futures = await Future.wait([
        _serieService.principalPopularTVSeries(),
        _serieService.principalTopRatedTVSeries(),
      ]);
      // Initialize all movie list
      _popular.addAll(futures[0]);
      _topRated.addAll(futures[1]);
    });
    notifyListeners();
  }

  changeType(SearchType value) {
    // Clear all selections
    _popular.clear();
    _topRated.clear();
    // Update and load by type
    _searchType = value;
    switch (_searchType) {
      case SearchType.MOVIE:
        loadMovieRequired();
        break;
      case SearchType.TV_SERIE:
        loadSeriesRequired();
        break;
    }
    notifyListeners();
  }
}
