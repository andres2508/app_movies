// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['episode_count'] as num).toInt(),
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'episode_count': instance.episodeCount,
    };
