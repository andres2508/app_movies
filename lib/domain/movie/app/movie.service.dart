import 'package:app_movies/domain/movie/infrastructure/movie.repository.dart';
import 'package:app_movies/domain/movie/model/movie.model.dart';
import 'package:app_movies/domain/movie/model/movie_detail.model.dart';
import 'package:app_movies/infrastructure/paginator/movie_paginator.params.dart';
import 'package:app_movies/infrastructure/paginator/paginator.builder.dart';

class MovieService {
  final MovieRepository _repository = MovieRepository();

  Future<PaginatorManager<Movie>> findPopularAsPaginator() async {
    final actualPage = await _repository.findPopular(
      params: RequestPaginatorParams.create(),
    );
    return PaginatorManager.create(
        actualPage, (params) => _repository.findPopular(params: params));
  }

  Future<PaginatorManager<Movie>> findTopRatedAsPaginator() async {
    final actualPage = await _repository.findTopRated(
      params: RequestPaginatorParams.create(),
    );
    return PaginatorManager.create(
        actualPage, (params) => _repository.findPopular(params: params));
  }

  Future<List<Movie>> principalPopularMovies() async {
    final firstPage = await _repository.findPopular(
      params: RequestPaginatorParams.create(),
    );
    return firstPage.results;
  }

  Future<List<Movie>> principalTopRatedMovies() async {
    final firstPage = await _repository.findTopRated(
      params: RequestPaginatorParams.create(),
    );
    return firstPage.results;
  }

  Future<MovieDetail> findById(int id) {
    return _repository.findById(id);
  }
}
