import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/infrastructure/paginator/paginator.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.model.g.dart';

enum SearchType {
  MOVIE,
  TV_SERIE;
}

@JsonSerializable()
class SearchPaginator extends Paginator<SearchEntity> {
  SearchPaginator(
      super.page, super.totalPages, super.totalResults, super.results);

  Map<String, dynamic> toJson() => _$SearchPaginatorToJson(this);

  factory SearchPaginator.fromJson(Map<String, dynamic> json) {
    return _$SearchPaginatorFromJson(json);
  }
}

@JsonSerializable()
class SearchEntity extends TMDBEntity {
  String? name; // This for tv series
  String? title; // This for movies

  SearchEntity(
      this.name,
      this.title,
      super.id,
      super.overview,
      super.popularity,
      super.voteAverage,
      super.voteCount,
      super.posterPath,
      super.backdropPath);

  Map<String, dynamic> toJson() => _$SearchEntityToJson(this);

  factory SearchEntity.fromJson(Map<String, dynamic> json) {
    return _$SearchEntityFromJson(json);
  }
}
