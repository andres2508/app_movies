import 'package:app_movies/domain/genre/model/genre.model.dart';
import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.model.g.dart';

@JsonSerializable()
class MovieDetail {
  int id;
  String title;
  String overview;
  @JsonKey(name: 'release_date')
  DateTime releaseDate;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  List<Genre> genres;
  @JsonKey(name: 'poster_path')
  String posterPath;

  MovieDetail(this.id, this.title, this.overview, this.releaseDate,
      this.voteAverage, this.voteCount, this.genres, this.posterPath);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailFromJson(json);
  }

  String posterUrl() =>
      '${GlobalMovieConfiguration.controller.imageServer}$posterPath';
}
