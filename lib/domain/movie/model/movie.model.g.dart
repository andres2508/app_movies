// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviePaginator _$MoviePaginatorFromJson(Map<String, dynamic> json) =>
    MoviePaginator(
      (json['page'] as num).toInt(),
      (json['total_pages'] as num).toInt(),
      (json['total_results'] as num).toInt(),
      (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviePaginatorToJson(MoviePaginator instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['title'] as String,
      json['original_title'] as String,
      _$JsonConverterFromJson<String, DateTime?>(
          json['release_date'], const DateTimeConverter().fromJson),
      (json['id'] as num).toInt(),
      json['overview'] as String,
      (json['popularity'] as num).toInt(),
      (json['vote_average'] as num).toDouble(),
      (json['vote_count'] as num).toDouble(),
      json['poster_path'] as String?,
      json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'release_date': const DateTimeConverter().toJson(instance.releaseDate),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
