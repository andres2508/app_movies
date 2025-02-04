import 'package:app_movies/infrastructure/localization/localization.service.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:app_movies/infrastructure/paginator/movie_paginator.params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.params.g.dart';

@JsonSerializable()
class SearchParams {
  final String query;
  @JsonKey(name: 'include_adult')
  bool? includeAdult = false; //ToDo: control parental for default
  String? language;
  int? page = 1;

  SearchParams(this.query, this.includeAdult, this.language, this.page);

  factory SearchParams.create(String query) {
    final locale = serviceLocator<LocalizationObserver>().locale;
    return SearchParams(query, false, locale?.toLanguageTag(), 1);
  }

  factory SearchParams.from(RequestPaginatorParams params, String label) {
    return SearchParams(label, false, params.language, params.page);
  }

  SearchParams withPage(int page) {
    this.page = page;
    return this;
  }

  Map<String, dynamic> toJson() => _$SearchParamsToJson(this);

  factory SearchParams.fromJson(Map<String, dynamic> json) {
    return _$SearchParamsFromJson(json);
  }
}
