import 'dart:async';
import 'dart:convert';

import 'package:app_movies/infrastructure/http/authority_strategy/http_authority.strategy.dart';
import 'package:app_movies/infrastructure/http/authority_strategy/movie_authority.strategy.dart';
import 'package:dio/dio.dart';

typedef ItemCreator<S> = S Function(Map<String, dynamic> json);

class HttpDataSource {
  final String _basePath;
  final HttpAuthorityStrategy _strategy;
  final client = Dio();

  HttpDataSource(this._basePath, {HttpAuthorityStrategy? strategy})
      : _strategy = strategy ?? MovieDBAuthorityStrategy() {
    client.options.baseUrl = _strategy.authority;
    client.options.connectTimeout = const Duration(seconds: 10);
    client.options.receiveTimeout = const Duration(seconds: 10);
    client.interceptors.addAll(_strategy.interceptors);
  }

  String _getPath(String? path) {
    String finalPath = _basePath;
    if (path != null && _basePath != '') {
      finalPath = '/$_basePath/$path';
    } else if (path != null) {
      finalPath = path;
    }
    return finalPath;
  }

  Future<List<X>> getList<X>(
      {String? path,
      required ItemCreator<X> itemCreator,
      Map<String, dynamic>? queryParameters}) async {
    var response =
        await client.get(_getPath(path), queryParameters: queryParameters);
    Iterable jsonIterator = jsonDecode(response.data);
    final list = List<X>.from(jsonIterator.map((data) => itemCreator(data)));
    return Future.value(list);
  }

  Future<X> getItem<X>(
      {String? path,
      required ItemCreator<X> itemCreator,
      Map<String, dynamic>? queryParameters}) async {
    var response =
        await client.get(_getPath(path), queryParameters: queryParameters);
    final json = jsonDecode(response.data);
    final mapped = itemCreator(json);
    return Future.value(mapped);
  }

  Future<X> post<X>(
      {String? path,
      dynamic body,
      ItemCreator<X>? itemCreator,
      Map<String, dynamic>? queryParameters}) async {
    final data = json.encode(body);
    var response = await client.post(_getPath(path),
        data: data, queryParameters: queryParameters);
    if (itemCreator != null) {
      final json = jsonDecode(response.data);
      return Future.value(itemCreator(json));
    } else {
      return Future.value();
    }
  }

  Future<X> put<X>(
      {String? path, dynamic body, ItemCreator<X>? itemCreator}) async {
    var response = await client.put(_getPath(path));
    if (itemCreator != null) {
      final json = jsonDecode(response.data);
      return Future.value(itemCreator(json));
    } else {
      return Future.value();
    }
  }

  Future<X> delete<X>(
      {String? path,
      Map<String, String>? queryParameters,
      ItemCreator<X>? itemCreator}) async {
    var response =
        await client.delete(_getPath(path), queryParameters: queryParameters);
    if (itemCreator != null) {
      final json = jsonDecode(response.data);
      return Future.value(itemCreator(json));
    } else {
      return Future.value();
    }
  }
}
