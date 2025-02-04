import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/framework/router/movie.module.dart';
import 'package:app_movies/ui/all/all_content.view.dart';
import 'package:app_movies/ui/movie/detail/movie_detail.view.dart';
import 'package:fluro/fluro.dart';

class MoviesModule extends TMDBModule {
  @override
  List<TMDBRoute> routes() {
    return [
      TMDBRoute(
        '/movie/:movieId',
        Handler(
          handlerFunc: (_, parameters) => MovieDetailView(
            movieId: int.parse(parameters['movieId']!.first),
          ),
        ),
      ),
      TMDBRoute(
        '/movie-popular',
        Handler(
          handlerFunc: (_, __) => AllContentListView(
            type: TMDBContentType.MOVIE,
            filter: AllContentType.POPULAR,
          ),
        ),
      ),
      TMDBRoute(
        '/movie-top-rated',
        Handler(
          handlerFunc: (_, __) => AllContentListView(
            type: TMDBContentType.MOVIE,
            filter: AllContentType.TOP_RATED,
          ),
        ),
      )
    ];
  }
}
