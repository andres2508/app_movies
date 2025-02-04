import 'package:app_movies/framework/router/movie.module.dart';
import 'package:app_movies/ui/series/detail/serie_detail.view.dart';
import 'package:fluro/fluro.dart';

class SeriesModule extends TMDBModule {
  @override
  List<TMDBRoute> routes() {
    return [
      TMDBRoute(
        '/series/:serieId',
        Handler(
          handlerFunc: (_, parameters) => SerieDetailView(
            serieId: int.parse(parameters['serieId']!.first),
          ),
        ),
      )
    ];
  }
}
