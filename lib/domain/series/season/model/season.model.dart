import 'package:json_annotation/json_annotation.dart';

part 'season.model.g.dart';

@JsonSerializable()
class Season {
  int id;
  String name;
  @JsonKey(name: 'episode_count')
  int episodeCount;

  Season(this.id, this.name, this.episodeCount);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);

  factory Season.fromJson(Map<String, dynamic> json) {
    return _$SeasonFromJson(json);
  }
}
