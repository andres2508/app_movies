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
      json['overview'] as String,
      (json['popularity'] as num).toDouble(),
      json['backdrop_path'] as String,
      json['poster_path'] as String,
      DateTime.parse(json['release_date'] as String),
      (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate.toIso8601String(),
      'vote_average': instance.voteAverage,
    };
