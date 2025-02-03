import 'package:app_movies/infrastructure/paginator/movie_paginator.params.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Paginator<T> {
  int page;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;
  List<T> results;

  Paginator(this.page, this.totalPages, this.totalResults, this.results);

  bool hasNextPage() => page <= totalPages;

  bool hasPreviousPage() => page >= 1;

  RequestPaginatorParams nextPage() {
    return RequestPaginatorParams.create().withPage(page + 1);
  }

  RequestPaginatorParams previousPage() {
    return RequestPaginatorParams.create().withPage(page - 1);
  }
}
