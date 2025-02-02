import 'package:fluro/fluro.dart';

class MovieRoute {
  String path;
  Handler handler;

  MovieRoute(this.path, this.handler);
}

abstract class MovieModule {
  List<MovieRoute> routes();
}
