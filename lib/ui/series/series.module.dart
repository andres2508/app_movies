import 'package:app_movies/domain/common/entity.model.dart';
import 'package:app_movies/framework/router/movie.module.dart';
import 'package:app_movies/ui/all/all_content.view.dart';
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
      ),
      TMDBRoute(
        '/series-popular',
        Handler(
          handlerFunc: (_, parameters) => AllContentListView(
            type: TMDBContentType.TV_SERIE,
            filter: AllContentType.POPULAR,
          ),
        ),
      ),
      TMDBRoute(
        '/series-top-rated',
        Handler(
          handlerFunc: (_, parameters) => AllContentListView(
            type: TMDBContentType.TV_SERIE,
            filter: AllContentType.TOP_RATED,
          ),
        ),
      )
    ];
  }
}
