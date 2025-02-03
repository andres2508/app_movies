// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_paginator.params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerPaginatorParams _$ServerPaginatorParamsFromJson(
        Map<String, dynamic> json) =>
    ServerPaginatorParams(
      json['language'] as String?,
      (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ServerPaginatorParamsToJson(
        ServerPaginatorParams instance) =>
    <String, dynamic>{
      'language': instance.language,
      'page': instance.page,
    };
