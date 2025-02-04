// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVSeriePaginator _$TVSeriePaginatorFromJson(Map<String, dynamic> json) =>
    TVSeriePaginator(
      (json['page'] as num).toInt(),
      (json['total_pages'] as num).toInt(),
      (json['total_results'] as num).toInt(),
      (json['results'] as List<dynamic>)
          .map((e) => TVSerie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TVSeriePaginatorToJson(TVSeriePaginator instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

TVSerie _$TVSerieFromJson(Map<String, dynamic> json) => TVSerie(
      json['name'] as String,
      json['original_name'] as String,
      _$JsonConverterFromJson<String, DateTime?>(
          json['first_air_date'], const DateTimeConverter().fromJson),
      (json['id'] as num).toInt(),
      json['overview'] as String,
      (json['popularity'] as num).toInt(),
      (json['vote_average'] as num).toDouble(),
      (json['vote_count'] as num).toDouble(),
      json['poster_path'] as String?,
      json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$TVSerieToJson(TVSerie instance) => <String, dynamic>{
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'name': instance.name,
      'original_name': instance.originalName,
      'first_air_date': const DateTimeConverter().toJson(instance.firstAirDate),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
