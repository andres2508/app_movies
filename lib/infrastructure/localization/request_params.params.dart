import 'package:app_movies/infrastructure/localization/localization.service.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_params.params.g.dart';

@JsonSerializable()
class RequestLangParams {
  String? language;

  RequestLangParams(this.language);

  factory RequestLangParams.build() {
    final locale = serviceLocator<LocalizationObserver>().locale;
    return RequestLangParams(locale?.toLanguageTag());
  }

  Map<String, dynamic> toJson() => _$RequestLangParamsToJson(this);

  factory RequestLangParams.fromJson(Map<String, dynamic> json) {
    return _$RequestLangParamsFromJson(json);
  }
}
