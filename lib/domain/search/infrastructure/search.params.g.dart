// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchParams _$SearchParamsFromJson(Map<String, dynamic> json) => SearchParams(
      json['query'] as String,
      json['include_adult'] as bool?,
      json['language'] as String?,
      (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchParamsToJson(SearchParams instance) =>
    <String, dynamic>{
      'query': instance.query,
      'include_adult': instance.includeAdult,
      'language': instance.language,
      'page': instance.page,
    };
