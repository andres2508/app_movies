import 'package:app_movies/domain/series/season/model/season.model.dart';
import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'serie_detail.model.g.dart';

@JsonSerializable()
class TVSerieDetail {
  int id;
  String name;
  String overview;
  @JsonKey(name: 'first_air_date')
  DateTime firstAirDate;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  List<Season> seasons;
  @JsonKey(name: 'poster_path')
  String posterPath;

  TVSerieDetail(this.id, this.name, this.overview, this.firstAirDate,
      this.voteAverage, this.voteCount, this.seasons, this.posterPath);

  Map<String, dynamic> toJson() => _$TVSerieDetailToJson(this);

  factory TVSerieDetail.fromJson(Map<String, dynamic> json) {
    return _$TVSerieDetailFromJson(json);
  }

  String posterUrl() =>
      '${GlobalMovieConfiguration.controller.imageServer}$posterPath';
}
