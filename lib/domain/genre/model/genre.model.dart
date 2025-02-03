import 'package:json_annotation/json_annotation.dart';

part 'genre.model.g.dart';

@JsonSerializable()
class Genre {
  int id;
  String name;

  Genre(this.id, this.name);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

  factory Genre.fromJson(Map<String, dynamic> json) {
    return _$GenreFromJson(json);
  }
}
