import 'package:app_movies/framework/router/movie.module.dart';
import 'package:app_movies/ui/search/search.view.dart';
import 'package:fluro/fluro.dart';

class SearchModule extends TMDBModule {
  @override
  List<TMDBRoute> routes() {
    return [
      TMDBRoute(
        '/search/:query',
        Handler(
          handlerFunc: (_, params) => SearchView(query: params['query']!.first),
        ),
      )
    ];
  }
}
