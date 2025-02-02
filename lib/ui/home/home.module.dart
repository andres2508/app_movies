import 'package:app_movies/framework/router/movie.module.dart';
import 'package:app_movies/ui/home/home.view.dart';
import 'package:fluro/fluro.dart';

class HomeModule extends MovieModule {
  @override
  List<MovieRoute> routes() {
    return [
      MovieRoute('/', Handler(handlerFunc: (_, __) => HomeView()))
    ];
  }

}