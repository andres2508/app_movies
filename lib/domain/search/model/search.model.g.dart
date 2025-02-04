// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPaginator _$SearchPaginatorFromJson(Map<String, dynamic> json) =>
    SearchPaginator(
      (json['page'] as num).toInt(),
      (json['total_pages'] as num).toInt(),
      (json['total_results'] as num).toInt(),
      (json['results'] as List<dynamic>)
          .map((e) => SearchEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchPaginatorToJson(SearchPaginator instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) => SearchEntity(
      json['name'] as String?,
      json['title'] as String?,
      (json['id'] as num).toInt(),
      json['overview'] as String,
      (json['popularity'] as num).toInt(),
      (json['vote_average'] as num).toDouble(),
      (json['vote_count'] as num).toDouble(),
      json['poster_path'] as String?,
      json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$SearchEntityToJson(SearchEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'name': instance.name,
      'title': instance.title,
    };
