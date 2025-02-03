import 'package:app_movies/infrastructure/localization/localization.service.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_paginator.params.g.dart';

@JsonSerializable()
class RequestPaginatorParams {
  String? language;
  int? page;

  RequestPaginatorParams(this.language, this.page);

  factory RequestPaginatorParams.create() {
    final locale = serviceLocator<LocalizationObserver>().locale;
    return RequestPaginatorParams(locale?.toLanguageTag(), 1);
  }

  factory RequestPaginatorParams.onlyLang() {
    final locale = serviceLocator<LocalizationObserver>().locale;
    return RequestPaginatorParams(locale?.toLanguageTag(), null);
  }

  RequestPaginatorParams withPage(int page) {
    this.page = page;
    return this;
  }

  Map<String, dynamic> toJson() => _$RequestPaginatorParamsToJson(this);

  factory RequestPaginatorParams.fromJson(Map<String, dynamic> json) {
    return _$RequestPaginatorParamsFromJson(json);
  }
}
