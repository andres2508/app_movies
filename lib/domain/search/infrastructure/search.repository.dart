import 'package:app_movies/domain/search/infrastructure/search.params.dart';
import 'package:app_movies/domain/search/model/search.model.dart';
import 'package:app_movies/infrastructure/http/http.data_source.dart';

class SearchRepository extends HttpDataSource {
  SearchRepository() : super('/search');

  Future<SearchPaginator> searchMoviesWith(SearchParams params) {
    return getItem(
      path: 'movie',
      queryParameters: params.toJson(),
      itemCreator: SearchPaginator.fromJson,
    );
  }

  Future<SearchPaginator> searchSeriesWith(SearchParams params) {
    return getItem(
      path: 'tv',
      queryParameters: params.toJson(),
      itemCreator: SearchPaginator.fromJson,
    );
  }
}
