import 'package:app_movies/framework/router/error_page.view.dart';
import 'package:app_movies/framework/router/movie.module.dart';
import 'package:app_movies/infrastructure/locator/service.locator.dart';
import 'package:app_movies/main.dart';
import 'package:fluro/fluro.dart';

class MovieRouterBuilder {
  final List<TMDBRoute> _routes;

  MovieRouterBuilder._intern(this._routes);

  factory MovieRouterBuilder.initialize() {
    final List<TMDBRoute> routes = [];
    // Initialize routes
    for (var module in modules) {
      routes.addAll(module.routes());
    }
    return MovieRouterBuilder._intern(routes);
  }

  FluroRouter build() {
    // Initialize all routes
    final router = serviceLocator<FluroRouter>();
    _routes.forEach((it) => router.define(it.path, handler: it.handler));
    // Handler route not found
    // ToDo: validate if possible extract router not found path, in GoRouter is possible
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) => ErrorPageView.of('Route was not found!!!'),
    );
    return router;
  }
}
