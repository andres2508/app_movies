// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_paginator.params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPaginatorParams _$RequestPaginatorParamsFromJson(
        Map<String, dynamic> json) =>
    RequestPaginatorParams(
      json['language'] as String?,
      (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RequestPaginatorParamsToJson(
        RequestPaginatorParams instance) =>
    <String, dynamic>{
      'language': instance.language,
      'page': instance.page,
    };
