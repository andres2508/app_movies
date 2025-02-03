import 'package:fluro/fluro.dart';

class TMDBRoute {
  String path;
  Handler handler;

  TMDBRoute(this.path, this.handler);
}

abstract class TMDBModule {
  List<TMDBRoute> routes();
}
