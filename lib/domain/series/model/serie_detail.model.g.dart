// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_detail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVSerieDetail _$TVSerieDetailFromJson(Map<String, dynamic> json) =>
    TVSerieDetail(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['overview'] as String,
      DateTime.parse(json['first_air_date'] as String),
      (json['vote_average'] as num).toDouble(),
      (json['vote_count'] as num).toInt(),
      (json['seasons'] as List<dynamic>)
          .map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['poster_path'] as String,
    );

Map<String, dynamic> _$TVSerieDetailToJson(TVSerieDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'first_air_date': instance.firstAirDate.toIso8601String(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'seasons': instance.seasons.map((e) => e.toJson()).toList(),
      'poster_path': instance.posterPath,
    };
