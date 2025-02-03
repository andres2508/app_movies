import 'package:app_movies/domain/movie/model/movie.model.dart';
import 'package:app_movies/infrastructure/http/http.data_source.dart';
import 'package:app_movies/infrastructure/paginator/movie_paginator.params.dart';

class MovieRepository extends HttpDataSource {
  MovieRepository() : super('/movie');

  Future<MoviePaginator> findPopular({ServerPaginatorParams? params}) {
    return getItem(
      path: 'popular',
      queryParameters: params?.toJson(),
      itemCreator: MoviePaginator.fromJson,
    );
  }

  Future<MoviePaginator> findTopRated({ServerPaginatorParams? params}) {
    return getItem(
      path: 'top_rated',
      queryParameters: params?.toJson(),
      itemCreator: MoviePaginator.fromJson,
    );
  }
}
