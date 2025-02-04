import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:json_annotation/json_annotation.dart';

enum TMDBContentType {
  MOVIE,
  TV_SERIE;
}

abstract class TMDBEntity {
  int id;
  String overview;
  int popularity;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  double voteCount;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  TMDBEntity(this.id, this.overview, this.popularity, this.voteAverage,
      this.voteCount, this.posterPath, this.backdropPath);

  String posterUrl() =>
      '${GlobalMovieConfiguration.controller.imageServer}$posterPath';

  String getName();

  TMDBContentType getType();

  @override
  int get hashCode => id.hashCode;
}
