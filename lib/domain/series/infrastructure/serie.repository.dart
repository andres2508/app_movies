import 'package:app_movies/domain/series/model/serie.model.dart';
import 'package:app_movies/domain/series/model/serie_detail.model.dart';
import 'package:app_movies/infrastructure/http/http.data_source.dart';
import 'package:app_movies/infrastructure/localization/request_params.params.dart';
import 'package:app_movies/infrastructure/paginator/movie_paginator.params.dart';

class SeriesRepository extends HttpDataSource {
  SeriesRepository() : super('/tv');

  Future<TVSeriePaginator> findPopular({RequestPaginatorParams? params}) {
    return getItem(
      path: 'popular',
      queryParameters: params?.toJson(),
      itemCreator: TVSeriePaginator.fromJson,
    );
  }

  Future<TVSeriePaginator> findTopRated({RequestPaginatorParams? params}) {
    return getItem(
      path: 'top_rated',
      queryParameters: params?.toJson(),
      itemCreator: TVSeriePaginator.fromJson,
    );
  }

  Future<TVSerieDetail> findById(int id) {
    return getItem(
      path: '$id',
      queryParameters: RequestLangParams.build().toJson(),
      itemCreator: TVSerieDetail.fromJson,
    );
  }
}
