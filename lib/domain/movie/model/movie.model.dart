import 'package:app_movies/domain/common/entity.model.dart';
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
class Movie extends TMDBEntity {
  String title;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'release_date')
  DateTime releaseDate;

  Movie(
      this.title,
      this.originalTitle,
      this.releaseDate,
      super.id,
      super.overview,
      super.popularity,
      super.voteAverage,
      super.voteCount,
      super.posterPath,
      super.backdropPath);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  @override
  String getName() => title;
}
