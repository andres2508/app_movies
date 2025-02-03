import 'package:app_movies/framework/router/movie.module.dart';
import 'package:app_movies/ui/home/home.view.dart';
import 'package:fluro/fluro.dart';

class HomeModule extends TMDBModule {
  @override
  List<TMDBRoute> routes() {
    return [TMDBRoute('/', Handler(handlerFunc: (_, __) => HomeView()))];
  }

}