import 'package:app_movies/framework/router/movie.module.dart';
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
      )
    ];
  }
}
