import 'package:app_movies/domain/movie/model/movie.model.dart';
import 'package:app_movies/domain/movie/model/movie_detail.model.dart';
import 'package:app_movies/infrastructure/http/http.data_source.dart';
import 'package:app_movies/infrastructure/localization/request_params.params.dart';
import 'package:app_movies/infrastructure/paginator/movie_paginator.params.dart';

class MovieRepository extends HttpDataSource {
  MovieRepository() : super('/movie');

  Future<MoviePaginator> findPopular({RequestPaginatorParams? params}) {
    return getItem(
      path: 'popular',
      queryParameters: params?.toJson(),
      itemCreator: MoviePaginator.fromJson,
    );
  }

  Future<MoviePaginator> findTopRated({RequestPaginatorParams? params}) {
    return getItem(
      path: 'top_rated',
      queryParameters: params?.toJson(),
      itemCreator: MoviePaginator.fromJson,
    );
  }

  Future<MovieDetail> findById(int id) {
    return getItem(
      path: '$id',
      queryParameters: RequestLangParams.build().toJson(),
      itemCreator: MovieDetail.fromJson,
    );
  }
}
