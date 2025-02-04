import 'package:app_movies/domain/search/infrastructure/search.params.dart';
import 'package:app_movies/domain/search/infrastructure/search.repository.dart';
import 'package:app_movies/domain/search/model/search.model.dart';
import 'package:app_movies/infrastructure/paginator/paginator.builder.dart';

class SearchService {
  final SearchRepository _repository = SearchRepository();

  Future<PaginatorManager<SearchEntity>> searchMoviesWith(String label) async {
    final actualPage =
        await _repository.searchMoviesWith(SearchParams.create(label));
    return PaginatorManager.create(actualPage, (params) {
      final searchParams = SearchParams.from(params, label);
      return _repository.searchMoviesWith(searchParams);
    });
  }

  Future<PaginatorManager<SearchEntity>> searchSeriesWith(String label) async {
    final actualPage =
        await _repository.searchSeriesWith(SearchParams.create(label));
    return PaginatorManager.create(actualPage, (params) {
      final searchParams = SearchParams.from(params, label);
      return _repository.searchMoviesWith(searchParams);
    });
  }
}
