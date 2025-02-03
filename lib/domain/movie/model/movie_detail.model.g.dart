// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['overview'] as String,
      DateTime.parse(json['release_date'] as String),
      (json['vote_average'] as num).toDouble(),
      (json['vote_count'] as num).toInt(),
      (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['poster_path'] as String,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'release_date': instance.releaseDate.toIso8601String(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'poster_path': instance.posterPath,
    };
