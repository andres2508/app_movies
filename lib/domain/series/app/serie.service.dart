import 'package:app_movies/domain/series/infrastructure/serie.repository.dart';
import 'package:app_movies/domain/series/model/serie.model.dart';
import 'package:app_movies/infrastructure/paginator/movie_paginator.params.dart';
import 'package:app_movies/infrastructure/paginator/paginator.builder.dart';

class SerieService {
  final SeriesRepository _repository = SeriesRepository();

  Future<PaginatorManager<TVSerie>> findPopularAsPaginator() async {
    final actualPage = await _repository.findPopular(
      params: RequestPaginatorParams.create(),
    );
    return PaginatorManager.create(
        actualPage, (params) => _repository.findPopular(params: params));
  }

  Future<List<TVSerie>> principalPopularTVSeries() async {
    final firstPage = await _repository.findPopular(
      params: RequestPaginatorParams.create(),
    );
    return firstPage.results;
  }

  Future<List<TVSerie>> principalTopRatedTVSeries() async {
    final firstPage = await _repository.findTopRated(
      params: RequestPaginatorParams.create(),
    );
    return firstPage.results;
  }
}
