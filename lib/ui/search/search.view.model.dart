import 'package:app_movies/domain/search/app/search.service.dart';
import 'package:app_movies/domain/search/model/search.model.dart';
import 'package:app_movies/framework/viewModel/base.view.model.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:app_movies/infrastructure/paginator/paginator.builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchViewModelProvider = ChangeNotifierProvider.autoDispose((_) {
  return SearchViewModel();
});

class SearchViewModel extends BaseViewModel {
  final SearchService _service = serviceLocator<SearchService>();
  final List<SearchEntity> _found = [];
  String _searchQuery = '';
  SearchType _filter = SearchType.MOVIE;
  PaginatorManager<SearchEntity>? _actualPage;

  List<SearchEntity> get content => _found;

  SearchType get currentType => _filter;

  void initialize(String label) {
    _searchQuery = label;
  }

  Future<void> searchMovies() async {
    await runWithHandlingError(() async {
      _actualPage = await _service.searchMoviesWith(_searchQuery);
      _found.clear();
      _found.addAll(_actualPage!.items);
    });
    notifyListeners();
  }

  Future<void> searchSeries() async {
    await runWithHandlingError(() async {
      _actualPage = await _service.searchSeriesWith(_searchQuery);
      _found.clear();
      _found.addAll(_actualPage!.items);
    });
    notifyListeners();
  }

  changeType(SearchType value) {
    _filter = value;
    switch (_filter) {
      case SearchType.MOVIE:
        searchMovies();
        break;
      case SearchType.TV_SERIE:
        searchSeries();
        break;
    }
    notifyListeners();
  }

  Future<void> nextPage() async {
    await runWithHandlingError(() async {
      if (_actualPage != null && _actualPage!.hasNextPage()) {
        _actualPage = await _actualPage!.nextPage();
        _found.addAll(_actualPage!.items);
      }
    });
    notifyListeners();
  }
}
