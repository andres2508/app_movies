import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/infrastructure/json/json_date.converter.dart';
import 'package:app_movies/infrastructure/paginator/paginator.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'serie.model.g.dart';

@JsonSerializable()
class TVSeriePaginator extends Paginator<TVSerie> {
  TVSeriePaginator(
      super.page, super.totalPages, super.totalResults, super.results);

  Map<String, dynamic> toJson() => _$TVSeriePaginatorToJson(this);

  factory TVSeriePaginator.fromJson(Map<String, dynamic> json) {
    return _$TVSeriePaginatorFromJson(json);
  }
}

@JsonSerializable()
class TVSerie extends TMDBEntity {
  String name;
  @JsonKey(name: 'original_name')
  String originalName;
  @JsonKey(name: 'first_air_date')
  @DateTimeConverter()
  DateTime? firstAirDate;

  TVSerie(
      this.name,
      this.originalName,
      this.firstAirDate,
      super.id,
      super.overview,
      super.popularity,
      super.voteAverage,
      super.voteCount,
      super.posterPath,
      super.backdropPath);

  Map<String, dynamic> toJson() => _$TVSerieToJson(this);

  factory TVSerie.fromJson(Map<String, dynamic> json) {
    return _$TVSerieFromJson(json);
  }

  @override
  String getName() => name;

  @override
  TMDBContentType getType() => TMDBContentType.TV_SERIE;
}
