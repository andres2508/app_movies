import 'package:app_movies/infrastructure/localization/localization.service.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_paginator.params.g.dart';

@JsonSerializable()
class ServerPaginatorParams {
  String? language;
  int? page;

  ServerPaginatorParams(this.language, this.page);

  factory ServerPaginatorParams.create() {
    final locale = serviceLocator<LocalizationObserver>().locale;
    return ServerPaginatorParams(locale?.toLanguageTag(), 1);
  }

  ServerPaginatorParams withPage(int page) {
    this.page = page;
    return this;
  }

  Map<String, dynamic> toJson() => _$ServerPaginatorParamsToJson(this);

  factory ServerPaginatorParams.fromJson(Map<String, dynamic> json) {
    return _$ServerPaginatorParamsFromJson(json);
  }
}
