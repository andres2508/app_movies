import 'package:app_movies/domain/movie/model/movie.model.dart';
import 'package:app_movies/domain/search/infrastructure/search.params.dart';
import 'package:app_movies/domain/series/model/serie.model.dart';
import 'package:app_movies/infrastructure/http/http.data_source.dart';

class SearchRepository extends HttpDataSource {
  SearchRepository() : super('/search');

  Future<MoviePaginator> searchMoviesWith(SearchParams params) {
    return getItem(
      path: 'movie',
      queryParameters: params.toJson(),
      itemCreator: MoviePaginator.fromJson,
    );
  }

  Future<TVSeriePaginator> searchSeriesWith(SearchParams params) {
    return getItem(
      path: 'tv',
      queryParameters: params.toJson(),
      itemCreator: TVSeriePaginator.fromJson,
    );
  }
}
