import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:app_movies/infrastructure/paginator/paginator.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.model.g.dart';

@JsonSerializable()
class MoviePaginator extends Paginator<Movie> {
  MoviePaginator(
      super.page, super.totalPages, super.totalResults, super.results);

  Map<String, dynamic> toJson() => _$MoviePaginatorToJson(this);

  factory MoviePaginator.fromJson(Map<String, dynamic> json) {
    return _$MoviePaginatorFromJson(json);
  }
}

@JsonSerializable()
class Movie {
  int id;
  String title;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  DateTime releaseDate;
  @JsonKey(name: 'vote_average')
  double voteAverage;

  Movie(this.id, this.title, this.originalTitle, this.overview, this.popularity,
      this.backdropPath, this.posterPath, this.releaseDate, this.voteAverage);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  String posterUrl() =>
      '${GlobalMovieConfiguration.controller.imageServer}$posterPath';
}
