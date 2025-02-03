import 'package:app_movies/infrastructure/auth/auth.interceptor.dart';
import 'package:app_movies/infrastructure/configuration/global.configuration.dart';
import 'package:app_movies/infrastructure/http/authority_strategy/http_authority.strategy.dart';
import 'package:app_movies/infrastructure/http/http.interceptor.dart';

class MovieDBAuthorityStrategy extends HttpAuthorityStrategy {
  MovieDBAuthorityStrategy()
      : super(authority: GlobalMovieConfiguration.controller.apiServer);

  @override
  void interceptorsInitialize() {
    addInterceptor(HttpContentTypeInterceptor());
    addInterceptor(AuthenticationInterceptor());
  }
}
