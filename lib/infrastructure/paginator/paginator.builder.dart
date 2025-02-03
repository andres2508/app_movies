import 'package:app_movies/infrastructure/paginator/movie_paginator.params.dart';
import 'package:app_movies/infrastructure/paginator/paginator.model.dart';

class PaginatorManager<T> {
  Paginator<T> actualPage;
  final Future<Paginator<T>> Function(ServerPaginatorParams params) creator;

  PaginatorManager.create(this.actualPage, this.creator);

  bool hasNextPage() => actualPage.hasNextPage();

  bool hasPreviousPage() => actualPage.hasPreviousPage();

  List<T> get items => actualPage.results;

  Future<PaginatorManager<T>> nextPage() async {
    if (hasNextPage()) {
      actualPage = await creator.call(actualPage.nextPage());
    }
    return this; // If not more, return same page
  }

  Future<PaginatorManager<T>> previousPage() async {
    if (hasPreviousPage()) {
      actualPage = await creator.call(actualPage.previousPage());
    }
    return this; // If not previous, return same page
  }
}
